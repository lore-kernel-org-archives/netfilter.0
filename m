From: hclfm@pricol.co.in
Subject: Re: DNAT/SNAT and logging anyone?
Date: Tue, 20 Jan 2004 12:17:17 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFEE9F5FE0.01F15485-ON65256E21.00254989@pricol.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
MIME-Version: 1.0
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/html; charset="us-ascii"
To: netfilter@lists.netfilter.org

<P>&nbsp;</P><P><FONT SIZE=3D4>&nbsp;Hi ,</FONT><BR><BR><FONT SIZE=3D4>&nbs=
p;Use &nbsp;<B>--log-level debug </B>option with your logging command.</FON=
T><BR><BR><FONT SIZE=3D4>&nbsp;you will get the required IP and port inform=
ation in logs.</FONT><BR><BR><FONT SIZE=3D4>regards,</FONT><BR><BR><FONT SI=
ZE=3D4>U.SivaKumar.</FONT><BR><BR><FONT SIZE=3D4>&nbsp;HCL Infosystems Limi=
ted.</FONT><BR><BR><BR><BR><BR><BR><B>Johan Ankarloo &lt;johan.ankarloo@vol=
vo.com&gt;</B><BR>Sent by: netfilter-admin@lists.netfilter.org<BR>01/20/200=
4 07:41 AM CET<BR><BR>To:<FONT SIZE=3D4> </FONT>netfilter@lists.netfilter.o=
rg<BR>cc:<FONT SIZE=3D4> </FONT><BR>bcc:<FONT SIZE=3D4> </FONT><BR>Subject:=
<FONT SIZE=3D4> </FONT>Re: DNAT/SNAT and logging anyone?<BR><BR><BR><FONT S=
IZE=3D4>Hi all. This is a repost. Thanks to Jeffrey for trying to help me.<=
/FONT><BR><BR><FONT SIZE=3D4>I need a way to log SNAT/DNAT packets. In the =
log i need all the</FONT><BR><FONT SIZE=3D4>information about what have hap=
pend to the packet. Since the log target</FONT><BR><FONT SIZE=3D4>is above =
the actually mangle line, the log target won't know how the</FONT><BR><FONT=
 SIZE=3D4>packet will be mangle. What i need in the log files are:</FONT><B=
R><BR><FONT SIZE=3D4>Original Source</FONT><BR><FONT SIZE=3D4>Original Sour=
cePort</FONT><BR><FONT SIZE=3D4>Original Destination</FONT><BR><FONT SIZE=
=3D4>Original DestinationPort</FONT><BR><FONT SIZE=3D4>Translated Source</F=
ONT><BR><FONT SIZE=3D4>Translated SourcePort</FONT><BR><FONT SIZE=3D4>Trans=
lated Destination</FONT><BR><FONT SIZE=3D4>Translated DestinationPort</FONT=
><BR><BR><FONT SIZE=3D4>As an example, take a look at the documentaion abou=
t nat and look at the</FONT><BR><FONT SIZE=3D4>examples below taken from</F=
ONT><BR><FONT SIZE=3D4 COLOR=3DBLUE><U><A HREF=3Dhttp://www.netfilter.org/d=
ocumentation/HOWTO//NAT-HOWTO-6.html>http://www.netfilter.org/documentation=
/HOWTO//NAT-HOWTO-6.html</A></U></FONT><FONT COLOR=3DBLACK><BR><BR></FONT><=
FONT SIZE=3D4>---- SNIP ----</FONT><BR><FONT SIZE=3D4>## Change destination=
 addresses to 5.6.7.8, 5.6.7.9 or 5.6.7.10.</FONT><BR><FONT SIZE=3D4># ipta=
bles -t nat -A PREROUTING -i eth0 -j DNAT --to 5.6.7.8-5.6.7.10</FONT><BR><=
FONT SIZE=3D4>## Change source addresses to 1.2.3.4, 1.2.3.5 or 1.2.3.6</FO=
NT><BR><FONT SIZE=3D4># iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to=
 1.2.3.4-1.2.3.6</FONT><BR><FONT SIZE=3D4>---- SNIP ----</FONT><BR><BR><FON=
