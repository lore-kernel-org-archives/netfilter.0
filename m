From: "Larry Flathmann" <larryf@sdintegrators.com>
Subject: RE: Bad argument `53'
Date: Wed, 9 Oct 2002 23:17:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EMEOLBJEBJGNEOCBICHDAEAHCCAA.larryf@sdintegrators.com>
References: <002501c27010$da433360$4101a8c0@ramasamy>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0041_01C26FEA.01DC9960"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002501c27010$da433360$4101a8c0@ramasamy>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Sundaram <sun@percipia.com>, "David F. Strauch" <dstrauch@cyberlink.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0041_01C26FEA.01DC9960
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

When you get an error message about a bad argument, it's usually because
something earlier in the line was missing. So, for example, in the command:
    iptables -A OUTPUT -o $INTERNET -p udp \

             -s $IPADDR --sport $UNPRIVPORTS \

             -d $NAMESERVER --dport 53 \

             -m state --state NEW -j ACCEPT

probably one or more of your variables is not defined correctly.



You can use the command:

# sh -x /etc/rc.d/rc.firewalls &> trace

to run the script and find what the error was in interpreting it.

This command will produce a file called 'trace' which will show each command
the way it was interpreted and (because of the '&') will also show the error
messages produced as a result.



That should help you to figure out exactly where the error is coming from.



Good luck Dave! You're starting a fun ride!



----------------

Larry Flathmann

Systems & Data Integrators

www.sdintegrators.com

  -----Original Message-----
  From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Sundaram
  Sent: Wednesday, October 09, 2002 10:55 PM
  To: David F. Strauch; netfilter@lists.netfilter.org
  Subject: Re: Bad argument `53'


  I have this rules set in my  firewall, it is working for me.

  $IPT -A OUTPUT -o $EXT -p tcp --sport $UNPRI --dport 53 -j ACCEPT

  $IPT -t nat -A PREROUTING  -i $EXT -d $EXT_IP1  -p tcp --dport 25 -j
DNAT --to $INT_IP1
  $IPT -A FORWARD -p tcp  --dport 25 -d $INT_IP1 -j ACCEPT

  I am also using REdhat 7.3 Kernel 2.4.18-3 and iptables 1.2.7
    ----- Original Message -----
    From: David F. Strauch
    To: netfilter@lists.netfilter.org
    Sent: Wednesday, October 09, 2002 10:17 PM
    Subject: Bad argument `53'


    Hello Everyone



    By reading New Riders =93Linux Firewalls=94 by Robert L. Ziegler I=92m =
just
starting to study iptables.  I have a stand-alone firewall offline and off
the local network running RHL 7.3 with Kernel 2.4.18-3 and iptables 1.2.5.



    I=92ve just started writing the script to allow DNS Loopkups as a client
with the following:



    if [ "$CONNECTION_TRACKING" =3D "1" ]; then

        iptables -A OUTPUT -o $INTERNET -p udp \

                 -s $IPADDR --sport $UNPRIVPORTS \

                 -d $NAMESERVER --dport 53 \

                 -m state --state NEW -j ACCEPT

    fi



    iptables -A OUTPUT -o $INTERNET -p udp \

             -s $IPADDR --sport $UNPRIVPORTS \

             -d $NAMESERVER --dport 53 -j ACCEPT



    iptables -A INPUT  -i $INTERNET -p udp \

             -s $NAMESERVER --sport 53 \

             -d $IPADDR --dport $UNPRIVPORTS -j ACCEPT



    When I execute the script with sh /etc/rc.d/rc.firewalls I receive Bad
argument `53' for every instance of either  --dport 53 or --sport 53.  I=92=
ve
also tried --destination-port and --source-port with out any success.



    Can anyone shed some light on my problem?

    Dave

