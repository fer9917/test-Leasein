import { useState, useCallback, useEffect } from 'react';

import {
	IonCard,
	IonLabel,
	IonCardHeader,
	IonCardTitle,
	IonCardContent,
	IonInput,
	IonList,
	IonItem,
	IonButton,
	IonSelectOption,
	IonSelect,
} from '@ionic/react';

import { Alert, api } from '../components/api';

const Crear_Unidad = () => {
	/* Hooks
	======================================== */
	const [asesores, setAsesores] = useState(null)
	const [clientes, setClientes] = useState(null)
	const [unidades, setUnidades] = useState(null)
	const [datos, setDatos] = useState({
		id_cliente: '',
		id_asesor: '',
		id_unidad: '',
	});

	/* Functions
	======================================== */
	// Function that ejecute when the user write an input
	const updateData = (e) => {
		setDatos({
			...datos,
			[e.target.name]: e.target.value
		});
	}

	const submit = (e) => {
		e.preventDefault()

		if(datos.id_cliente === '' || datos.id_asesor === '' || datos.id_unidad === ''){
			Alert("Debes llenar todos los campos")

			return;
		}

		console.log('submit', datos);

		api({
			...datos,
			url: 'unidades',
			type: 'post',
		}).then((res) => {
			console.log('res', res);

			if (!res) {
				// Show error
				Alert("Ocurrió un error, revisa la información.")

				return;
			}

			// Limpia el formulario
			setDatos({
				id_cliente: '',
				id_asesor: '',
				id_unidad: '',
			})

			window.location.reload();
		}).catch((err) => {
			console.log('err', err);

			// Show error
			Alert("Ocurrió un error, revisa la información."+err)
		})
	}

	// Get asesores desde API
	const getAsesores = useCallback(() => {
		console.log('getAsesores')

		// Get local asesores
		const string_asesores = localStorage.getItem("_asesores")
		if (string_asesores) {
			const local_asesores = JSON.parse(string_asesores)

			setAsesores(local_asesores)

			return
		}

		// Get asesores desde API
		api({
			url: 'asesores',
		}).then((resp) => {
			console.log('resp', resp);

			// Set asesores
			if (resp.length > 0) {
				setAsesores(resp)

				// Guarda asesores en local
				localStorage.setItem("_asesores", JSON.stringify(resp));
			}
		}).catch((err) => {
			Alert("Ocurrió un error, revisa la información." + err)
		})
	}, [])

	// Get cliente desde API
	const getClientes = useCallback(() => {
		console.log('getClientes')

		// Get local clientes
		const string_clientes = localStorage.getItem("_clientes")
		if (string_clientes) {
			const local_clientes = JSON.parse(string_clientes)

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
				setClientes(resp)

				// Guarda clientes en local
				localStorage.setItem("_clientes", JSON.stringify(resp));
			}
		}).catch((err) => {
			Alert("Ocurrió un error, revisa la información." + err)
		})
	}, [])

	// Get unidades desde API
	const getUnidades = useCallback(() => {
		console.log('getUnidades')

		// Get unidades desde API
		api({
			libre: true,
			url: 'unidades',
		}).then((resp) => {
			console.log('resp', resp);

			// Set unidades
			if (resp.length > 0) setUnidades(resp)
		}).catch((err) => {
			Alert("Ocurrió un error, revisa la información." + err)
		})
	}, [])

	/* Observers
	======================================== */
	useEffect(() => {
		if (!asesores) getAsesores()
		if (!clientes) getClientes()
		if (!unidades) getUnidades()
	}, [asesores, getAsesores, clientes, getClientes, unidades, getUnidades])

	return (
		<div style={{ textAlign: 'center' }}>
			<IonCard>
				<IonCardHeader>
					<IonCardTitle>Agregar unidad</IonCardTitle>
				</IonCardHeader>
				<IonCardContent style={{ textAlign: 'left' }}>
					<form onSubmit={e => submit(e)}>
      					<IonItem>
							{!asesores ? <></> :
								<IonSelect
									onIonChange={e => updateData(e)}
									value={datos.id_asesor}
									placeholder="Asesor"
									required={true}
									name="id_asesor"
								>
									{asesores.map((value, key) => {
										return (
											<IonSelectOption key={'asesor_'+key} value={value.id}>{value.nombre}</IonSelectOption>
										)
									})}
								</IonSelect>
							}
						</IonItem>
      					<IonItem>
							{!clientes ? <></> :
								<IonSelect
									onIonChange={e => updateData(e)}
									value={datos.id_cliente}
									placeholder="Cliente"
									required={true}
									name="id_cliente"
								>
									{clientes.map((value, key) => {
										return (
											<IonSelectOption key={'add_cliente'+key} value={value.id}>{value.empresa}</IonSelectOption>
										)
									})}
								</IonSelect>
							}
						</IonItem>
      					<IonItem>
							{!unidades ? <></> :
								<IonSelect
									onIonChange={e => updateData(e)}
									value={datos.id_unidad}
									placeholder="Unidad"
									required={true}
									name="id_unidad"
								>
									{unidades.map((value, key) => {
										return (
											<IonSelectOption key={'unidad_'+key} value={value.id}>{value.codigo}</IonSelectOption>
										)
									})}
								</IonSelect>
							}
						</IonItem>
						<br />
						<IonButton fill="outline" color="primary" expand="block" type="submit">
							Guardar
						</IonButton>
					</form>
				</IonCardContent>
			</IonCard>
		</div>
	);
}

export default Crear_Unidad;
