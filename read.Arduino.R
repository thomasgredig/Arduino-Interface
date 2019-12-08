# install Serial Library
library(serial)

# Start program in Arduino and find port
# in this case the result from A0 is sent
con <- serialConnection(name = "test",
                        port = "cu.usbserial-DA00VRGH",
                        mode = "9600,n,8,1",
                        newline = 1, 
                        buffering = "none",
                        translation = "auto"
)

c=0
# open connection and output data
open(con)
r= c()
while(c<100) {
  a = read.serialConnection(con)
  if(!is.null(a)) {
    print(paste0("[",a,"]"))
    a1 = as.numeric(a)
    if (a1>=0 & a1<=1023) {
      r = c(r,a1)
      c = c+1;
    }
  }
}

close(con)

plot(r)