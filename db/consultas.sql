-- Al usar booleano se tomara como 1=SI y 0=NO --


#consulta 1.2 consulta que retorna el numero de veces que fue alquilado un carro por id de carro con fecha de alquiler
#se asume que solo se desea el conteo
SELECT Count(1) AS "veces alquilado" FROM Carro
JOIN Alquiler ON Carro.Carroid=Alquiler.Carroid where Carro.Carroid=1 and Alquiler.Fecha > "2009-01-28";

#consulta 1.3 consulta que retorna el total de saldo tomado de la tabla alquiler en una fecha especifica
#se asume que el saldo total es la suma de los saldos en ese dia
SELECT SUM(SALDO) AS "TOTAL" FROM Alquiler where  Fecha = "2009-02-02";
 
#consulta 1.4
SELECT Cedula, Nombre, Fecha AS "Fecha Alquiler",tiempo AS "Tiempo Alquilado", Saldo, Placa, Marca  FROM Alquiler
JOIN Carro ON Carro.Carroid=Alquiler.Carroid 
JOIN Cliente ON Alquiler.Clienteid = Cliente.Clienteid;

#consulta 1.5
#se asume que debe retornar todo el objeto cliente
select * from cliente where clienteid not IN (
select distinct Alquiler.clienteid from Alquiler where Fecha  between "2009-02-01" and "2009-02-06");

#consulta 1.6
select Alquiler.fecha AS "Fecha Alquiler",Count(1) AS "Cuantos Pagos",SUM(Valor) AS "Total Pagado",MAX(Valor) AS "Maximo Valor"  from Alquiler
join Pagos ON pagos.alquilerid = Alquiler.alquilerid
group by alquiler.fecha; 

#consutla 1.7
#se asume que codcarro hace referencia al id del objeto carro
#se asume que la columna de total de alquileres resulta de la suma de la columna de ValorTotal de la tabla alquiler
select Carro.Carroid AS "codcarro", modelo, marca,Carro.costo,count(1) AS "cuantos alquileres",SUM(ValorTotal) AS "Total en alquileres" from Carro
join Alquiler ON Alquiler.Carroid = Carro.Carroid
group by Carro.carroid;

#consulta 1.8
# retorna todo el objeto alquiler
select Alquilerid, Fecha, Tiempo, ValorTotal, Saldo, AbonoInicial, Devuelto, Carroid, Alquiler.Clienteid from Cliente
join Alquiler ON alquiler.clienteid = Cliente.clienteid
order by  fecha
LIMIT 1;
