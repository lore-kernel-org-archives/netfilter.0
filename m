From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Ip handling
Date: Wed, 18 Jun 2003 10:37:50 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122DDB@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: mick <mick@mohawkplastics.com>, netfilter@lists.netfilter.org

If you can connect from your local machine to your program, can you add:

iptables -t nat -A PREROUTING -j DNAT -i <external_ip> -p tcp --dport
5999 --to-destination <firewall_internal_ip>=20

iptables -t nat -A POSTROUTING -j SNAT -i <external_ip> -p tcp --dport
5999 --to-source <firewall_internal_ip>

Although, I am not 100% sure that the firewall will reach prerouting if
it is internally redirected to lo...

Barring that, you may need to setup a raw proxy process that just
forwards the packets from port abc to 5999. In that case, you would have
a program listening on a predefined port; let's assume the port is 5998
for this example.

To wire the iptables to connect to the proxy program, connect:=20

iptables -t nat -A PREROUTING -j DNAT -i <external_ip> -p tcp --dport
5999 --to-destination <external_ip>:5998

myproxyprogram --lhost <external_ip> --lport 5998 --dhost <external_ip>
--dport 5999


Of course this and all strategies will blow up if this authentication
daemon sends ip/port numbers as a check on the integrity of the
connection... I hate those programs!!!



-----Original Message-----
From: mick [mailto:mick@mohawkplastics.com]=20
Sent: Wednesday, June 18, 2003 9:54 AM
To: netfilter@lists.netfilter.org
Subject: Ip handling

I have a delema and i'm not sure how to handle it.=20
I run a login server on port 5999 that does authentication based on IP
address. So when someone with a dynamic internet connection tries to
login with a differnt IP then the registered one, The login server
rejects them.
I am not good enough with Iptables to know if it is possible or not but
is there some way to make it so all connections to that PORT(5999)
appear to come from my Local network 192.168.0

The other method i thought about was running my authentication/login
server on another machien behind the firewall. but i think i would have
to make all packets coming from the inter net to that port appear to
come from the local network prior to forwarding them to the Other
server. both of which i am unsure how to accomplish.=20

The Authentication server is a binary that is not linux/unix nativly so
at this time i can not recode it and remove the IP matching function.
Any help with this problem is greatly appreciated.
Mick


Does anyone know of a way to make say all connections from the outside
going to my outside IP address Appear to be coming from my local lan of
192.168.0.1 =20