T SIZE=3D4>Here you can se that you can do DNAT and SNAT to an range of ipa=
dresse</FONT><BR><FONT SIZE=3D4>so the question may be a bit clearer when i=
 ask the question like this.</FONT><BR><FONT SIZE=3D4>How is it possible to=
 log to wich ipadress the connection is translated</FONT><BR><FONT SIZE=3D4=
>to?</FONT><BR><BR><FONT SIZE=3D4>Regards</FONT><BR><BR><FONT SIZE=3D4>Joha=
n</FONT><BR><BR><FONT SIZE=3D4>On Mon, 2004-01-19 at 20:17, Jeffrey Laramie=
 wrote:</FONT><BR><FONT SIZE=3D4>&gt; Johan Ankarloo wrote:</FONT><BR><FONT=
 SIZE=3D4>&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;On Mon, 2004-01-19 at 17:2=
4, Jeffrey Laramie wrote:</FONT><BR><FONT SIZE=3D4>&gt; &gt;</FONT><BR><FON=
T SIZE=3D4>&gt; &gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;Johan Ankarloo w=
rote:</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; =
&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;</FONT><BR><FONT SIZE=3D4>&g=
t; &gt;&gt;&gt;On Mon, 2004-01-19 at 16:21, Jeffrey Laramie wrote:</FONT><B=
R><FONT SIZE=3D4>&gt; &gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&g=
t;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt;=
 &gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;Johan Ankarloo =
wrote:</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=
=3D4>&gt; &gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;</=
FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt;=
 &gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;&gt;Hi</FON=
T><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt=
; &gt;&gt;&gt;&gt;&gt;Does anyone know how to log a DNAT/SNAT connection? W=
hen logging a NAT</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;&gt;connect=
ion you also want to know the origin source/destination/port of</FONT><BR><=
FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;&gt;that packet. Is that possible?</FONT=
><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt;=
 &gt;&gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;&gt;</F=
ONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&=
gt; &gt;&gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;&gt;=
</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D=
4>&gt; &gt;&gt;&gt;&gt;Sure. The easiest way to do it is to add a matching =
log rule just before</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;the nat =
rule:</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=
=3D4>&gt; &gt;&gt;&gt;&gt;iptables -t nat -A POSTROUTING -o $Net=5FInterfac=
e -j LOG --log-prefix</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;&quot;S=
NAT: &quot;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;iptables -t nat -=
A POSTROUTING -o $Net=5FInterface -j SNAT --to $Net=5FIP</FONT><BR><FONT SI=
ZE=3D4>&gt; &gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;=
Jeff</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D=
4>&gt; &gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;</FON=
T><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &g=
t;&gt;&gt;The problem is when doing this is that you doesn't get the origin=
al</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;source/destination or the tran=
slating adress. If you look at the logs</FONT><BR><FONT SIZE=3D4>&gt; &gt;&=
gt;&gt;you can't see all the information that you need to be able to debug =
any</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;problem or to be able to trac=
k that connection back to the user.</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&=
gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt=
; &gt;&gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;&gt;</FONT><BR><FONT S=
IZE=3D4>&gt; &gt;&gt;I don't use DNAT so I can't tell you how it logs conne=
ctions, but</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;logging a SNAT connection=
 works fine. Here's the rules I used:</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt=
;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;# Masquerade everything leaving the=
 lan as the firewall IP.</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;$iptables -t=
 nat -A POSTROUTING -o $Net=5FInterface -j LOG --log-level</FONT><BR><FONT =
SIZE=3D4>&gt; &gt;&gt;debug --log-prefix &quot;SNAT: &quot;</FONT><BR><FONT=
 SIZE=3D4>&gt; &gt;&gt;$iptables -t nat -A POSTROUTING -o $Net=5FInterface =
-j SNAT --to $Net=5FIP</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;</FONT><BR><FO=
NT SIZE=3D4>&gt; &gt;&gt;And here's the log entry I got:</FONT><BR><FONT SI=
ZE=3D4>&gt; &gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;Jan 19 11:14:21 =
NS1 kernel: SNAT: IN=3D OUT=3Deth1 SRC=3D192.168.0.4</FONT><BR><FONT SIZE=
=3D4>&gt; &gt;&gt;DST=3D66.95.2.50 LEN=3D44 TOS=3D0x08 PREC=3D0x00 TTL=3D63=
 ID=3D17955 PROTO=3DTCP</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;SPT=3D1030 DP=