------=_NextPart_000_0041_01C26FEA.01DC9960
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML xmlns:o =3D "urn:schemas-microsoft-com:office:office"><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dwindows-1252">
<META content=3D"MSHTML 5.50.4807.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV><SPAN class=3D281130804-10102002><FONT face=3DArial color=3D#0000ff =
size=3D2>When=20
you get an error message about a bad argument, it's usually because =
something=20
earlier in the line was missing. So, for example, in the=20
command:</FONT></SPAN></DIV>
<DIV><SPAN class=3D281130804-10102002>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp; </SPAN>iptables -A OUTPUT =
-o=20
$INTERNET -p udp \<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
</SPAN>-s $IPADDR --sport $UNPRIVPORTS \<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
</SPAN>-d $NAMESERVER --dport 53 \<o:p></o:p></FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
</SPAN>-m state --state NEW -j ACCEPT</FONT></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT face=3DArial>probably one or more of =
your variables=20
is not defined correctly.</FONT></SPAN></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT =
face=3DArial></FONT></SPAN></o:p></SPAN>&nbsp;</P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT face=3DArial>You can use the=20
command:</FONT></SPAN></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT face=3DArial># sh -x =
/etc/rc.d/rc.firewalls=20
&amp;&gt; trace</FONT></SPAN></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT face=3DArial>to run the script and find =
what the=20
error was in interpreting it.</FONT></SPAN></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT face=3DArial>This command will produce =
a file=20
called 'trace' which will show&nbsp;each command the way it was =
interpreted and=20
(because of the '&amp;') will also show the error messages produced as a =

result.</FONT></SPAN></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT =
face=3DArial></FONT></SPAN></o:p></SPAN>&nbsp;</P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT face=3DArial>That should help you to =
figure out=20
exactly where the error is coming from.</FONT></SPAN></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT =
face=3DArial></FONT></SPAN></o:p></SPAN>&nbsp;</P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT face=3DArial>Good luck Dave! You're =
starting a fun=20
ride!</FONT></SPAN></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT =
face=3DArial></FONT></SPAN></o:p></SPAN>&nbsp;</P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT=20
face=3DArial>----------------</FONT></SPAN></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT face=3DArial>Larry=20
Flathmann</FONT></SPAN></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT face=3DArial>Systems &amp; Data=20
Integrators</FONT></SPAN></o:p></SPAN></P>
<P class=3DMsoNormal=20
style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><o:p><SPAN=20
class=3D281130804-10102002><FONT face=3DArial><A=20
href=3D"http://www.sdintegrators.com/">www.sdintegrators.com</A>=20
</FONT></SPAN></o:p></SPAN></P></SPAN></DIV></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B>=20
  netfilter-admin@lists.netfilter.org=20
  [mailto:netfilter-admin@lists.netfilter.org]<B>On Behalf Of=20
  </B>Sundaram<BR><B>Sent:</B> Wednesday, October 09, 2002 10:55=20
  PM<BR><B>To:</B> David F. Strauch;=20
  netfilter@lists.netfilter.org<BR><B>Subject:</B> Re: Bad argument `53' =

  <BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>I have this rules set in my&nbsp; =
firewall, it is=20
  working for me.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>$IPT -A OUTPUT -o $EXT -p tcp --sport =
$UNPRI=20
  --dport 53 -j ACCEPT</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>$IPT -t nat -A PREROUTING&nbsp; -i =
$EXT -d=20
  $EXT_IP1&nbsp; -p tcp --dport 25 -j DNAT --to $INT_IP1<BR>$IPT -A =
FORWARD -p=20
  tcp&nbsp; --dport 25 -d $INT_IP1 -j ACCEPT</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I am also using REdhat 7.3 Kernel =
2.4.18-3 and=20
  iptables 1.2.7</FONT></DIV>
  <BLOCKQUOTE dir=3Dltr=20
  style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
    <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
    <DIV=20
    style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
    <A title=3Ddstrauch@cyberlink.com =
href=3D"mailto:dstrauch@cyberlink.com">David=20
    F. Strauch</A> </DIV>
    <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
    title=3Dnetfilter@lists.netfilter.org=20
    =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
    </DIV>
    <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Wednesday, October 09, =
2002 10:17=20
    PM</DIV>
    <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Bad argument `53' =
</DIV>
    <DIV><FONT face=3DArial size=3D2></FONT><FONT face=3DArial=20
