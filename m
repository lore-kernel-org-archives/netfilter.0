From: "juanca" <juanca@sat.com.py>
Subject: Problems with my mail server
Date: Wed, 16 Apr 2003 19:07:19 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <098601c30486$14521bc0$0f00a8c0@juancarlitos>
References: <20030416125602.18155.44510.Mailman@kashyyyk>
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

I=B4ve implemented this firewall but when I started it
My mail server doesn=B4t work
what might it be problem?




iptables -A INPUT -s 192.168.0.15 -j ACCEPT
iptables -A INPUT -s 192.168.0.25 -j ACCEPT

iptables -A INPUT -s 127.0.0.1 -j ACCEPT

iptables -A INPUT -p tcp --dport domain -j ACCEPT
iptables -A INPUT -p tcp --dport http -j ACCEPT
iptables -A INPUT -p tcp --dport https -j ACCEPT
iptables -A INPUT -p tcp --dport ftp -j ACCEPT
iptables -A INPUT -p tcp --dport ftp-data -j ACCEPT
iptables -A INPUT -p tcp --dport ftps -j ACCEPT
iptables -A INPUT -p tcp --dport ftps-data -j ACCEPT
iptables -A INPUT -p tcp --dport pop3 -j ACCEPT
iptables -A OUTPUT -p tcp --dport pop3 -j ACCEPT
iptables -A INPUT -p tcp --dport pop3s -j ACCEPT
iptables -A INPUT -p tcp --dport  smtps -j ACCEPT
iptables -A INPUT -p tcp --dport smtp -j ACCEPT
iptables -A OUTPUT -p tcp --dport smtp -j ACCEPT -j ACCEPT
iptables -A INPUT -p tcp --dport 113 -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -j DROP

----- Original Message -----
From: <netfilter-request@lists.netfilter.org>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, April 16, 2003 5:56 AM
Subject: netfilter digest, Vol 1 #777 - 8 msgs


