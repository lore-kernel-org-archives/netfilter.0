From: "Alejandro D. Burne" <adburne@amr.org.ar>
Subject: NAT & MySQL
Date: Thu, 27 Nov 2003 09:22:18 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC5EC7A.000001.00196@adburne>
References: <3FC4EDAA.6080009@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Type: Multipart/related;
  type="multipart/alternative";
  boundary="------------Boundary-00=_6PF0QL80000000000000"
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


--------------Boundary-00=_6PF0QL80000000000000
Content-Type: Multipart/Alternative;
  boundary="------------Boundary-00=_6PF0LVC0000000000000"


--------------Boundary-00=_6PF0LVC0000000000000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This is the schema:=0D
=0D
[internet]<-->[ppp0 (dynamic address) - Gateway - 192.168.1.122]<-->[192.=
168
1.252 - MySQL Server]=0D
=0D
and this is the script:=0D
=0D
#Setting the EXTERNAL and INTERNAL interfaces for the network=0D
EXTIF=3D"ppp0"=0D
INTIF=3D"eth0"=0D
=0D
# Determine the external IP automatically:=0D
EXTIP=3D"`$IFCONFIG $EXTIF | $AWK \=0D
 /$EXTIF/'{next}//{split($0,a,":");split(a[2],a," ");print a[1];exit}'`"=0D
=0D
# Assign the internal TCP/IP network and IP address=0D
INTNET=3D"192.168.1.0/24"=0D
INTIP=3D"192.168.1.122/32"=0D
=0D
# Setting a few other local variables=0D
UNIVERSE=3D"0.0.0.0/0"=0D
=0D
echo "  - Verifying that all kernel modules are ok"=0D
[... to be more small I supress many lines here...]=0D
=0D
echo "  Enabling forwarding.."=0D
echo "1" > /proc/sys/net/ipv4/ip_forward=0D
echo "  Enabling DynamicAddr.."=0D
echo "1" > /proc/sys/net/ipv4/ip_dynaddr=0D
=0D
echo "  Clearing any existing rules.."=0D
$IPTABLES -P INPUT ACCEPT=0D
$IPTABLES -F INPUT =0D
$IPTABLES -P OUTPUT ACCEPT=0D
$IPTABLES -F OUTPUT =0D
$IPTABLES -P FORWARD DROP=0D
$IPTABLES -F FORWARD =0D
$IPTABLES -F -t nat=0D
# Flush the user chain.. if it exists=0D
if [ -n "`$IPTABLES -L | $GREP drop-and-log-it`" ]; then=0D
   $IPTABLES -F drop-and-log-it=0D
fi=0D
# Delete all User-specified chains=0D
$IPTABLES -X=0D
# Reset all IPTABLES counters=0D
$IPTABLES -Z=0D
=0D
echo "  Creating a DROP chain.."=0D
$IPTABLES -N drop-and-log-it=0D
$IPTABLES -A drop-and-log-it -j LOG --log-level info =0D
$IPTABLES -A drop-and-log-it -j REJECT=0D
=0D
echo -e "   - Loading FORWARD rulesets"=0D
$IPTABLES -A FORWARD -i $EXTIF -p tcp --dport 3306 -o $INTIF -j ACCEPT=0D
$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED
RELATED \=0D
 -j ACCEPT=0D
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT=0D
# Catch all rule, all other forwarding is denied and logged. =0D
$IPTABLES -A FORWARD -j drop-and-log-it=0D
=0D
=0D
echo "     - NAT: Enabling SNAT functionality on $EXTIF"=0D
$IPTABLES -t nat -A PREROUTING -p tcp -i $EXTIF --dport 3306 -j DNAT --to
192.168.1.252:3306=0D
$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j SNAT --to $EXTIP=0D
=0D
Alejandro
--------------Boundary-00=_6PF0LVC0000000000000
Content-Type: Text/HTML;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Diso-8859-=
1">
<META content=3D"IncrediMail 1.0" name=3DGENERATOR>
<!--IncrdiXMLRemarkStart>
<IncrdiX-Info>
<X-FID>FLAVOR00-NONE-0000-0000-000000000000</X-FID>
<X-FVER></X-FVER>
<X-CNT>;</X-CNT>
</IncrdiX-Info>
<IncrdiXMLRemarkEnd-->
</HEAD>
<BODY style=3D"BACKGROUND-POSITION: 0px 0px; FONT-SIZE: 12pt; MARGIN: 5px=
 10px 10px; FONT-FAMILY: Arial" bgColor=3D#ffffff background=3D"" scroll=3D=
yes ORGYPOS=3D"0" X-FVER=3D"3.0">
<TABLE id=3DINCREDIMAINTABLE cellSpacing=3D0 cellPadding=3D2 width=3D"100=
%" border=3D0>
<TBODY>
<TR>
<TD id=3DINCREDITEXTREGION style=3D"FONT-SIZE: 12pt; CURSOR: auto; FONT-F=
AMILY: Arial" width=3D"100%">
<DIV>This is the schema:</DIV>
<DIV>&nbsp;</DIV>
<DIV>
<DIV>[internet]&lt;--&gt;[ppp0 (dynamic address)&nbsp;- Gateway - 192.168=
=2E1.122]&lt;--&gt;[192.168.1.252 - MySQL Server]</DIV></DIV>
<DIV>&nbsp;</DIV>
<DIV>and this is the script:</DIV>
<DIV>&nbsp;</DIV>
<DIV>#Setting the EXTERNAL and INTERNAL interfaces for the network<BR>EXT=
IF=3D"ppp0"<BR>INTIF=3D"eth0"</DIV>
<DIV>&nbsp;</DIV>
<DIV># Determine the external IP automatically:<BR>EXTIP=3D"`$IFCONFIG $E=
XTIF | $AWK \<BR>&nbsp;/$EXTIF/'{next}//{split($0,a,":");split(a[2],a," "=
);print a[1];exit}'`"</DIV>
<DIV>&nbsp;</DIV>
<DIV># Assign the internal TCP/IP network and IP address<BR>INTNET=3D"192=
=2E168.1.0/24"<BR>INTIP=3D"192.168.1.122/32"</DIV>
<DIV>&nbsp;</DIV>
<DIV># Setting a few other local variables<BR>UNIVERSE=3D"0.0.0.0/0"</DIV=
>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp; - Verifying that all kernel modules are ok"<BR>[... to =
be more small I supress many lines here...]</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp; Enabling forwarding.."<BR>echo "1" &gt; /proc/sys/net/i=
pv4/ip_forward<BR>echo "&nbsp; Enabling DynamicAddr.."<BR>echo "1" &gt; /=
proc/sys/net/ipv4/ip_dynaddr</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp; Clearing any existing rules.."<BR>$IPTABLES -P INPUT AC=
CEPT<BR>$IPTABLES -F INPUT <BR>$IPTABLES -P OUTPUT ACCEPT<BR>$IPTABLES -F=
 OUTPUT <BR>$IPTABLES -P FORWARD DROP<BR>$IPTABLES -F FORWARD <BR>$IPTABL=
