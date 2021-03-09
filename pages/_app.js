import { setup } from 'twind';
import twindConfig from '../twind.config';

export { default } from 'src/App.js';

if (typeof window !== 'undefined') {
  setup(twindConfig);
}