> Send netfilter mailing list submissions to
> netfilter@lists.netfilter.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
> https://lists.netfilter.org/mailman/listinfo/netfilter
> or, via email, send a message with subject or body 'help' to
> netfilter-request@lists.netfilter.org
>
> You can reach the person managing the list at
> netfilter-admin@lists.netfilter.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of netfilter digest..."
>
>
> Today's Topics:
>
>    1. Re: Can iptables manager source mac address? (Dharmendra.T)
>    2. RE: Source Port (Dharmendra.T)
>    3. iptables 1.2.8, mangle-recomputes, userspace? (Scott MacKay)
>    4. Small problem -> Prerouting (Matti Luoma)
>    5. Re: Small problem -> Prerouting (Dharmendra.T)
>    6. Kernel panic (Allshouse, Brian M (Sabre))
>    7. RE: Small problem -> Prerouting (Matti Luoma)
>    8. RE: Small problem -> Prerouting (Dharmendra.T)
>
> --__--__--
>
> Message: 1
> Subject: Re: Can iptables manager source mac address?
> From: "Dharmendra.T" <dharmu@nsecure.net>
> To: NetSnake <netsnake@963.net>
> Cc: netfilter@lists.netfilter.org
> Date: 16 Apr 2003 16:39:26 +0530
>
>
> --=3D-c9uQsdNGpyvF/AeV5Gp8
> Content-Type: text/plain
> Content-Transfer-Encoding: 7bit
>
> On Sat, 2003-04-19 at 15:51, NetSnake wrote:
>
>       I use iptables to nat to internet, but I found some user use a proxy
>     on intranet, like, 192.168.0.5 can access to internet, 192.168.0.10
can
>     not access to internet, now 10 access a proxy on 192.168.0.5, then he
>     can access now, I thought in package from 192.168.0.5 must contant
some
>     information about proxy, like source mac address, this can help me to
>     identified users, can iptables do this?
>
>       Thanks.
>
>
> You can block based on the mac address. But you should check whether
> 192.168.0.10 contains the same mac addres or it is getting modified in
> proxy server.
> --
> Regards
> Dharmendra.T
>
>
> This message is intended for the addressee only. It may contain
> privileged or Confidential information. If you have received this
> message in error,please notify the sender and destroy the message
> immediately.Unauthorised use or reproduction of this message is strictly
> prohibited.
>
> --=3D-c9uQsdNGpyvF/AeV5Gp8
> Content-Type: text/html; charset=3Dutf-8
>
> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
> <HTML>
> <HEAD>
>   <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8=
">
>   <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/1.0.4">
> </HEAD>
> <BODY>
> On Sat, 2003-04-19 at 15:51, NetSnake wrote:
>     <BLOCKQUOTE>
> <PRE><FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>  I use iptables to nat =
to
internet, but I found some user use a proxy</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>on intranet, like, 192.168.0.=
5 can
access to internet, 192.168.0.10 can</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>not access to internet, now 10
access a proxy on 192.168.0.5, then he</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>can access now, I thought in
package from 192.168.0.5 must contant some</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>information about proxy, like
source mac address, this can help me to</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>identified users, can iptable=
s do
this?</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>  Thanks.</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I></PRE>
>     </BLOCKQUOTE>
> <FONT SIZE=3D"3">You can block based on the mac address. But you should
check whether 192.168.0.10 contains the same mac addres or it is getting
modified in proxy server.</FONT>
> <TABLE CELLSPACING=3D"0" CELLPADDING=3D"0" WIDTH=3D"100%">
> <TR>
> <TD>
> <PRE>--
> Regards
> Dharmendra.T
>
>
> This message is intended for the addressee only. It may contain privileged
or Confidential information. If you have received this message in
error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.</PRE>
> </TD>
> </TR>
> </TABLE>
>
> </BODY>
> </HTML>
>
> --=3D-c9uQsdNGpyvF/AeV5Gp8--
>
>
>
> --__--__--
>
> Message: 2
> Subject: RE: Source Port
> From: "Dharmendra.T" <dharmu@nsecure.net>
> To: netfilter@lists.netfilter.org
> Date: 16 Apr 2003 16:42:09 +0530
>
>
> --=3D-8Di+7IMPpP0prz3AfIy3
> Content-Type: text/plain
> Content-Transfer-Encoding: 7bit
>
> On Wed, 2003-04-16 at 15:37, Michael K wrote:
>
>     --snip--
>     > I think there was (?) a tunable setting in /proc which can
>     > determine which outgoing port numbers should be used, and
>     > it'll recycle the numbers by itself.
>
>     Sure thing. Go to
>     http://ipsysctl-tutorial.frozentux.net/ipsysctl-tutorial.html#AEN269
>
>     --snip---
>
>     /Klintan
>
>
> Yes, this is nice one.
>
>
>
> --
> Regards
> Dharmendra.T
>
>
> This message is intended for the addressee only. It may contain
> privileged or Confidential information. If you have received this
> message in error,please notify the sender and destroy the message
> immediately.Unauthorised use or reproduction of this message is strictly
> prohibited.
>
> --=3D-8Di+7IMPpP0prz3AfIy3
> Content-Type: text/html; charset=3Dutf-8
>
> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
> <HTML>
> <HEAD>
>   <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8=
">
>   <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/1.0.4">
> </HEAD>
> <BODY>
> On Wed, 2003-04-16 at 15:37, Michael K wrote:
>     <BLOCKQUOTE>
> <PRE><FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>--snip--</FONT></FONT></=
I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>&gt; I think there was (?) a
tunable setting in /proc which can </FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>&gt; determine which outgoing=
 port
