import { compilePack } from '@foundryvtt/foundryvtt-cli';
import { promises as fs } from 'fs';

const MODULE_ID = process.cwd();
const yaml = false;

const packs = await fs.readdir('./mod/src/packs');
for (const pack of packs) {
  if (pack === '.gitattributes') continue;
  console.log('Packing ' + pack);
  await compilePack(
    `${MODULE_ID}/mod/src/packs/${pack}`,
    `${MODULE_ID}/mod/packs/${pack}`,
    { yaml }
  );
}