ES -F -t nat<BR># Flush the user chain.. if it exists<BR>if [ -n "`$IPTAB=
LES -L | $GREP drop-and-log-it`" ]; then<BR>&nbsp;&nbsp; $IPTABLES -F dro=
p-and-log-it<BR>fi<BR># Delete all User-specified chains<BR>$IPTABLES -X<=
BR># Reset all IPTABLES counters<BR>$IPTABLES -Z</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo "&nbsp; Creating a DROP chain.."<BR>$IPTABLES -N drop-and-log-i=
t<BR>$IPTABLES -A drop-and-log-it -j LOG --log-level info <BR>$IPTABLES -=
A drop-and-log-it -j REJECT</DIV>
<DIV>&nbsp;</DIV>
<DIV>echo -e "&nbsp;&nbsp; - Loading FORWARD rulesets"<BR>$IPTABLES -A FO=
RWARD -i $EXTIF -p tcp --dport 3306 -o $INTIF -j ACCEPT<BR>$IPTABLES -A F=
ORWARD -i $EXTIF -o $INTIF -m state --state ESTABLISHED,RELATED \<BR>&nbs=
p;-j ACCEPT<BR>$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT<BR># Ca=
tch all rule, all other forwarding is denied and logged. <BR>$IPTABLES -A=
 FORWARD -j drop-and-log-it</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>echo "&nbsp;&nbsp;&nbsp;&nbsp; - NAT: Enabling SNAT functionalit=
y on $EXTIF"<BR>$IPTABLES -t nat -A PREROUTING -p tcp -i $EXTIF --dport 3=
306 -j DNAT --to 192.168.1.252:3306<BR>$IPTABLES -t nat -A POSTROUTING -o=
 $EXTIF -j SNAT --to $EXTIP<BR></DIV>
<DIV>Alejandro</DIV></TD></TR>
<TR>
<TD id=3DINCREDIFOOTER width=3D"100%">
<TABLE cellSpacing=3D0 cellPadding=3D0 width=3D"100%">
<TBODY>
<TR>
<TD width=3D"100%"></TD>
<TD id=3DINCREDISOUND vAlign=3Dbottom align=3Dmiddle></TD>
<TD id=3DINCREDIANIM vAlign=3Dbottom align=3Dmiddle></TD></TR></TBODY></T=
ABLE></TD></TR></TBODY></TABLE><SPAN id=3DIncrediStamp><SPAN dir=3Dltr><F=
ONT face=3D"Arial, Helvetica, sans-serif" size=3D2>______________________=
___________________________________________<BR><FONT face=3D"Comic Sans M=
S" size=3D2><A href=3D"http://www.incredimail.com/redir.asp?ad_id=3D310&a=
mp;lang=3D10"><IMG alt=3D"" hspace=3D0 src=3D"cid:68A9AED4-20D0-11D8-B818=
-00805F579555" align=3Dbaseline border=3D0></A>&nbsp; <I>IncrediMail</I> =
- <B>El E-mail ha evolucionado finalmente</B> - </FONT><A href=3D"http://=
www.incredimail.com/redir.asp?ad_id=3D310&amp;lang=3D10"><FONT face=3D"Ti=
mes New Roman" size=3D3><B><U>Haga clic aqu=ED</U></B></FONT></A></SPAN><=
/SPAN></FONT></BODY></HTML>
--------------Boundary-00=_6PF0LVC0000000000000--

--------------Boundary-00=_6PF0QL80000000000000
Content-Type: image/gif;
  name="IMSTP.gif"
Content-Transfer-Encoding: base64
Content-ID: <68A9AED4-20D0-11D8-B818-00805F579555>

R0lGODlhFAAPALMIAP9gAM9gAM8vAM9gL/+QL5AvAGAvAP9gL////wAAAAAAAAAAAAAAAAAAAAAA
AAAAACH/C05FVFNDQVBFMi4wAwEAAAAh+QQJFAAIACwAAAAAFAAPAAAEVRDJSaudJuudrxlEKI6B
URlCUYyjKpgYAKSgOBSCDEuGDKgrAtC3Q/R+hkPJEDgYCjpKr5A8WK9OaPFZwHoPqm3366VKyeRt
E30tVVRscMHDqV/u+AgAIfkEBWQACAAsAAAAABQADwAABBIQyUmrvTjrzbv/YCiOZGmeaAQAIfkE
CRQACAAsAgABABAADQAABEoQIUOrpXIOwrsPxiQUheeRAgUA49YNhbCqK1kS9grQhXGAhsDBUJgZ
AL2Dcqkk7ogFpvRAokSn0p4PO6UIuUsQggSmFjKXdAgRAQAh+QQFCgAIACwAAAAAFAAPAAAEEhDJ
Sau9OOvNu/9gKI5kaZ5oBAAh+QQJFAAIACwCAAEAEAANAAAEShAhQ6ulcg7Cuw/GJBSF55ECBQDj
1g2FsKorWRL2CtCFcYCGwMFQmBkAvYNyqSTuiAWm9ECiRKfSng87pQi5SxCCBKYWMpd0CBEBACH5
BAVkAAgALAAAAAAUAA8AAAQSEMlJq7046827/2AojmRpnmgEADs=

--------------Boundary-00=_6PF0QL80000000000000--