numbers should be used, and </FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>&gt; it'll recycle the number=
s by
itself.</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>Sure thing. Go
to</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT
SIZE=3D"3"><I>http://ipsysctl-tutorial.frozentux.net/ipsysctl-tutorial.html=
#AE
N269</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I> </FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>--snip---</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>/Klintan</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I></PRE>
>     </BLOCKQUOTE>
> <FONT SIZE=3D"3">Yes, this is nice one. </FONT>
>     <BLOCKQUOTE>
> <PRE><FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I></PRE>
>     </BLOCKQUOTE>
> <TABLE CELLSPACING=3D"0" CELLPADDING=3D"0" WIDTH=3D"100%">
> <TR>
> <TD>
> <PRE>--
> Regards
> Dharmendra.T
>
>
> This message is intended for the addressee only. It may contain privileged
or Confidential information. If you have received this message in
error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.</PRE>
> </TD>
> </TR>
> </TABLE>
>
> </BODY>
> </HTML>
>
> --=3D-8Di+7IMPpP0prz3AfIy3--
>
>
>
> --__--__--
>
> Message: 3
> Date: Wed, 16 Apr 2003 05:06:53 -0700 (PDT)
> From: Scott MacKay <scottmackay@yahoo.com>
> Subject: iptables 1.2.8, mangle-recomputes, userspace?
> To: netfilter@lists.netfilter.org
>
> Hello, poking around at the website I see the 1.2.8 is
> out.  In the 'history'
> (http://www.iptables.org/downloads.html#cvs) it
> appears there is a patch-o-matic entry between 1.2.7a
> and 1.2.8.  To use 1.2.8, do I need to do anything
> special?  I currently have the 2.4.20 w/ebtables
> patches.
>
> Also, when mangling the contents of a packet
> (including payload size), is there anything special
> you need to do aside from recomputing IP and TCP/UDP
> checksums?
>
> Lastly, are there any good references for userspace
> apps?  There is a ton for the netfilter, but was
> looking for more in the way of userspace concepts &
> activities.  Thanks!
>
> -Scott
>
>
>
> __________________________________________________
> Do you Yahoo!?
> The New Yahoo! Search - Faster. Easier. Bingo
> http://search.yahoo.com
>
>
> --__--__--
>
> Message: 4
> Date: Wed, 16 Apr 2003 15:11:09 +0300
> To: netfilter@lists.netfilter.org
> From: Matti Luoma <matti.luoma@bitboys.com>
> Subject: Small problem -> Prerouting
>
> Hiya!
>
> Well i upgraded my kernel to 2.4.20 from 2.4.3, and also compiled newest
> iptables 1.2.8
>
> now i got this weird problem with
>
> example this line:
>
> iptables -A PREROUTING -t nat -p UDP -d IP -dport port -j DNAT --to
IP:Port
>
> It should works, and it works, but not anymore, SSH forwarding like this
> works thou
>
> also im gettin some stuff in syslog:
>
> kernel: NAT: 0 dropping untracked packet c66ab6c0
>
> i think these things are related, and probably some module is causing
this,
> any ideas?
>
> Cheers,
> Matti
>
>
>
> --__--__--
>
> Message: 5
> Subject: Re: Small problem -> Prerouting
> From: "Dharmendra.T" <dharmu@nsecure.net>
> To: Matti Luoma <matti.luoma@bitboys.com>
> Cc: netfilter@lists.netfilter.org
> Date: 16 Apr 2003 18:09:32 +0530
>
>
> --=3D-N4I5JQPT/0fRE0WRSmOm
> Content-Type: text/plain
> Content-Transfer-Encoding: 7bit
>
> On Wed, 2003-04-16 at 17:41, Matti Luoma wrote:
>
>     Hiya!
>
>     Well i upgraded my kernel to 2.4.20 from 2.4.3, and also compiled
newest
>     iptables 1.2.8
>
>     now i got this weird problem with
>
>     example this line:
>
>     iptables -A PREROUTING -t nat -p UDP -d IP -dport port -j DNAT --to
IP:Port
>
>     It should works, and it works, but not anymore, SSH forwarding like
this
>     works thou
>
>     also im gettin some stuff in syslog:
>
>     kernel: NAT: 0 dropping untracked packet c66ab6c0
>
>     i think these things are related, and probably some module is causing
this,
>     any ideas?
>
>     Cheers,
>     Matti
>
>     I guess this is because of conntrack module. Just check do you need
this if not remove it.
>
> --
> Regards
> Dharmendra.T
>
>
> This message is intended for the addressee only. It may contain
> privileged or Confidential information. If you have received this
> message in error,please notify the sender and destroy the message
> immediately.Unauthorised use or reproduction of this message is strictly
> prohibited.
>
> --=3D-N4I5JQPT/0fRE0WRSmOm
> Content-Type: text/html; charset=3Dutf-8
>
> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
> <HTML>
> <HEAD>
>   <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8=
">
>   <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/1.0.4">
> </HEAD>
> <BODY>
> On Wed, 2003-04-16 at 17:41, Matti Luoma wrote:
>     <BLOCKQUOTE>
> <PRE><FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>Hiya!</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>Well i upgraded my kernel to
2.4.20 from 2.4.3, and also compiled newest </FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>iptables 1.2.8</FONT></FONT><=
/I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>now i got this weird problem
with</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>example this
line:</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>iptables -A PREROUTING -t nat=
 -p
UDP -d IP -dport port -j DNAT --to IP:Port</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>It should works, and it works=
, but
not anymore, SSH forwarding like this </FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>works thou</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>also im gettin some stuff in
syslog:</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>kernel: NAT: 0 dropping untra=
cked
packet c66ab6c0</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>i think these things are rela=
ted,
and probably some module is causing this, </FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>any ideas?</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>Cheers,</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>Matti</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT SIZE=3D"3">I guess this is because of conntrack module. Just check =
do
you need this if not remove it. </FONT></PRE>
>     </BLOCKQUOTE>
> <TABLE CELLSPACING=3D"0" CELLPADDING=3D"0" WIDTH=3D"100%">
> <TR>
> <TD>
> <PRE>--
> Regards
> Dharmendra.T
>
>
> This message is intended for the addressee only. It may contain privileged
or Confidential information. If you have received this message in
error,please notify the sender and destroy the message
immediately.Unauthorised use or reproduction of this message is strictly
prohibited.</PRE>
> </TD>
> </TR>
> </TABLE>
>
> </BODY>
> </HTML>
>
> --=3D-N4I5JQPT/0fRE0WRSmOm--
>
>
>
> --__--__--
>
> Message: 6
> From: "Allshouse, Brian M (Sabre)" <AllshouseBM@navair.navy.mil>
> To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>
> Subject: Kernel panic
> Date: Wed, 16 Apr 2003 08:45:55 -0400
>
> I'm having problems with kernel panics. I set up my firewall with the
> latest and greatest version of iptables and the latest stable kernel. I'm
> running slackware 8.1, and ever since I put it on the network for testing
I
> get kernel panics that crash the machine I tried the previous kernel
> version (2.4.18) and also tried the latest patches for Iptables. I posted
> this problem here a few weeks ago and someone suggested using ksymoops to
> track down what is causing the kernel panic. I finally have been able to
do
> that, but not being a kernel programmer I don't know what to make of it.
I'm
> pasting the output from ksymoops below. If anyone knows what to make of
this
> or where I can find out what this means I would greatly appreciate it. I'm
> on
> the verge of missing my deadline to have this box in place. Thanks.
>
> <-------------------------Start ksymoops
> output----------------------------------------->
>
> ksymoops 2.4.9 on i586 2.4.20.  Options used
>      -V (default)
>      -k /proc/ksyms (default)
>      -l /proc/modules (default)
>      -o /lib/modules/2.4.20/ (default)
>      -m /usr/src/linux/System.map (default)
>
> Warning: You did not tell me where to find symbol information.  I will
> assume that the log matches the kernel and modules that are running
> right now and I'll use the default options above for symbol resolution.
> If the current kernel and/or modules do not match the log, you can get
> more accurate output by telling me the kernel version and where to find
> map, modules, ksyms etc.  ksymoops -h explains the options.
>
> *pde =3D 00000000
> Oops: 0000
> CPU:    0
> EIP:    0010:[<c0272a86>]   Not tainted
> Using defaults from ksymoops -t elf32-i386 -a i386
> EFLAGS: 00010202
> eax:  00000080  ebx:  00000000  ecx:  7354e5cc  edx:  000007ff
> esi:  0000008c  edi:  ffffffea  ebp:  c0351e5c  esp:  c0351e0c
> ds:  0018  es:  0018 ss:  0018
> Process swapper (pid: 0, stackpage=3Dc0351000)
> Stack: 00000000 00000002 5750e58c 00000000 00000000 000004e8 00000000
> 00000000
>        cb8fb990 cb8fb990 00000000 7d56e58c 00000000 fd010015 cb919920
> 5750e58c
>        7354e48c 00000002 00000000 00000000 7354e58c c0272fbc cbe1cee0
> 5750e58c
> Call Trace:   [<c0272fbc>] [<c0290c4b>] [<c026cf4a>] [<c0290f8f>]
> [<c029aa8f>]
>  [<c026745b>] [<c02674ee>] [<c0267604>] [<c0119c5a>] [<c0109aae>]
> [<c0106d00>]
>  [<c010bf38>] [<c0106d00>] [<c0106d23>] [<c0106d87>] [<c0105000>]
> [<c0105027>]
> Code: 03 00 83 f8 7f 0f 84 f0 03 00 00 8d 7d ec 8d 5d e4 a1 bc
>
>
> >>EIP; c0272a86 <ip_route_input_slow+12e/558>   <=3D=3D=3D=3D=3D
>
> >>ebp; c0351e5c <init_task_union+1e5c/2000>
> >>esp; c0351e0c <init_task_union+1e0c/2000>
>
> Trace; c0272fbc <ip_route_input+10c/114>
> Trace; c0290c4b <arp_process+1a3/44c>
> Trace; c026cf4a <nf_hook_slow+132/188>
> Trace; c0290f8f <arp_rcv+9b/c4>
> Trace; c029aa8f <unix_dgram_sendmsg+35f/364>
> Trace; c026745b <netif_receive_skb+14f/178>
> Trace; c02674ee <process_backlog+6a/110>
> Trace; c0267604 <net_rx_action+70/114>
> Trace; c0119c5a <do_softirq+5a/a4>
> Trace; c0109aae <do_IRQ+96/a8>
> Trace; c0106d00 <default_idle+0/28>
> Trace; c010bf38 <call_do_IRQ+5/d>
> Trace; c0106d00 <default_idle+0/28>
> Trace; c0106d23 <default_idle+23/28>
> Trace; c0106d87 <cpu_idle+3f/54>
> Trace; c0105000 <_stext+0/0>
> Trace; c0105027 <rest_init+27/28>
>
> Code;  c0272a86 <ip_route_input_slow+12e/558>
> 00000000 <_EIP>:
> Code;  c0272a86 <ip_route_input_slow+12e/558>   <=3D=3D=3D=3D=3D
>    0:   03 00                     add    (%eax),%eax   <=3D=3D=3D=3D=3D
> Code;  c0272a88 <ip_route_input_slow+130/558>
>    2:   83 f8 7f                  cmp    $0x7f,%eax
> Code;  c0272a8b <ip_route_input_slow+133/558>
>    5:   0f 84 f0 03 00 00         je     3fb <_EIP+0x3fb> c0272e81
> <ip_route_input_slow+529/558>
> Code;  c0272a91 <ip_route_input_slow+139/558>
>    b:   8d 7d ec                  lea    0xffffffec(%ebp),%edi
> Code;  c0272a94 <ip_route_input_slow+13c/558>
>    e:   8d 5d e4                  lea    0xffffffe4(%ebp),%ebx
> Code;  c0272a97 <ip_route_input_slow+13f/558>
>   11:   a1 bc 00 00 00            mov    0xbc,%eax
>
>  <0>Kernel panic: Aiee, killing interrupt handler!
>
> 1 warning issued.  Results may not be reliable.
>
> <----------------------------------End ksymoops
> output------------------------------------------->
>
>
>
> Sincerely,
>
> Brian Allshouse
> UNIX Systems Administrator
> Sabre Systems Inc.
> mailto:allshousebm@navair.navy.mil
> (301) 342-7034
>
>
>
> --__--__--
>
> Message: 7
> From: "Matti Luoma" <matti.luoma@bitboys.com>
> To: "Dharmendra.T" <dharmu@nsecure.net>
> Cc: <netfilter@lists.netfilter.org>
> Subject: RE: Small problem -> Prerouting
> Date: Wed, 16 Apr 2003 15:47:35 +0300
>
> This is a multi-part message in MIME format.
>
> ------=3D_NextPart_000_0026_01C3042F.7FF3E450
> Content-Type: text/plain;
> charset=3D"utf-8"
> Content-Transfer-Encoding: quoted-printable
>
>                     Seems to be in use, so i cant remove it, so it has =3D
> to be something else...
>
>                     What module does PREROUTING need anyways?
>
>
>
>   On Wed, 2003-04-16 at 17:41, Matti Luoma wrote:=3D20
> Hiya!
>
> Well i upgraded my kernel to 2.4.20 from 2.4.3, and also compiled newest =
=3D
>
> iptables 1.2.8
>
> now i got this weird problem with
>
> example this line:
>
> iptables -A PREROUTING -t nat -p UDP -d IP -dport port -j DNAT --to =3D
> IP:Port
>
> It should works, and it works, but not anymore, SSH forwarding like this =
=3D
>
> works thou
>
> also im gettin some stuff in syslog:
>
> kernel: NAT: 0 dropping untracked packet c66ab6c0
>
> i think these things are related, and probably some module is causing =3D
> this,=3D20
> any ideas?
>
> Cheers,
> Matti
>
> I guess this is because of conntrack module. Just check do you need this =
=3D
> if not remove it. --=3D20
> Regards
> Dharmendra.T
>
>
> This message is intended for the addressee only. It may contain =3D
> privileged or Confidential information. If you have received this =3D
> message in error,please notify the sender and destroy the message =3D
> immediately.Unauthorised use or reproduction of this message is strictly =
=3D
> prohibited.=3D20
>
> ------=3D_NextPart_000_0026_01C3042F.7FF3E450
> Content-Type: text/html;
> charset=3D"utf-8"
> Content-Transfer-Encoding: quoted-printable
>
> =3DEF=3DBB=3DBF<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//=
EN">
> <HTML><HEAD>
> <META http-equiv=3D3DContent-Type content=3D3D"text/html; CHARSET=3D3DUTF=
-8">
> <META content=3D3D"MSHTML 6.00.2800.1141" name=3D3DGENERATOR></HEAD>
> <BODY>
> <DIV><FONT face=3D3DArial color=3D3D#0000ff size=3D3D2><SPAN=3D20
> class=3D3D478394312-16042003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bs=3D
> p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=3D20
> Seems to be in use, so i cant remove it, so it has to be something=3D20
> else...</SPAN></FONT></DIV>
> <DIV><FONT face=3D3DArial color=3D3D#0000ff size=3D3D2><SPAN=3D20
> class=3D3D478394312-16042003></SPAN></FONT>&nbsp;</DIV>
> <DIV><FONT face=3D3DArial color=3D3D#0000ff size=3D3D2><SPAN=3D20
> class=3D3D478394312-16042003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bs=3D
> p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
=3D
> ;What=3D20
> module does PREROUTING need anyways?</SPAN></FONT></DIV>
> <DIV><FONT face=3D3DArial color=3D3D#0000ff size=3D3D2><SPAN=3D20
> class=3D3D478394312-16042003></SPAN></FONT>&nbsp;</DIV>
> <BLOCKQUOTE>
>   <DIV class=3D3DOutlookMessageHeader dir=3D3Dltr align=3D3Dleft><FONT =3D
> face=3D3DTahoma><FONT=3D20
>   size=3D3D2><BR></FONT></FONT>&nbsp;</DIV>On Wed, 2003-04-16 at 17:41, =
=3D
> Matti Luoma=3D20
>   wrote:=3D20
>   <BLOCKQUOTE><PRE><FONT color=3D3D#737373><FONT =3D
> size=3D3D3><I>Hiya!</FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I></FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>Well i upgraded my kernel to =
=3D
> 2.4.20 from 2.4.3, and also compiled newest </FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>iptables 1.2.8</FONT></FONT><=
/I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I></FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>now i got this weird problem =
=3D
> with</FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I></FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>example this =3D
> line:</FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I></FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>iptables -A PREROUTING -t nat=
 -p =3D
> UDP -d IP -dport port -j DNAT --to IP:Port</FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I></FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>It should works, and it works=
, =3D
> but not anymore, SSH forwarding like this </FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>works thou</FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I></FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>also im gettin some stuff in =
=3D
> syslog:</FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I></FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>kernel: NAT: 0 dropping =3D
> untracked packet c66ab6c0</FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I></FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>i think these things are =3D
> related, and probably some module is causing this, </FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>any ideas?</FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I></FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>Cheers,</FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I>Matti</FONT></FONT></I>
> <FONT color=3D3D#737373><FONT size=3D3D3><I></FONT></FONT></I>
> <FONT size=3D3D3>I guess this is because of conntrack module. Just check =
=3D
> do you need this if not remove it. </FONT></PRE></BLOCKQUOTE>
>   <TABLE cellSpacing=3D3D0 cellPadding=3D3D0 width=3D3D"100%">
>     <TBODY>
>     <TR>
>       <TD><PRE>--=3D20
> Regards
> Dharmendra.T
>
>
> This message is intended for the addressee only. It may contain =3D
> privileged or Confidential information. If you have received this =3D
> message in error,please notify the sender and destroy the message =3D
> immediately.Unauthorised use or reproduction of this message is strictly =
=3D
> prohibited.</PRE></TD></TR></TBODY></TABLE></BLOCKQUOTE></BODY></HTML>
>
> ------=3D_NextPart_000_0026_01C3042F.7FF3E450--
>
>
>
> --__--__--
>
> Message: 8
> Subject: RE: Small problem -> Prerouting
> From: "Dharmendra.T" <dharmu@nsecure.net>
> To: Matti Luoma <matti.luoma@bitboys.com>
> Cc: netfilter@lists.netfilter.org
> Date: 16 Apr 2003 18:25:48 +0530
>
>
> --=3D-M59EWqyqANPxnq0Y/1/k
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: quoted-printable
>
> On Wed, 2003-04-16 at 18:17, Matti Luoma wrote:
>
>     =3DEF=3DBB=3DBF
>                         Seems to be in use, so i cant remove it, so it
>     has to be something else...
>     =3D20
>                         What module does PREROUTING need anyways?
>     =3D20
>
>         =3D20
>         On Wed, 2003-04-16 at 17:41, Matti Luoma wrote:=3D20
>
>             Hiya!
>            =3D20
>             Well i upgraded my kernel to 2.4.20 from 2.4.3, and also
compil=3D
> ed newest=3D20
>             iptables 1.2.8
>            =3D20
>             now i got this weird problem with
>            =3D20
>             example this line:
>            =3D20
>             iptables -A PREROUTING -t nat -p UDP -d IP -dport port -j DNAT
=3D
> --to IP:Port
>            =3D20
>             It should works, and it works, but not anymore, SSH forwarding
=3D
> like this=3D20
>             works thou
>            =3D20
>             also im gettin some stuff in syslog:
>            =3D20
>             kernel: NAT: 0 dropping untracked packet c66ab6c0
>            =3D20
>             i think these things are related, and probably some module is
c=3D
> ausing this,=3D20
>             any ideas?
>            =3D20
>             Cheers,
>             Matti
>            =3D20
>             I guess this is because of conntrack module. Just check do you
=3D
> need this if not remove it.=3D20
>
>
> Do onething, recompile the kernel and enable only the modules which you
> want to use.=3D20
> I guess PREROUTING does not use any external module. If iptables is
> enabled PREROUTING will be enabled.
>
> Regards
> Dharmu
>
> --=3D-M59EWqyqANPxnq0Y/1/k
> Content-Type: text/html; charset=3Dutf-8
>
> <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
> <HTML>
> <HEAD>
>   <META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; CHARSET=3DUTF-8=
">
>   <META NAME=3D"GENERATOR" CONTENT=3D"GtkHTML/1.0.4">
> </HEAD>
> <BODY>
> On Wed, 2003-04-16 at 18:17, Matti Luoma wrote:
>     <BLOCKQUOTE>
>     <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>&#65279;</FONT></FONT></I>
>     <BR>
>     <FONT COLOR=3D"#0000ff"><FONT
SIZE=3D"2"><I>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbs
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Seems to be in use, so i
cant remove it, so it has to be something else...</FONT></FONT></I>
>     <BR>
>     <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>&nbsp;</FONT></FONT></I>
>     <BR>
>     <FONT COLOR=3D"#0000ff"><FONT
SIZE=3D"2"><I>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbs
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;What module does
PREROUTING need anyways?</FONT></FONT></I>
>     <BR>
>     <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>&nbsp;</FONT></FONT></I>
>         <BLOCKQUOTE>
>         <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>&nbsp;</FONT></FONT><=
/I>
>         <BR>
>         <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>On Wed, 2003-04-16 at
17:41, Matti Luoma wrote: </FONT></FONT></I>
>             <BLOCKQUOTE>
> <PRE><FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>Hiya!</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>Well i upgraded my kernel to
2.4.20 from 2.4.3, and also compiled newest </FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>iptables 1.2.8</FONT></FONT><=
/I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>now i got this weird problem
with</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>example this
line:</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>iptables -A PREROUTING -t nat=
 -p
UDP -d IP -dport port -j DNAT --to IP:Port</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>It should works, and it works=
, but
not anymore, SSH forwarding like this </FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>works thou</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>also im gettin some stuff in
syslog:</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>kernel: NAT: 0 dropping untra=
cked
packet c66ab6c0</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>i think these things are rela=
ted,
and probably some module is causing this, </FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>any ideas?</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>Cheers,</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>Matti</FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I></FONT></FONT></I>
> <FONT COLOR=3D"#737373"><FONT SIZE=3D"3"><I>I guess this is because of
conntrack module. Just check do you need this if not remove it.
</FONT></FONT></I></PRE>
>             </BLOCKQUOTE>
>         </BLOCKQUOTE>
>     </BLOCKQUOTE>
>
> <BR>
> Do onething, recompile the kernel and enable only the modules which you
want to use.
> <BR>
> I guess PREROUTING does not use any external module. If iptables is
enabled PREROUTING will be enabled.
> <BR>
>
> <BR>
> Regards
> <BR>
> Dharmu
> </BODY>
> </HTML>
>
> --=3D-M59EWqyqANPxnq0Y/1/k--
>
>
>
>
> --__--__--
>
> _______________________________________________
> netfilter mailing list
> netfilter@lists.netfilter.org
> https://lists.netfilter.org/mailman/listinfo/netfilter
>
>
> End of netfilter Digest
>


