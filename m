From: GIlles =?ISO-8859-1?Q?L=E9vesque?= <mag-datacom@sympatico.ca>
Subject: re  : weird interface !
Date: 05 Nov 2002 14:55:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036526122.1248.12.camel@ti-gil.mag-datacom.ca>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-mlJj2IWsjOrmX+VVaPAW"
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
To: webmasta0@hotmail.com
Cc: netfilter@lists.netfilter.org


--=-mlJj2IWsjOrmX+VVaPAW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This  is the TUN/TAP device take a look into your kernel configurations
into Networkiing options
(IP: tunneling).
you can check out :
http://anchor.cs.binghamton.edu/~mobileip/LJ/index.html



>hello
>i'm running a redhat machine and while checking
>[root@localhost root]# ifconfig -a
>lo        Link encap:Local Loopback
>          LOOPBACK  MTU:16436  Metric:1
>          RX packets:316 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:316 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:0 txqueuelen:0
>          RX bytes:15800 (15.4 Kb)  TX bytes:15800 (15.4 Kb)
>
>ppp0      Link encap:Point-to-Point Protocol
>          inet addr:62.135.14.214  P-t-P:172.17.9.205=20
Mask:255.255.255.255
>          UP POINTOPOINT RUNNING NOARP MULTICAST  MTU:1524  Metric:1
>          RX packets:1739 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:1942 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:0 txqueuelen:3
>          RX bytes:528941 (516.5 Kb)  TX bytes:178970 (174.7 Kb)
>
>tunl0     Link encap:IPIP Tunnel  HWaddr
>          NOARP  MTU:1480  Metric:1
>          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>          collisions:0 txqueuelen:0
>          RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
>
>[root@localhost root]#
>
>i see tunl0 and i dont know who made it and why is it there its always
0.0 b=20
>and its always there even if ppp0 isnt up , so i'd like to investigate
this=20
>, is my machine compromised or a software made it , please help me with
it .
>
>i though of running iptables to listen to what passes there .
>any ideas ?
>thanks in advance
>
>
>_________________________________________________________________
>Surf the Web without missing calls! Get MSN Broadband.=20
>http://resourcecenter.msn.com/access/plans/freeactivation.asp


Gilles L=C3=A9vesque, RHCE
M.A.G. Datacom
373, rue T=C3=A9miscouata
Rivi=C3=A8re-du-Loup (Qu=C3=A9bec)
G5R 2Y9
T=C3=A9l=C3=A9phone : (418) 867-8656
T=C3=A9l=C3=A9copieur : (418) 867-3870


--=-mlJj2IWsjOrmX+VVaPAW
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
This&nbsp; is the TUN/TAP device take a look into your kernel configurations into Networkiing options
<BR>
(IP: tunneling).
<BR>
you can check out : <A HREF="http://anchor.cs.binghamton.edu/~mobileip/LJ/index.html">http://anchor.cs.binghamton.edu/~mobileip/LJ/index.html</A>
<BR>

<BR>

<BR>

<BR>
&gt;hello
<BR>
&gt;i'm running a redhat machine and while checking
<BR>
&gt;[root@localhost root]# ifconfig -a
<BR>
&gt;lo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Link encap:Local Loopback
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LOOPBACK&nbsp; MTU:16436&nbsp; Metric:1
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX packets:316 errors:0 dropped:0 overruns:0 frame:0
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TX packets:316 errors:0 dropped:0 overruns:0 carrier:0
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; collisions:0 txqueuelen:0
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX bytes:15800 (15.4 Kb)&nbsp; TX bytes:15800 (15.4 Kb)
<BR>
&gt;
<BR>
&gt;ppp0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Link encap:Point-to-Point Protocol
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inet addr:62.135.14.214&nbsp; P-t-P:172.17.9.205&nbsp; Mask:255.255.255.255
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UP POINTOPOINT RUNNING NOARP MULTICAST&nbsp; MTU:1524&nbsp; Metric:1
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX packets:1739 errors:0 dropped:0 overruns:0 frame:0
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TX packets:1942 errors:0 dropped:0 overruns:0 carrier:0
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; collisions:0 txqueuelen:3
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX bytes:528941 (516.5 Kb)&nbsp; TX bytes:178970 (174.7 Kb)
<BR>
&gt;
<BR>
&gt;tunl0&nbsp;&nbsp;&nbsp;&nbsp; Link encap:IPIP Tunnel&nbsp; HWaddr
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NOARP&nbsp; MTU:1480&nbsp; Metric:1
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX packets:0 errors:0 dropped:0 overruns:0 frame:0
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; collisions:0 txqueuelen:0
<BR>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RX bytes:0 (0.0 b)&nbsp; TX bytes:0 (0.0 b)
<BR>
&gt;
<BR>
&gt;[root@localhost root]#
<BR>
&gt;
<BR>
&gt;i see tunl0 and i dont know who made it and why is it there its always 0.0 b 
<BR>
&gt;and its always there even if ppp0 isnt up , so i'd like to investigate this 
<BR>
&gt;, is my machine compromised or a software made it , please help me with it .
<BR>
&gt;
<BR>
&gt;i though of running iptables to listen to what passes there .
<BR>
&gt;any ideas ?
<BR>
&gt;thanks in advance
<BR>
&gt;
<BR>
&gt;
<BR>
&gt;_________________________________________________________________
<BR>
&gt;Surf the Web without missing calls! Get MSN Broadband. 
<BR>
&gt;<A HREF="http://resourcecenter.msn.com/access/plans/freeactivation.asp">http://resourcecenter.msn.com/access/plans/freeactivation.asp</A>
<BR>

<BR>

<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<FONT SIZE="3"><B>Gilles L&#233;vesque, RHCE</FONT></B>
<BR>
<FONT SIZE="3"><B>M.A.G. Datacom</FONT></B>
<BR>
373, rue T&#233;miscouata
<BR>
Rivi&#232;re-du-Loup (Qu&#233;bec)
<BR>
G5R 2Y9
<BR>
<FONT SIZE="2">T&#233;l&#233;phone : (418) 867-8656</FONT>
<BR>
<FONT SIZE="2">T&#233;l&#233;copieur : (418) 867-3870</FONT>
<BR>

</TD>
</TR>
</TABLE>

</BODY>
</HTML>

--=-mlJj2IWsjOrmX+VVaPAW--


