From: Stefan_Walther@gehag-dsk.de
Subject: RE: DirectX 8.1 and NAT
Date: Thu, 5 Dec 2002 10:28:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFD1192372.B17CDA9E-ONC1256C86.0033FA97@GEHAG-DSK.DE>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 0033CA67C1256C86_="
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
To: netfilter@lists.netfilter.org

This is a multipart message in MIME format.
--=_alternative 0033CA67C1256C86_=
Content-Type: text/plain; charset="us-ascii"

hi folks, 

i don't think this is a problem with iptables. some games using special 
gameservers, like gamespy. those servers don't allow to play over routers. 
these servers recognise that you are behind a firewall and try to send 
data back to the ip you have in your local lan. that's why i think there 
is no problem with iptables. 

Best Regards,
MfG.

Stefan Walther
stefan_walther@gehag-dsk.de
dienst.: +4930/89786448
Funk: +49172/3943961
http://www.gehag-dsk.de

-------------------------------------------------------------- 
Linux/UNIX is like an Indian Tipi:
No Windows, no Gates and Apache inside.

Outgoing Mail is certified mistake-free. 
Examined by DOGMATIC infallibility system. 
Version 6.04 



"Raj Wurttemberg" <rajw@c64.us> 
Sent by: netfilter-admin@lists.netfilter.org 
04.12.2002 03:56 
        
        To:        <netfilter@lists.netfilter.org> 
        cc:         
        Subject:        RE: DirectX 8.1 and NAT



> standard. So either way this claim is bogus as is any claim without
> reasonable proof.

