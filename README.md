Se han creado los dos tests para el datasource

- testThatTableHasSectionNumberEqualToCurrenciesAddingOne
- testThatNumberOfCellsForSectionIsNumberOfMoneysPlusOne 

A parte de alguno más que se ha creido necesario durante el desarrollo para asegurarme de que las cosas iban funcionando.

--- 
**Objetivo**

Se presenta una tabla con una sección por divisa, cuya última celda es el total de cada divisa. Existe una sección más que es el total acumulado de todas las Moneys en todas las divisas transformado a EUR.

**UI**

La idea es que en la clase Wallet se van añadiendo Moneys y se permite añadir y eliminar (add/take), mediante UI (botón Add (que presenta una ventana para añadir un money) y swipe en la celda (para borrar un money en cuestión)).

**Alguna cosa más**

El número de divisas y de celdas en cada una de la sección, se calcula sobre los elementos que hay añadidos en el Wallet.
Se podría añadir más rates y métodos de clase para otras divisas y, con la implementación actual, se mostrarían en la tabla sin problemas. (Habría que hacer pequeñas modificaciones de UI y código).

Para inicializar tanto Wallet como Broker en el TableViewController, se hace un Lazy init (donde se establece el cambio 1EUR:2USD).

