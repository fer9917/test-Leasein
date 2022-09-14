import { useState, useEffect, useCallback } from 'react';
import {
	IonList,
	IonItem,
	IonLabel,
} from '@ionic/react';

import { Alert, api, NoData } from '../components/api';

const Unidades_Cliente = ({ id_cliente = false }) => {
	/* Hooks
	======================================== */
	const [unidades, setUnidades] = useState()

	/* Functions
	======================================== */
	// Get unidades desde la API
	const getUnidades = useCallback(() => {
		console.log('getUnidades')

		// Get API unidades
		api({
			url: 'unidades?id_cliente=' + id_cliente,
		}).then((resp) => {
			console.log('resp', resp);

			// Set unidades
			if (resp.length > 0) setUnidades(resp)
		}).catch((err) => {
			// Show error
			Alert("Ocurrió un error, revisa la información." + err)
		})
	}, [])

	/* Observers
	======================================== */
	useEffect(() => {
		if (!unidades) getUnidades()
	}, [unidades, getUnidades])

	return (<>
		{!unidades ? <NoData /> : <>
			{unidades.map((value, key) => {
				return (
					<IonItem>
						<IonLabel className="ion-text-wrap">
							<b>Código:</b> {value.codigo} {' '}
							| <b>Tipo de UA:</b> {value.tipo_de_ua}  {' '}
							| <b>Marca:</b> {value.marca}  {' '}
							| <b>Procesador:</b> {value.procesador}  {' '}
							| <b>Generación:</b> {value.generacion} {' '}
						</IonLabel>
					</IonItem>
				)
			})}
		</>}
	</>);
};

export default Unidades_Cliente;