T=3D80 WINDOW=3D28672 RES=3D0x00 SYN URGP=3D0</FONT><BR><FONT SIZE=3D4>&gt;=
 &gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;</FONT><BR><FONT SIZE=3D4>&=
gt; &gt;&gt;192.168.0.4 is the source host on the local private subnet</FON=
T><BR><FONT SIZE=3D4>&gt; &gt;&gt;66.95.2.50 is the IP of the remote host</=
FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;Sending port is 1030</FONT><BR><FONT S=
IZE=3D4>&gt; &gt;&gt;Dest port is 80</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;=
</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;And $Net=5FIP is IP the outside will=
 see which is the IP of the firewall.</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt=
;The SNATed ports will be the same as the original ones.</FONT><BR><FONT SI=
ZE=3D4>&gt; &gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;Isn't this what =
you're looking for or did I misunderstand you?</FONT><BR><FONT SIZE=3D4>&gt=
; &gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;Jeff</FONT><BR><FONT SIZE=
=3D4>&gt; &gt;&gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;&gt;</FONT><BR><FONT S=
IZE=3D4>&gt; &gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;No, i don't see all the=
 information in your example above. Look at the</FONT><BR><FONT SIZE=3D4>&g=
t; &gt;following examples taken from the examples at</FONT><BR><FONT SIZE=
=3D4>&gt; &gt;http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-6.htm=
l</FONT><BR><FONT SIZE=3D4>&gt; &gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;----=
 SNIP ----</FONT><BR><FONT SIZE=3D4>&gt; &gt;## Change destination addresse=
s to 5.6.7.8, 5.6.7.9 or 5.6.7.10.</FONT><BR><FONT SIZE=3D4>&gt; &gt;# ipta=
bles -t nat -A PREROUTING -i eth0 -j DNAT --to 5.6.7.8-5.6.7.10</FONT><BR><=
FONT SIZE=3D4>&gt; &gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;## Change source =
addresses to 1.2.3.4, 1.2.3.5 or 1.2.3.6</FONT><BR><FONT SIZE=3D4>&gt; &gt;=
# iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 1.2.3.4-1.2.3.6</FONT=
><BR><FONT SIZE=3D4>&gt; &gt;---- SNIP ----</FONT><BR><FONT SIZE=3D4>&gt; &=
gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;Here you can se that you can do DNAT =
and SNAT to an range of ipadresse</FONT><BR><FONT SIZE=3D4>&gt; &gt;so the =
question may be a bit clearer when i ask the question like this.</FONT><BR>=
<FONT SIZE=3D4>&gt; &gt;How is it possible to log to wich ipadress the conn=
ection is translated</FONT><BR><FONT SIZE=3D4>&gt; &gt;to?</FONT><BR><FONT =
SIZE=3D4>&gt; &gt;</FONT><BR><FONT SIZE=3D4>&gt; &gt;</FONT><BR><FONT SIZE=
=3D4>&gt;</FONT><BR><FONT SIZE=3D4>&gt; Ahh, I see what the issue is. You '=
know' the translated IP because you</FONT><BR><FONT SIZE=3D4>&gt; explicitl=
y set it within the NAT rule, not because it's in the log. In</FONT><BR><FO=
NT SIZE=3D4>&gt; the case of a target range there is no way for a prior log=
ging rule to</FONT><BR><FONT SIZE=3D4>&gt; tell which of the range addresse=
s will be assigned by the NAT rule. I</FONT><BR><FONT SIZE=3D4>&gt; think y=
ou'll need to use a tool like snort to get that kind of detail.</FONT><BR><=
FONT SIZE=3D4>&gt; Maybe someone else knows another way, sorry I couldn't h=
elp you.</FONT><BR><FONT SIZE=3D4>&gt;</FONT><BR><FONT SIZE=3D4>&gt; Jeff</=
FONT><BR></P>=

