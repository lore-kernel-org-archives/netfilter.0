From: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?=
	<sa.campos@datasulsp.com.br>
Subject: Two link adsl on the same server
Date: Tue, 10 May 2005 13:32:38 -0300
Message-ID: <00ee01c5557d$e1979d90$8b00000a@PIVT>
Reply-To: =?iso-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?=
	<sa.campos@datasulsp.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter list <netfilter@lists.netfilter.org>

Hi!

We have two ADSL link on the same server and we'd like to use load =
balance.

I tried to used, but I didn't have success.

I use on eth1 172.17.1.6 mask 255.255.0.0 my local network;
on eth2 my first ADSL 200.168.1.19 mask 255.255.255.192 default gw =
200.204.140.1
on eth4 my first ADSL 200.204.140.10 mask 255.255.255.192 default gw =
200.179.1.1

This IP are static.

On my local network I have two servers (E-mail server and one web =
server) and I need to PREROUTING with DNAT.

And we would like to separate the port 80 and 21 using one link on eth0 =
and the port 25 and 110 other link eth4 and other ports eth0 or eth4 =
link.

My files:

My ifcfg-ethx files:

#NIC SIS on board, usando link1 ADSL
DEVICE=3Deth0
ONBOOT=3Dyes
#BOOTPROTO=3Ddhcp
BOOTPROTO=3Dstatic
BROADCAST=3D200.168.1.63
IPADDR=3D200.168.1.19
NETMASK=3D255.255.255.192
NETWORK=3D200.168.1.0
#GATEWAY=3D200.168.1.1
___________________________________________________________
#Placa Realtek, Uso Local, slot 1
DEVICE=3Deth1
ONBOOT=3Dyes
BOOTPROTO=3Dstatic
IPADDR=3D172.17.1.6
BROADCAST=3D172.17.255.255
NETMASK=3D255.255.0.0
NETWORK=3D172.17.0.0
________________________________________________________
#NIC Realtek, link 2 ADSL
DEVICE=3Deth4
ONBOOT=3Dyes
BOOTPROTO=3Dstatic
BROADCAST=3D200.204.140.63
IPADDR=3D200.204.140.10
NETMASK=3D255.255.255.192
NETWORK=3D200.204.140.0

_________________________________________________
file /etc/sysconfig/network

NETWORKING=3Dyes
HOSTNAME=3Drbz-firewall
#GATEWAY=3D200.168.1.1
GATEWAY=3D200.204.140.1
___________________________________________________
file /etc/iproute2/rt_tables

#
# reserved values
#
#255    local
#254    main
#253    default
#0      unspec
=20
#
# local
#
#1      inr.ruhep


Could some one help me??

Thanks


Sebasti=E3o Ant=F4nio Campos
Infojoi Computadores Ltda
89.224-000 Joinville -SC - R. Iriri=FA, 3587
Cml. (47) 437-0796 - Cel. (47) 9927-5349
tiao@infojoi.com.br
http://www.lupusnet.com.br
