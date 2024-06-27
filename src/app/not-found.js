// not-found.js
import styles from './not-found.module.css';

export default function NotFound() {
  return (
    <div className={styles.container}>
      <h1 className={styles.title}>Oops, parece que esta página no existe</h1>
      <p>Lo sentimos, no pudimos encontrar la ruta de API que buscabas.</p>
      <a href="/" className={styles.link}>Volver al inicio</a>
    </div>
  );
}
