From: =?utf-8?Q?Mart=C3=ADn?= <martin@familia-fiumara.com.ar>
Subject: redirection trouble
Date: Mon, 03 Nov 2003 22:53:33 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <oprx3bjjmldpszyy@192.168.2.1>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

This is the situation:



           Internal LAN machine (192.168.2.5)
                          |
                          |
                          |
(eth1 192.168.2.1) NAT LINUX ( eth0 192.168.1.10 > adsl ppp0 IP dinamic)
                          |
                          |
                          |
             Server 200.45.45.200 (service at port 10000)



This is what I intend to do:
For particular reasons, I need that a soft at 192.168.2.5 comunicate with a=
=20
server with a service at port 10000 (UDP), but this can=C2=B4t be done thro=
ugh=20
normal NAT. So i want to establish a link between both (server and=20
192.168.2.5) manually useing the NAT LINUX
So, 192.168.2.5 comunicates to 192.168.2.1 port 10000, the NAT LINUX=20
redirect this traffic to the server 200.45.45.200 port 10000. The server=20
will respond to the NAT LINUX who will redirect this traffic to 192.168.2.5=
=20
(port 10000 also)
I try to do all this in this way:


iptables -t nat -I PREROUTING 1 -i eth1 -d 192.168.2.1 -p udp --dport 10000=
=20
-j DNAT --to 200.45.45.200

iptables -t nat -I POSTROUTING 1 -o eth0 -p udp --dport 10000 -j SNAT --to =

192.168.2.5


BUT THIS IS NOT WORKING. I GET A MESSAGE FROM THE SOFT AT 192.168.2.5=20
TELLING "CONNECTION TIMED OUT"... USEING TCPDUMP i get this as the only=20
thing comeing back...:

200.45.45.200.10000 > 168.226.174.184.10000:  udp 8 [tos 0x40]



I would apreciate any help with this trouble
Thanks






