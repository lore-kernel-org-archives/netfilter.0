From: Doug Watson <doug@1stbooks.com>
Subject: RE: intermittent and unreliable behaviour with iptables scripts
Date: Wed, 13 Nov 2002 09:35:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <91F7518FF779D41181A700010266356D015555DF@mail.springbound.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C28B21.E0F1CD80"
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
To: 'alex' <alex@bennee.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C28B21.E0F1CD80
Content-Type: text/plain;
	charset="iso-8859-1"

To follow up my last email the following text is a sample output from 
the script listed below.

DNAT Stuff
Chain PREROUTING (policy ACCEPT 2603 packets, 376K bytes)
 pkts bytes target     prot opt in     out     source
destination         

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination         
  549 27070 SNAT       all  --  *      eth2    0.0.0.0/0
0.0.0.0/0          to:y.y.y.y 

Chain OUTPUT (policy ACCEPT 4 packets, 284 bytes)
 pkts bytes target     prot opt in     out     source
destination         
Dropped packets of normal chains
Chain INPUT (policy DROP 2392 packets, 361K bytes)
Chain FORWARD (policy DROP 0 packets, 0 bytes)
Chain OUTPUT (policy DROP 0 packets, 0 bytes)
Chain allowed (0 references)
    0     0 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          
Chain bad_tcp_packets (3 references)
   47 19496 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp flags:!0x16/0x02 state NEW 
   27  3478 DROP       all  --  eth2   *       192.168.0.0/16
0.0.0.0/0          
    0     0 DROP       all  --  eth2   *       10.0.0.0/8
0.0.0.0/0          
    0     0 DROP       all  --  eth2   *       172.16.0.0/12
0.0.0.0/0          
Chain icmp_packets (1 references)
Connections
     29
Web Connections
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4918
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4918 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4919
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4919 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4924
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4924 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4925
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4925 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4927
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4927 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4928
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4928 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4929
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4929 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4930
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4930 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4931
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4931 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4932
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4932 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4933
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4933 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=64.236.24.12 sport=4917
dport=80 src=64.236.24.12 dst=y.y.y.y sport=80 dport=4917 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4934
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4934 [ASSURED] use=1 
tcp      6 118 TIME_WAIT src=x.x.x.x dst=207.200.91.248 sport=4920 dport=80
src=207.200.91.248 dst=y.y.y.y sport=80 dport=4920 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.200.91.248 sport=4921
dport=80 src=207.200.91.248 dst=y.y.y.y sport=80 dport=4921 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=207.25.71.252 sport=4936
dport=80 src=207.25.71.252 dst=y.y.y.y sport=80 dport=4936 [ASSURED] use=1 
tcp      6 118 TIME_WAIT src=x.x.x.x dst=207.200.91.248 sport=4922 dport=80
src=207.200.91.248 dst=y.y.y.y sport=80 dport=4922 [ASSURED] use=1 
tcp      6 431999 ESTABLISHED src=x.x.x.x dst=205.188.165.121 sport=4923
dport=80 src=205.188.165.121 dst=y.y.y.y sport=80 dport=4923 [ASSURED] use=1

tcp      6 431999 ESTABLISHED src=x.x.x.x dst=205.188.165.121 sport=4926
dport=80 src=205.188.165.121 dst=y.y.y.y sport=80 dport=4926 [ASSURED] use=1

tcp      6 119 TIME_WAIT src=x.x.x.x dst=63.209.29.151 sport=4935 dport=80
src=63.209.29.151 dst=y.y.y.y sport=80 dport=4935 [ASSURED] use=1 

-----Original Message-----
From: alex [mailto:alex@bennee.com]
Sent: Monday, November 11, 2002 6:19 PM
To: Doug Watson
Cc: 'netfilter@lists.netfilter.org'
Subject: Re: intermittent and unreliable behaviour with iptables scripts


On Mon, 2002-11-11 at 17:25, Doug Watson wrote:
>  However, I along with my test group of 5 "lucky" users began to see
> some
> intermittent and unreliable behavior when accessing the internet
> through
> this new firewall most notably when browsing the web. 
> 
> When browsing the web, web pages that normally would load very quickly
> seem 
> to hang for an inconsistent amount of time, anywhere between 1 second
> to 30 seconds or more
> before they would even begin to load or would at times never load at
> all as
> if the connection to the web was lost.

This sound familiar to my own woes with port forwarded connections. I
suspect a bug in ip_conntrack that somehow causes FORWARDED packets to
end up in the output chains. I've been trying to find out exactly when
this occurs and why (and certainly why my older script worked without
problems).

