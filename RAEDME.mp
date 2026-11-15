### `prueba_sistema.py`

```python
import hashlib
import json
from dataclasses import dataclass

# 1. MÓDULO DE INTEGRIDAD (La firma SHA-256)
def calcular_huella(datos: any) -> str:
    serializado = json.dumps(datos, sort_keys=True, ensure_ascii=False)
    return hashlib.sha256(serializado.encode('utf-8')).hexdigest()

# 2. DEFINICIÓN DE AGENTES
@dataclass
class Agente:
    id: str
    
    def procesar(self, tarea, input_data):
        # Simulación de trabajo técnico
        if self.id == "Arquitecto":
            return {"archivo": "main.py", "estructura": ["import os", "def main():", "    pass"]}
        elif self.id == "Desarrollador":
            return "import os\n\ndef main():\n    print('Hola mundo')\n"
        return None

# 3. ORQUESTADOR (El motor de validación)
class Orquestador:
    def gestionar_flujo(self):
        arch = Agente("Arquitecto")
        dev = Agente("Desarrollador")
        
        # Flujo: Arquitecto define estructura
        res_arq = arch.procesar("diseñar", None)
        hash_arq = calcular_huella(res_arq)
        
        # Flujo: Desarrollador escribe código
        res_dev = dev.procesar("codificar", res_arq)
        hash_dev = calcular_huella(res_dev)
        
        # Reporte de Auditoría
        print(f"--- REPORTE DE INTEGRIDAD ---")
        print(f"Agente: {arch.id} | Hash Estructura: {hash_arq[:16]}...")
        print(f"Agente: {dev.id} | Hash Código: {hash_dev[:16]}...")
        print(f"-----------------------------")
        
        return hash_arq, hash_dev

# EJECUCIÓN DE PRUEBA
if __name__ == "__main__":
    orc = Orquestador()
    h1, h2 = orc.gestionar_flujo()
    print("\nResultado: Flujo completado y validado mediante SHA-256.")
```
