#Encabezado

archivo="Monitoreo.txt"
echo "Tiempo, %Total CPU libre, %Memoria Libre, %Disco Libre" > $archivo

for i in {1..5}
do
#Tiempo en segundo
 tiempo=$(($i * 60))

#Calculo del uso de cpu 
 cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $2}')

#Calculo del uso de Ram
 memoria=$(free | grep Mem | awk '{print $4/$2 * 100}' )

#Calculo uso del disco
 disco=$(df -h / | grep '^/' | awk '{print $5}' | sed 's/%//')

 echo "$tiempo, $cpu, $memoria, $disco" >> $archivo

 sleep 60
done

