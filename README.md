# Poryecto-2. Procesador RISC Uniciclo

**Estudiantes:**
- Fernandez Aguilar Randy Steve  
- Matarrita Hernandez Nayeli  
- Quiros Avila Karina  
- Tencio Valverde Yonaikel Fabricio

Este proyecto implementa un procesador RISC uniciclo en SystemVerilog, diseñado para ejecutar instrucciones en un solo ciclo de reloj. El procesador incluye los principales componentes de una arquitectura RISC: unidad de control, ALU, banco de registros, memorias de instrucciones y datos, multiplexores y contador de programa.

## Características

- Arquitectura uniciclo: todas las fases (fetch, decode, execute, memory, write-back) ocurren en un solo ciclo.
- Unidad de control combinacional para decodificación de instrucciones.
- ALU con soporte para operaciones aritméticas y lógicas.
- Banco de registros de lectura y escritura dual.
- Soporte para instrucciones tipo R, I y de salto básico.
- Memoria de instrucciones y memoria de datos separadas.
- Simulación y verificación con testbenches y archivos `.vcd`.

## Archivos principales

- `Procesador_RISC.sv`: integración del procesador completo.
- Módulos: `ALU`, `Control_Unit`, `RegisterBank`, `InstructionMemory`, `DataMemory`, `Multiplexor`, `PC`, `ShiftUnit`, `SumaC2`.
- Testbenches individuales para cada módulo.

## Simulación

Cada módulo tiene su propio archivo de prueba y traza de simulación (`.vcd`). Se recomienda verificar cada componente de forma independiente antes de ejecutar el procesador completo.

