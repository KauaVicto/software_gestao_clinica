import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Cadastro_paciente from '../views/cadastro_paciente.vue'

const router = createRouter({
	history: createWebHistory(),
	routes: [
		{
			path: '/',
			component: Home
		},
		{
			path: '/paciente',
			component: () => import('../views/Paciente.vue')
		},
		{
			path: '/team',
			component: () => import('../views/Team.vue')
		},
		{
			path: '/contact',
			component: () => import('../views/Contacte.vue')
		},
		{
			path: '/login',
			component: Login
		},
		{
			path: '/cadastro_paciente',
			component: Cadastro_paciente
		},
	],
})

export default router