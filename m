From: Simone Sestini <simone.sestini@plugit.net>
Subject: NAT with specific IP Address
Date: Thu, 16 May 2002 18:32:38 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <5.1.0.14.0.20020516181628.00aa49a0@imap4.plugit.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="=====================_1411435156==_.ALT"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

--=====================_1411435156==_.ALT
Content-Type: text/plain; charset="us-ascii"; format=flowed

Hello all

I need to do a complicated configuration of NAT over that iptables.
I have varius Network Access Server under Linux with PPP interfaces.
Each time a client connect to one of these machines the final user will 
receive an IP like 10.10.x.x.
Now.. These NAS server has a static defualt routing to a specific server, 
another LINUX server that will be able to perform all the NAT translation 
and all.
The NAT server will have two interface, one with Public IP and one with 
Private IP.
I had to route 2 Class C network to the NAT server.

I have to configure NAT on a specific way.


                     NAT - Server                                        NAS 1

                 OSPF                                            OSPF

         Eth 1                   Eth 
2     <------->    Eth1                             pppxy
   195.1.1.1/24            192.168.1.1/24                192.168.1.2/24 
              10.20.0.1

   195.100.100.0/24
   195.100.200.0/24

I have no problem to run ospf and route all the traffic from ppp 
(10.20.0.1) connections to the NAT server 192.168.1.1.

In the NAT and NAS servers will run a OSPFD damon.. that because i will 
route automatically each connected subnets

Now.. On NAT machine i route the 2 C class, 195.100.100.0 and 195.100.200.0 
both /24

I want to configure a NAT that permit me to say.. from 10.20.0.1 to 
10.20.0.254 and 10.20.1.1 to 10.20.1.254 has to NAT using External IP 
195.100.100.1.

ppp from 10.20.2.1 to 10.20.2.254 and 10.20.3.1 to 10.20.3.254 has to NAT 
using External IP 195.100.100.2 and so on..

I have configured two CISCO 3640 router that do that without problems but i 
have to use a Linux machine instaed of that.

Here is the router configuration string that permit to do that.. so much 
ppl will understand better.

ip nat pool rete10.20.0.0 195.100.100.1 195.100.100.1 prefix-length 24
ip nat pool rete10.20.2.0 195.100.100.2 195.100.100.2 prefix-length 24
ip nat inside source list nas-100-1 pool rete10.20.0.0 overload
ip nat inside source list nas-100-2 pool rete10.20.2.0 overload
ip access-list standard nas-100-1
  permit 10.20.0.0 0.0.1.255
ip access-list standard nas-100-2
  permit 10.20.2.0 0.0.1.255


How can i tell iptables to use a specific IP address for NAT other specific 
IP addresses ?
There will be any troubles with OSPF protocol over NAT ?

Thanks in advice for any idea and suggestions !!




Simone Sestini
Plug IT s.p.a.
System and Network Administrator
Data Transmission Manager
Via G. Ferraris, 216 - 52100 Arezzo
ITALY

Fax:       +39 199 440088
Email:   simone.sestini@plugit.net

----------

--=====================_1411435156==_.ALT
Content-Type: text/html; charset="us-ascii"

<html>
Hello all<br><br>
I need to do a complicated configuration of NAT over that iptables.<br>
I have varius Network Access Server under Linux with PPP 
interfaces.<br>
Each time a client connect to one of these machines the final user will
receive an IP like 10.10.x.x.<br>
Now.. These NAS server has a static defualt routing to a specific server,
another LINUX server that will be able to perform all the NAT translation
and all.<br>
The NAT server will have two interface, one with Public IP and one with
Private IP.<br>
I had to route 2 Class C network to the NAT server.<br><br>
I have to configure NAT on a specific way.<br><br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
NAT -
Server<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>NAS
1<br><br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>OSPF<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>OSPF<br><br>
<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Eth
1<x-tab>&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>Eth
2&nbsp;&nbsp;&nbsp;&nbsp; &lt;-------&gt;&nbsp;&nbsp;&nbsp;
Eth1<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>pppxy<br>
&nbsp;
195.1.1.1/24&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
192.168.1.1/24<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>192.168.1.2/24<x-tab>&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab><x-tab>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>10.20.0.1<br><br>
&nbsp; 195.100.100.0/24<br>
&nbsp; 195.100.200.0/24<br><br>
I have no problem to run ospf and route all the traffic from ppp
(10.20.0.1) connections to the NAT server 192.168.1.1.<br><br>
In the NAT and NAS servers will run a OSPFD damon.. that because i will
route automatically each connected subnets<br><br>
Now.. On NAT machine i route the 2 C class, 195.100.100.0 and
195.100.200.0 both /24<br><br>
I want to configure a NAT that permit me to say.. from 10.20.0.1 to
10.20.0.254 and 10.20.1.1 to 10.20.1.254 has to NAT using External IP
195.100.100.1.<br><br>
ppp from 10.20.2.1 to 10.20.2.254 and 10.20.3.1 to 10.20.3.254 has to NAT
using External IP 195.100.100.2 and so on..<br><br>
I have configured two CISCO 3640 router that do that without problems but
i have to use a Linux machine instaed of that.<br><br>
Here is the router configuration string that permit to do that.. so much
ppl will understand better.<br><br>
ip nat pool rete10.20.0.0 195.100.100.1 195.100.100.1 prefix-length
24<br>
ip nat pool rete10.20.2.0 195.100.100.2 195.100.100.2 prefix-length
24<br>
ip nat inside source list nas-100-1 pool rete10.20.0.0 overload<br>
ip nat inside source list nas-100-2 pool rete10.20.2.0 overload<br>
ip access-list standard nas-100-1<br>
&nbsp;permit 10.20.0.0 0.0.1.255<br>
ip access-list standard nas-100-2<br>
&nbsp;permit 10.20.2.0 0.0.1.255<br><br>
<br>
How can i tell iptables to use a specific IP address for NAT other
specific IP addresses ?<br>
There will be any troubles with OSPF protocol over NAT ?<br><br>
Thanks in advice for any idea and suggestions !!<br><br>
<br><br>
<x-sigsep><p></x-sigsep>
<font color="#0000FF"><b>Simone Sestini<br>
</b>Plug IT s.p.a.<br>
System and Network Administrator<br>
Data Transmission Manager<br>
Via G. Ferraris, 216 - 52100 Arezzo <br>
ITALY<br><br>
Fax:<x-tab>&nbsp;&nbsp;&nbsp;&nbsp;</x-tab>&nbsp;&nbsp; +39 199
440088<br>
Email:&nbsp;&nbsp; simone.sestini@plugit.net<br>
<hr>
</font></html>

--=====================_1411435156==_.ALT--


