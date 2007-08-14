From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: error - but I don't know where....
Date: Tue, 14 Aug 2007 13:02:25 +0200
Message-ID: <46C18BC1.3010600@freemail.hu>
References: <42a76351.4ca18173.46c17ceb.6b792@o2.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42a76351.4ca18173.46c17ceb.6b792@o2.pl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: warpme <warpme@o2.pl>
Cc: piotr.oniszczuk@aster.pl, netfilter@lists.netfilter.org

warpme =EDrta:
> Hi *
>
> I just try setup firewall. Config is following:
>
> Desktop               Firewll =20
> (192.168.1.1) ------Eth0   Eth1(91.189.74.10)---------ISP
>
> Script below is working OK for all LAN hosts, but not for for firewall =
PC itself (i tested it with i.e. ping www.ibm.com)
> Commenting line "iptables -P INPUT DROP" allows to ping from firewall, =
but it effectivelly turning off firewall....
> It is probably simple error - but I can't find where it is...
> Can somebody verify thid script and tell me what is wrong ?
>
> thx in advance
>  =20
>
> #Config area BEGIN-----------------------------------------------------=
---------
>
> LAN_intf=3Deth0
> LAN_subnetwork=3D192.168.1.0/255.255.255.0
>
> WAN_intf=3Deth1
> WAN_ip=3D91.189.74.10
>
> Open_WAN_TCP_ports=3D20,21,80,500,1352,4500
> Open_WAN_UDP_ports=3D500,1352,4500,5060
> Open_WAN_RTP_port_range=3D7070:7080
>
>
> #Config area END-------------------------------------------------------=
---------
>
>
>
>
> #--Flushing all iptables tables----------------------------------------=
---------
> iptables -F
> iptables -X=20
> iptables -t nat -F
> iptables -t nat -X
> iptables -t mangle -F
> iptables -t mangle -X
>
>
>
>
> #--Setting up SNAT for outgoing to WAN DATA connections----------------=
--------
> iptables -t nat -A POSTROUTING -s $LAN_subnetwork -o $WAN_intf -j SNAT =
--to-source $WAN_ip=20
I would write like this:

iptables -t nat -A POSTROUTING ! -s $WAN_ip -o $WAN_intf -j SNAT=20
--to-source $WAN_ip
>  =20
> #--Allowing self access by loopback interface--------------------------=
--------
> iptables -A INPUT -i lo -p all -j ACCEPT
>
>  =20
"-p all" not needed...  And I would rather set up the OUTPUT rule than=20
the INPUT rule because the "lo" interface only accepts connections from=20
itself... if a new connection is made then first step is to send OUT=20
something to the other host... :D
iptables -A OUTPUT -o lo -j ACCEPT
>
> #--Allowing local access to LAN----------------------------------------=
--------
> iptables -A INPUT -i $LAN_intf -p all -j ACCEPT
>
>  =20
no need for "-p all"
>
> #--Allowing WAN incoming traffic form already established connections--=
--------
> iptables -A INPUT -i WAN_intf -m state --state ESTABLISHED,RELATED -j A=
CCEPT
>
>
> #--Allowing WAN incoming traffic for desired services------------------=
--------
> #Open WAN TCP ports
> iptables -A INPUT -p tcp -i $WAN_intf -m multiport --dport $Open_WAN_TC=
P_ports -j ACCEPT
>
> #Open WAN UDP ports
> iptables -A INPUT -p udp -i $WAN_intf -m multiport --dport $Open_WAN_UD=
P_ports -j ACCEPT
>
> #Open VoIP UDP port ranges
> iptables -A INPUT -p udp -i $WAN_intf --dport $Open_WAN_RTP_port_range =
-j ACCEPT
>
>  =20
For "ping" you need the following line:
iptables -A INPUT -p icmp -j ACCEPT
> #--Drop all other incoming connection. Only above will be allowed------=
-------
> iptables -P INPUT DROP
>    =20
>
>
>  =20