You could try a using a variation of this script to monitor your
connections "live" and see which rule starts dropping when you
experience your problems. Try using it with something like watch:

    iptables -Z -t nat
    iptables -Z
    watch -n 5 -d ./dumpview

#!/bin/bash
#
# dumpview - try and see where the packets get dropped.
#
echo "DNAT Stuff"
iptables -nvL -t nat
echo "Dropped packets of normal chains"
iptables -nvL | egrep "Chain|DROP"
echo "Connections"
cat /proc/net/ip_conntrack | wc -l
echo "Web Connections"
cat /proc/net/ip_conntrack | grep "port=80" 

-- 
alex <alex@bennee.com>
My own hacking haven

------_=_NextPart_001_01C28B21.E0F1CD80
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2654.45">
<TITLE>RE: intermittent and unreliable behaviour with iptables =
scripts</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>To follow up my last email the following text is a =
sample output from </FONT>
<BR><FONT SIZE=3D2>the script listed below.</FONT>
</P>

<P><FONT SIZE=3D2>DNAT Stuff</FONT>
<BR><FONT SIZE=3D2>Chain PREROUTING (policy ACCEPT 2603 packets, 376K =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =
destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
</P>

<P><FONT SIZE=3D2>Chain POSTROUTING (policy ACCEPT 0 packets, 0 =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =
destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&nbsp; 549 27070 =
SNAT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth2&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
to:y.y.y.y </FONT>
</P>

<P><FONT SIZE=3D2>Chain OUTPUT (policy ACCEPT 4 packets, 284 =
bytes)</FONT>
<BR><FONT SIZE=3D2>&nbsp;pkts bytes target&nbsp;&nbsp;&nbsp;&nbsp; prot =
opt in&nbsp;&nbsp;&nbsp;&nbsp; out&nbsp;&nbsp;&nbsp;&nbsp; =
source&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =
destination&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2>Dropped packets of normal chains</FONT>
<BR><FONT SIZE=3D2>Chain INPUT (policy DROP 2392 packets, 361K =
bytes)</FONT>
<BR><FONT SIZE=3D2>Chain FORWARD (policy DROP 0 packets, 0 =
bytes)</FONT>
<BR><FONT SIZE=3D2>Chain OUTPUT (policy DROP 0 packets, 0 bytes)</FONT>
<BR><FONT SIZE=3D2>Chain allowed (0 references)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0 =
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</FONT>
<BR><FONT SIZE=3D2>Chain bad_tcp_packets (3 references)</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 47 19496 =
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp&nbsp; --&nbsp; =
*&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; 0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcp =
flags:!0x16/0x02 state NEW </FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp; 27&nbsp; 3478 =
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
eth2&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
192.168.0.0/16&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0 =
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
eth2&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
10.0.0.0/8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp; 0 =
DROP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; all&nbsp; --&nbsp; =
eth2&nbsp;&nbsp; *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
172.16.0.0/12&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0.0.0.0/0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2>Chain icmp_packets (1 references)</FONT>
<BR><FONT SIZE=3D2>Connections</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp; 29</FONT>
<BR><FONT SIZE=3D2>Web Connections</FONT>
<BR><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4918 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4918 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4919 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4919 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4924 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4924 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4925 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4925 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4927 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4927 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4928 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4928 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4929 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4929 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4930 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4930 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4931 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4931 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4932 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4932 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4933 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4933 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D64.236.24.12 sport=3D4917 dport=3D80 =
src=3D64.236.24.12 dst=3Dy.y.y.y sport=3D80 dport=3D4917 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4934 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4934 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 118 TIME_WAIT =
src=3Dx.x.x.x dst=3D207.200.91.248 sport=3D4920 dport=3D80 =
src=3D207.200.91.248 dst=3Dy.y.y.y sport=3D80 dport=3D4920 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.200.91.248 sport=3D4921 dport=3D80 =
src=3D207.200.91.248 dst=3Dy.y.y.y sport=3D80 dport=3D4921 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D207.25.71.252 sport=3D4936 dport=3D80 =
src=3D207.25.71.252 dst=3Dy.y.y.y sport=3D80 dport=3D4936 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 118 TIME_WAIT =
src=3Dx.x.x.x dst=3D207.200.91.248 sport=3D4922 dport=3D80 =
src=3D207.200.91.248 dst=3Dy.y.y.y sport=3D80 dport=3D4922 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D205.188.165.121 sport=3D4923 dport=3D80 =
src=3D205.188.165.121 dst=3Dy.y.y.y sport=3D80 dport=3D4923 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 431999 =
ESTABLISHED src=3Dx.x.x.x dst=3D205.188.165.121 sport=3D4926 dport=3D80 =
src=3D205.188.165.121 dst=3Dy.y.y.y sport=3D80 dport=3D4926 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 119 TIME_WAIT =
src=3Dx.x.x.x dst=3D63.209.29.151 sport=3D4935 dport=3D80 =
src=3D63.209.29.151 dst=3Dy.y.y.y sport=3D80 dport=3D4935 [ASSURED] =
use=3D1 </FONT></P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: alex [<A =
HREF=3D"mailto:alex@bennee.com">mailto:alex@bennee.com</A>]</FONT>
<BR><FONT SIZE=3D2>Sent: Monday, November 11, 2002 6:19 PM</FONT>
<BR><FONT SIZE=3D2>To: Doug Watson</FONT>
<BR><FONT SIZE=3D2>Cc: 'netfilter@lists.netfilter.org'</FONT>
<BR><FONT SIZE=3D2>Subject: Re: intermittent and unreliable behaviour =
with iptables scripts</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>On Mon, 2002-11-11 at 17:25, Doug Watson =
wrote:</FONT>
<BR><FONT SIZE=3D2>&gt;&nbsp; However, I along with my test group of 5 =
&quot;lucky&quot; users began to see</FONT>
<BR><FONT SIZE=3D2>&gt; some</FONT>
<BR><FONT SIZE=3D2>&gt; intermittent and unreliable behavior when =
accessing the internet</FONT>
<BR><FONT SIZE=3D2>&gt; through</FONT>
<BR><FONT SIZE=3D2>&gt; this new firewall most notably when browsing =
the web. </FONT>
<BR><FONT SIZE=3D2>&gt; </FONT>
<BR><FONT SIZE=3D2>&gt; When browsing the web, web pages that normally =
would load very quickly</FONT>
<BR><FONT SIZE=3D2>&gt; seem </FONT>
<BR><FONT SIZE=3D2>&gt; to hang for an inconsistent amount of time, =
anywhere between 1 second</FONT>
<BR><FONT SIZE=3D2>&gt; to 30 seconds or more</FONT>
<BR><FONT SIZE=3D2>&gt; before they would even begin to load or would =
at times never load at</FONT>
<BR><FONT SIZE=3D2>&gt; all as</FONT>
<BR><FONT SIZE=3D2>&gt; if the connection to the web was lost.</FONT>
</P>

<P><FONT SIZE=3D2>This sound familiar to my own woes with port =
forwarded connections. I</FONT>
<BR><FONT SIZE=3D2>suspect a bug in ip_conntrack that somehow causes =
FORWARDED packets to</FONT>
<BR><FONT SIZE=3D2>end up in the output chains. I've been trying to =
find out exactly when</FONT>
<BR><FONT SIZE=3D2>this occurs and why (and certainly why my older =
script worked without</FONT>
<BR><FONT SIZE=3D2>problems).</FONT>
</P>

<P><FONT SIZE=3D2>You could try a using a variation of this script to =
monitor your</FONT>
<BR><FONT SIZE=3D2>connections &quot;live&quot; and see which rule =
starts dropping when you</FONT>
<BR><FONT SIZE=3D2>experience your problems. Try using it with =
something like watch:</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; iptables -Z -t nat</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; iptables -Z</FONT>
<BR><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; watch -n 5 -d ./dumpview</FONT>
</P>

<P><FONT SIZE=3D2>#!/bin/bash</FONT>
<BR><FONT SIZE=3D2>#</FONT>
<BR><FONT SIZE=3D2># dumpview - try and see where the packets get =
dropped.</FONT>
<BR><FONT SIZE=3D2>#</FONT>
<BR><FONT SIZE=3D2>echo &quot;DNAT Stuff&quot;</FONT>
<BR><FONT SIZE=3D2>iptables -nvL -t nat</FONT>
<BR><FONT SIZE=3D2>echo &quot;Dropped packets of normal =
chains&quot;</FONT>
<BR><FONT SIZE=3D2>iptables -nvL | egrep &quot;Chain|DROP&quot;</FONT>
<BR><FONT SIZE=3D2>echo &quot;Connections&quot;</FONT>
<BR><FONT SIZE=3D2>cat /proc/net/ip_conntrack | wc -l</FONT>
<BR><FONT SIZE=3D2>echo &quot;Web Connections&quot;</FONT>
<BR><FONT SIZE=3D2>cat /proc/net/ip_conntrack | grep =
&quot;port=3D80&quot; </FONT>
</P>

<P><FONT SIZE=3D2>-- </FONT>
<BR><FONT SIZE=3D2>alex &lt;alex@bennee.com&gt;</FONT>
<BR><FONT SIZE=3D2>My own hacking haven</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C28B21.E0F1CD80--

