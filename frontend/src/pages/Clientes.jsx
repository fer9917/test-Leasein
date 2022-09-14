import { useState, useEffect, useCallback } from 'react';
import {
	add,
} from 'ionicons/icons';
import {
	IonCard,
	IonLabel,
	IonTitle,
	IonHeader,
	IonToolbar,
	IonCardContent,
	IonIcon,
	IonSearchbar,
	IonModal,
	IonItem,
	IonContent,
	IonCardHeader,
	IonCardTitle,
	IonFabButton,
	IonFab,
	IonButtons,
	IonButton,
} from '@ionic/react';

import { Alert, api, NoData } from '../components/api';
import Unidades_Cliente from './Unidades_Cliente';
import CrearUnidad from './Crear_Unidad';

const Clientes = () => {
	/* Hooks
	======================================== */
	const [todosClientes, setTodosClientes] = useState(null)
	const [clientes, setClientes] = useState(null)
	const [verCliente, setVerCliente] = useState(false);
	const [buscar, setBuscar] = useState('')
	const [cliente, setCliente] = useState({
		id: '',
		asesor_id: '',
		empresa: '',
		sector: '',
		tamano: '',
	})

	/* Funciones
	======================================== */
	// Get cliente desde API
	const getClientes = useCallback(() => {
		console.log('getClientes')

		// Get local clientes
		const string_clientes = localStorage.getItem("_clientes")
		if (string_clientes) {
			const local_clientes = JSON.parse(string_clientes)

			setTodosClientes(local_clientes)
			setClientes(local_clientes)

			return
		}

		// Get clientes desde API
		api({
			url: 'clientes',
		}).then((resp) => {
			console.log('resp', resp);

			// Set clientes
			if (resp.length > 0) {
				setTodosClientes(resp)
				setClientes(resp)

				// Garda clientes en local
				localStorage.setItem("_clientes", JSON.stringify(resp));
			}
		}).catch((err) => {
			Alert("Ocurrió un error, revisa la información." + err)
		})
	}, [])

	const buscarClientes = (e) => {
		const search = e.detail.value

		setBuscar(search)

		// Búsqueda vacía regresa todos los clientes
		if (search === '') {
			setClientes(todosClientes)

			return
		}

		// Filtra los clientes por busqueda
		const _clientes = todosClientes.filter((cliente) => {
			if (cliente.empresa.toLowerCase().includes(search.toLowerCase())) return true
			if (cliente.sector.toLowerCase().includes(search.toLowerCase())) return true
			if (cliente.tamano.toLowerCase().includes(search.toLowerCase())) return true

			// Not match
			return false
		})
		setClientes(_clientes)
	}

	// Muestra las unidades del cliente
	const showCliente = (cliente) => {
		setCliente(cliente)
		setVerCliente(true)
	}

	/* Observers
	======================================== */
	useEffect(() => {
		if (!clientes) getClientes()
	}, [clientes, getClientes])

	return (<IonContent>
		<CrearUnidad />
		{/* <IonFab fill="outline" vertical="bottom" horizontal="end">
			<IonFabButton >
				<IonIcon icon={add} />
			</IonFabButton>
		</IonFab> */}
		{!clientes ? <NoData /> :
			<div>
				<IonModal isOpen={verCliente} onWillDismiss={() => setVerCliente(false)}>
					<IonHeader>
						<IonToolbar>
							<IonTitle>Unidades del cliente</IonTitle>
							<IonButtons slot="end">
								<IonButton onClick={() => setVerCliente(false)}>X</IonButton>
							</IonButtons>
						</IonToolbar>
					</IonHeader>
					<IonCard>
						<IonCardContent style={{ textAlign: 'left' }}>
							<Unidades_Cliente id_cliente={cliente.id} />
						</IonCardContent>
					</IonCard>
				</IonModal>
				<IonSearchbar
					onIonChange={e => buscarClientes(e)}
					placeholder="Buscar cliente"
					value={buscar}
					animated={true}
				>
				</IonSearchbar>
				{clientes.map((value, key) => {
					return (
						<IonItem key={key} onClick={() => showCliente(value)}>
							<IonLabel>{value.empresa} | {value.sector} | {value.tamano}</IonLabel>
						</IonItem>
					)
				})}
			</div>
		}
	</IonContent>);
};

export default Clientes;