size=3D2></FONT><BR></DIV>
    <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial size=3D2>Hello=20
    Everyone</FONT></P>
    <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial=20
    size=3D2></FONT>&nbsp;</P>
    <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial><FONT=20
    size=3D2>By reading New Riders =93Linux Firewalls=94 by Robert L. =
Ziegler I=92m just=20
    starting to study iptables.<SPAN style=3D"mso-spacerun: yes">&nbsp; =
</SPAN>I=20
    have a stand-alone firewall offline and off the local network =
running RHL=20
    7.3 with Kernel 2.4.18-3 and iptables 1.2.5.</FONT></FONT></P>
    <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial><FONT=20
    size=3D2>&nbsp;<o:p></o:p></FONT></FONT></P>
    <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial size=3D2>I=92ve=20
    just started writing the script to allow DNS Loopkups as a client =
with the=20
    following:</FONT></P>
    <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial><FONT=20
    size=3D2>&nbsp;<o:p></o:p></FONT></FONT></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial>if [=20
    "$CONNECTION_TRACKING" =3D "1" ]; then<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
    style=3D"mso-spacerun: yes">&nbsp;&nbsp;&nbsp; </SPAN>iptables -A =
OUTPUT -o=20
    $INTERNET -p udp \<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
    style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
    </SPAN>-s $IPADDR --sport $UNPRIVPORTS =
\<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
    style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
    </SPAN>-d $NAMESERVER --dport 53 \<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
    style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
    </SPAN>-m state --state NEW -j ACCEPT<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT=20
    face=3DArial>fi<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT=20
    face=3DArial>&nbsp;<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT=20
    face=3DArial>iptables -A OUTPUT -o $INTERNET -p udp=20
    \<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
    style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    </SPAN>-s $IPADDR --sport $UNPRIVPORTS =
\<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
    style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    </SPAN>-d $NAMESERVER --dport 53 -j =
ACCEPT<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT=20
    face=3DArial>&nbsp;<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT=20
    face=3DArial>iptables -A INPUT<SPAN style=3D"mso-spacerun: =
yes">&nbsp; </SPAN>-i=20
    $INTERNET -p udp \<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
    style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    </SPAN>-s $NAMESERVER --sport 53 \<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT =
face=3DArial><SPAN=20
    style=3D"mso-spacerun: =
yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    </SPAN>-d $IPADDR --dport $UNPRIVPORTS -j=20
ACCEPT<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal=20
    style=3D"MARGIN: 0in 0in 0pt; mso-layout-grid-align: none"><SPAN=20
    style=3D"FONT-SIZE: 10pt; FONT-FAMILY: 'Courier New'"><FONT=20
    face=3DArial>&nbsp;<o:p></o:p></FONT></SPAN></P>
    <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial size=3D2>When=20
    I execute the script with sh /etc/rc.d/rc.firewalls I receive Bad =
argument=20
    `53' for every instance of either<SPAN style=3D"mso-spacerun: =
yes">&nbsp;=20
    --</SPAN>dport 53 or --sport 53.<SPAN style=3D"mso-spacerun: =
yes">&nbsp;=20
    </SPAN>I=92ve also tried --destination-port and --source-port with =
out any=20
    success.</FONT></P>
    <P class=3DMsoNormal style=3D"MARGIN: 0in 0in 0pt"><FONT =
face=3DArial><FONT=20
    size=3D2>&nbsp;<o:p></o:p></FONT></FONT></P>
    <DIV><SPAN=20
    style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; =
mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; =
mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><FONT=20
    face=3DArial size=3D2>Can anyone shed some light on my=20
    problem?</FONT></SPAN></DIV>
    <DIV><SPAN=20
    style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; =
mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; =
mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><FONT=20
    face=3DArial size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN=20
    style=3D"FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; =
mso-fareast-font-family: 'Times New Roman'; mso-ansi-language: EN-US; =
mso-fareast-language: EN-US; mso-bidi-language: AR-SA"><FONT=20
    face=3DArial=20
size=3D2>Dave</FONT></SPAN></DIV></BLOCKQUOTE></BLOCKQUOTE></BODY></HTML>=


------=_NextPart_000_0041_01C26FEA.01DC9960--



