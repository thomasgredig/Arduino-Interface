# install Serial Library
library(serial)

# Start program in Arduino and find port
con <- serialConnection(name = "testcon",port = "cu.usbserial-DA00VRGH"
                        ,mode = "9600,n,8,1"
                        ,newline = 1
                        ,translation = "crlf"
)

c=0
# open connection and output data
open(con)
while(c<100) {
  a = read.serialConnection(con)
  if(!is.null(a)) {
    print(paste(a," - "))
    c = c+1;
  }
}

close(con)

