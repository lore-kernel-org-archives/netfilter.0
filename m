From: =?ISO-8859-1?Q?Andr=E9?= Aun <andre_aun@terra.com.br>
Subject: Redirecting ports - not working
Date: Thu, 17 Jul 2003 06:41:54 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030717064154.3b6c5f38.andre_aun@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hi all,

Here is my situation: i have a slackware box running a virtual machine unde=
r vmware. The virtual machine is a Windows 2003 server. In my server, i hav=
e 2 devices: eth0, vith the static/valid ip adress, and eth1 with my local =
network adress (192.168.0.0). The virtual machine gets the following ip adr=
ess: 192.168.237.128 and can ping the internet (i configure the virtual mac=
hine bridged with eth1, no problem).

What i want: redirect the traffic from port 80 of my linux (eth0, valid adr=
ess) to the virtual machine (192.168.237.128).

I've tryed the following solution:

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to 192.16=
8.237.128:80
iptables -t nat -A POSTROUTING -s 192.168.237.128 -p tcp -j SNAT --to <my v=
alid ip adress>

But it doesn't work. I see this in the /proc/net/ip_conntrack :

tcp      6 111 SYN_SENT src=3D<ip_of_my_remote_box> dst=3D<ip_of_eth0(valid=
 adress)> sport=3D42560 dport=3D80 [UNREPLIED] src=3D192.168.237.128 dst=3D=
<ip_of_my_remote_box> sport=3D80 dport=3D42560 use=3D1

Please... who can welp me? I spent 2 days in this problem ;)

Thanx in advance... and sorry for the bad english :)

Andr=E9 Aun




