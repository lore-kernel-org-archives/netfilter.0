From: "Yoann" <yoann.juet@ifrance.com>
Subject: Re: help bootp filters
Date: Mon, 16 Jun 2003 15:09:39 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003901c33408$8b802640$0101a8c0@cerbere>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019285@wardrive.citadelcomputer.com.au>
Reply-To: "Yoann" <yoann.juet@ifrance.com>
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
To: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

George,

In fact, the server gives out DHCP IPs...this is why I'm surprised.

----- Original Message -----
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "Yoann" <yoann.juet@ifrance.com>; <netfilter@lists.netfilter.org>
Sent: Monday, June 16, 2003 2:56 PM
Subject: RE: help bootp filters


> If I'm not wrong, I think tcpdump works on a different layer to netfilter
so even though it's dropped I think tcpdump still sees them.... but I may be
wrong.
> Does it eventually give out DHCP IP's or receives an IP addres or doesn't
it? If DHCP isn't working then it's probably dropped but tcpdumps still sees
them..
>
> I just did a test from work to home which I'm defiantely blockinh port
6665 and I get the same results but I know 6665 is being dropped... yet
TCPDUMP catches it before netfilter.
>
> Jun 16 22:52:24 newjackswing kernel: INET IN=3Dppp0 OUT=3D MAC=3D
SRC=3D203.111.79.114 DST=3D150.101.112.146 LEN=3D60 TOS=3D0x00 PREC=3D0xE0 =
TTL=3D50
ID=3D44842 DF PROTO=3DTCP SPT=3D3698 DPT=3D6665 WINDOW=3D5840 RES=3D0x00 SY=
N URGP=3D0 OPT
(020405840402080A0B09245F0000000001030300)
>
> [root@newjackswing /usr]# tcpdump -x port 6665
> Kernel filter, protocol ALL, datagram packet socket
> tcpdump: listening on all devices
> 22:52:24.984380 if134 < work.domain.com.3698 > myhome.domain.com.6665: S
614501237:614501237(0) win 5840 <mss 1412,sackOK,timestamp 185148511
0,nop,wscale 0> (DF) [tos 0xe0]
>                          45e0 003c af2a 4000 3206 76d8 cb6f 4f72
>                          9665 7092 0e72 1a09 24a0 8b75 0000 0000
>                          a002 16d0 0795 0000 0204 0584 0402 080a
>                          0b09 245f 0000 0000 0103 0300
>
> So I think I might be right? Anybody wanna shed some light with this layer
stuff ;) I'm confused on that part ;P
>
> -----Original Message-----
> From: Yoann [mailto:yoann.juet@ifrance.com]
> Sent: Mon 16-Jun-03 9:33 PM
> To: netfilter@lists.netfilter.org
> Cc:
> Subject: help bootp filters
>
>
>
> Hi,
>
> I experiment trouble with netfilter/iptables on rh9. I configured a server
with the following rules just to accept, for the moment, SSH sessions,
everything else is dropped.
>
> $IPTABLES -P INPUT DROP
> $IPTABLES -P FORWARD DROP
> $IPTABLES -P OUTPUT DROP
>
> $IPTABLES -A INPUT -i $LO_IFACE -j ACCEPT
> $IPTABLES -A OUTPUT -o $LO_IFACE -j ACCEPT
>
> $IPTABLES -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j
ACCEPT
> $IPTABLES -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j
ACCEPT
>
> $IPTABLES -A INPUT -j LOG --log-level warning --log-prefix "DROP input
packet died: "
> $IPTABLES -A OUTPUT -j LOG --log-level warning --log-prefix "DROP output
packet died: "
>
> It works fine, excepted for DHCP/BOOTP requests. In fact, the server
(single interface with IP address 192.168.2.110) is also a DHCP server and
responds to BOOTP requests as shown below :
>
> [root@pluton root]# tcpdump port 67 or 68
> tcpdump: listening on eth0
> 17:10:30.925605 0.0.0.0.bootpc > 255.255.255.255.bootps:  xid:0x9a499735
flags:0x8000 [|bootp]
> 17:10:31.005330 192.168.2.1.bootps > 255.255.255.255.bootpc:
xid:0x9a499735 flags:0x8000 Y:192.168.2.110 S:192.168.2.1 ether
0:90:f5:c:80:a0 [|bootp] [tos 0x10]
>
> netfilter log messages are show below :
>
> Jun 12 17:28:29 pluton kernel: DROP input packet died: IN=3Deth0 OUT=3D
MAC=3Dff:ff:ff:ff:ff:ff:00:90:f5:0c:80:a0:08:00 SRC=3D0.0.0.0
DST=3D255.255.255.255 LEN=3D328 TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D55877=
 PROTO=3DUDP
SPT=3D68 DPT=3D67 LEN=3D308
> Jun 12 17:28:29 pluton kernel: DROP output packet died: IN=3D OUT=3Deth0
SRC=3D192.168.2.1 DST=3D192.168.2.110 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=
=3D64 ID=3D0 DF
PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D63703 SEQ=3D0
>
> Can you explain me why a BOOTP response is sent even though such packets
(seem to be) dropped by iptables rules ?
>
> Many thanks,
> Regards,
> Yoann.
>
>


_____________________________________________________________________
Envie de discuter en "live" avec vos amis ? T=E9l=E9charger MSN Messenger
http://www.ifrance.com/_reloc/m la 1=E8re messagerie instantan=E9e de France


