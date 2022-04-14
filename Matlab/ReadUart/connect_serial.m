clear s;
disp("scanning for ports")
serialportlist("available")

portname=input("input name of port: ",'s');

s = serialport(portname,115200,'StopBits',2,'FlowControl','hardware');