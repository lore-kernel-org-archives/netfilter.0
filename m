From: Leonardo Carneiro <lscarneiro@veltrac.com.br>
Subject: access problem
Date: Mon, 16 Mar 2009 16:41:05 -0300
Message-ID: <49BEAB51.9070406@veltrac.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi everyone.

I'm new in the list and hope have a nice time here.
First of all, sorry about my poor enlgish, i'm from Brasil.

I've got a standard scenario with a private network (192.168.1.0/24) 
beeing natted by a internet server (192.168.1.1) running iptables 1.3.0.

In the private network I have a application server (192.168.1.2) running 
a service on port 5222. The port is properly forwarded in internet 
server, and users across the internet can access the service through the 
public IP of the internet server.

Users on the private network can access the service through the private 
IP of the server, but cannot access using the public ip. Accessing using 
the public ip would be very usefull, since lots of users have notebooks 
and they access the service inside and outside the private network

those are interface infos and the rules forwarding the port to the 
application server:
eth0: public IP
eth1: private network, 192.168.1.1

iptables -A PREROUTING -p tcp -m tcp -d [private_ip] -i eth0 --dport 
5222 -j DNAT --to-destination 192.168.1.2
iptables -A FORWARD -p tcp -m tcp -d 192.168.1.2 -i eth0 -o eth1 --dport 
5222 -j ACCEPT

I've done some tests, adding some rules like

iptables -A PREROUTING -p tcp -m tcp -d [private_ip] -i eth1 --dport 
5222 -j DNAT --to-destination 192.168.1.2
iptables -A FORWARD -p tcp -m tcp -d 192.168.1.2 -i eth0 -o eth1 --dport 
5222 -j ACCEPT

or just

iptables -A PREROUTING -p tcp -m tcp -d [private_ip] -i eth1 --dport 
5222 -j DNAT --to-destination 192.168.1.2

but i just cannot connect using the public ip =S

sometimes the server answer the request, but using the private ip, no 
the public ip requested by the host, and sometimes the server just not 
answer the request.

any ideas how can i solve this?

tks in advance.


