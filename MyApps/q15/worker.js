function factorial(val){
	if(val<=1) return 1;
	return val*factorial(val-1);
}

self.onmessage= (event) => {
//const result= factorial(event.data);
const arr= new Array(event.data+1);
for (let i=0;i<=event.data;i++)
	arr[i]= factorial(i);

for (let i=1; i<=event.data;i++) 
	console.log(arr[i]);
self.postMessage(arr );
}