Well to be honest and from my experience (or inexperience) with
Micro$oft's MechWarrior 4 game it IS possible for ONE computer to play
behind an iptables firewall. I do not know that much about iptables and
I am learning gradually from this mailing list... but here is what I
have on my firewall so I can play MechWarrior 4 (Please don't beat me up
to badly... I'm an iptables noob!): 

IPTABLES="/sbin/iptables"
STATIC_IP="My IP address from the ISP"
INTERNAL="My game systems's internal ip address"
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 6073 -j DNAT
--to $INTERNAL:6073
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 6667 -j DNAT
--to $INTERNAL:6667
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 9999 -j DNAT
--to $INTERNAL:9999
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 2200:2400 -j
DNAT --to $INTERNAL:2200-2400
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 2200:2400 -j
DNAT --to $INTERNAL:2200-2400
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 27999:29000
-j DNAT --to $INTERNAL:27999-29000
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 27999:29000
-j DNAT --to $INTERNAL:27999-29000
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 47624 -j
DNAT --to $INTERNAL:47624
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 47624 -j
DNAT --to $INTERNAL:47624

$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 6073 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 6667 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 9999 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 2200:2400 -j ACCEPT
$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 2200:2400 -j ACCEPT
$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 27999:29000 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 27999:29000 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 47624 -j ACCEPT
$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 47624 -j ACCEPT

Comments, corrections, and advice are welcome.

Thanks,
/*Raj*/






--=_alternative 0033CA67C1256C86_=
Content-Type: text/html; charset="us-ascii"


<br>
<br>
<br><font size=2 face="sans-serif"><br>
hi folks,</font><font size=3 face="Times New Roman"> <br>
</font><font size=2 face="sans-serif"><br>
i don't think this is a problem with iptables. some games using special gameservers, like gamespy. those servers don't allow to play over routers. these servers recognise that you are behind a firewall and try to send data back to the ip you have in your local lan. that's why i think there is no problem with iptables.</font><font size=3 face="Times New Roman"> <br>
</font><font size=2 face="sans-serif"><br>
Best Regards,<br>
MfG.<br>
<br>
Stefan Walther<br>
stefan_walther@gehag-dsk.de<br>
dienst.: +4930/89786448<br>
Funk: +49172/3943961<br>
http://www.gehag-dsk.de<br>
<br>
-------------------------------------------------------------- <br>
Linux/UNIX is like an Indian Tipi:<br>
No Windows, no Gates and Apache inside.<br>
<br>
Outgoing Mail is certified mistake-free. <br>
Examined by DOGMATIC infallibility system. <br>
Version 6.04</font><font size=3 face="Times New Roman"> <br>
<br>
</font>
<table width=100%>
<tr valign=top>
<td width=3%>
<td width=47%><font size=1 face="sans-serif"><b>&quot;Raj Wurttemberg&quot; &lt;rajw@c64.us&gt;</b></font><font size=3 face="Times New Roman"> </font><font size=1 face="sans-serif"><br>
Sent by: netfilter-admin@lists.netfilter.org</font><font size=3 face="Times New Roman"> </font>
<p><font size=1 face="sans-serif">04.12.2002 03:56</font><font size=3 face="Times New Roman"> </font>
<td width=48%><font size=1 face="Arial">&nbsp; &nbsp; &nbsp; &nbsp; </font><font size=1 face="sans-serif"><br>
 &nbsp; &nbsp; &nbsp; &nbsp;To: &nbsp; &nbsp; &nbsp; &nbsp;&lt;netfilter@lists.netfilter.org&gt;</font><font size=3 face="Times New Roman"> </font><font size=1 face="sans-serif"><br>
 &nbsp; &nbsp; &nbsp; &nbsp;cc: &nbsp; &nbsp; &nbsp; &nbsp;</font><font size=3 face="Times New Roman"> </font><font size=1 face="sans-serif"><br>
 &nbsp; &nbsp; &nbsp; &nbsp;Subject: &nbsp; &nbsp; &nbsp; &nbsp;RE: DirectX 8.1 and NAT</font></table>
<br><font size=3 face="Times New Roman"><br>
<br>
</font><font size=2 face="Courier New"><br>
&gt; standard. So either way this claim is bogus as is any claim without<br>
&gt; reasonable proof.<br>
<br>
Well to be honest and from my experience (or inexperience) with<br>
Micro$oft's MechWarrior 4 game it IS possible for ONE computer to play<br>
behind an iptables firewall. I do not know that much about iptables and<br>
I am learning gradually from this mailing list... but here is what I<br>
have on my firewall so I can play MechWarrior 4 (Please don't beat me up<br>
to badly... I'm an iptables noob!): <br>
<br>
IPTABLES=&quot;/sbin/iptables&quot;<br>
STATIC_IP=&quot;My IP address from the ISP&quot;<br>
INTERNAL=&quot;My game systems's internal ip address&quot;<br>
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 6073 -j DNAT<br>
--to $INTERNAL:6073<br>
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 6667 -j DNAT<br>
--to $INTERNAL:6667<br>
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 9999 -j DNAT<br>
--to $INTERNAL:9999<br>
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 2200:2400 -j<br>
DNAT --to $INTERNAL:2200-2400<br>
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 2200:2400 -j<br>
DNAT --to $INTERNAL:2200-2400<br>
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 27999:29000<br>
-j DNAT --to $INTERNAL:27999-29000<br>
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 27999:29000<br>
-j DNAT --to $INTERNAL:27999-29000<br>
$IPTABLES -t nat -A PREROUTING -p tcp -d $STATIC_IP --dport 47624 -j<br>
DNAT --to $INTERNAL:47624<br>
$IPTABLES -t nat -A PREROUTING -p udp -d $STATIC_IP --dport 47624 -j<br>
DNAT --to $INTERNAL:47624<br>
<br>
$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 6073 -j ACCEPT<br>
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 6667 -j ACCEPT<br>
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 9999 -j ACCEPT<br>
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 2200:2400 -j ACCEPT<br>
$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 2200:2400 -j ACCEPT<br>
$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 27999:29000 -j ACCEPT<br>
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 27999:29000 -j ACCEPT<br>
$IPTABLES -A FORWARD -p tcp -d $INTERNAL --dport 47624 -j ACCEPT<br>
$IPTABLES -A FORWARD -p udp -d $INTERNAL --dport 47624 -j ACCEPT<br>
<br>
Comments, corrections, and advice are welcome.</font>
<br><font size=2 face="Courier New"><br>
Thanks,<br>
/*Raj*/<br>
<br>
</font><font size=3 face="Times New Roman"><br>
<br>
</font>
<br>
<br>
--=_alternative 0033CA67C1256C86_=--

