From: "Len L." <len@euler.com>
Subject: Problem with the limit option
Date: Fri, 29 Aug 2003 16:13:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12CC60849165134FB7DF8570B621F4D558B085@mailxserver.euler.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C36E72.54961180"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

This is a multi-part message in MIME format.

------_=_NextPart_001_01C36E72.54961180
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ok, back again,

	I was running limit and not seeing any results (e.g. limit in my =
packets), so I thought. I would go back to the basics and try some tests =
on ICMP limiting pings.
I have tried the following tests on four machines and get the same =
results, - e.g. pinging is not limited.  The following is the code:


iptables -A INPUT -s 0/0 -p icmp -m limit  --limit 1/hour --limit-burst =
2 -j LOG --log-prefix "XXX ICMP LOG XXX "
iptables -A INPUT -s 0/0 -p icmp -m limit  --limit 1/hour --limit-burst =
2 -j DROP
iptables -A INPUT -s 0/0 -p icmp -m limit  --limit 1/hour --limit-burst =
2 -j LOG --log-prefix "XXX ICMP LOG AFTER DROP XXX "=09
iptables -A INPUT -s xxx.xxx.xxx.xxx -p icmp -j ACCEPT
iptables -A INPUT -s 0/0 -p icmp -j LOG --log-prefix "XXX ICMP DROP XXX =
"


Then ping from a remote machine outside of our firewall (The above rules =
are on the firewall).
I would expect 3 pings then nothing for an hour.

I get no limit on the pings, they continue without interruption.
I get the first LOG followed by the second LOG message.

As a sanity check If I comment out the rule which accepts the =
xxx.xxx.xxx.xxx address the pinging from that address stops.

This should be a simple test to add to any rule set.  If anyone has the =
time could you try it out and let me know your results?

I tried on RedHat 7.2, 8.0 and 9.0 systems

Thanks


Len Laulainen
(952) 567-4211
len@euler.com


------_=_NextPart_001_01C36E72.54961180
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6249.1">
<TITLE>Problem with the limit option</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Ok, back again,</FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">I was running limit and not seeing any results (e.g. =
limit in my packets), so I thought. I would go back to the basics and =
try some tests on ICMP limiting pings.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have tried the following tests on =
four machines and get the same results, - e.g. pinging is not =
limited.&nbsp; The following is the code:</FONT></P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -s 0/0 -p icmp -m =
limit&nbsp; --limit 1/hour --limit-burst 2 -j LOG --log-prefix &quot;XXX =
ICMP LOG XXX &quot;</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -s 0/0 -p icmp -m =
limit&nbsp; --limit 1/hour --limit-burst 2 -j DROP</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -s 0/0 -p icmp -m =
limit&nbsp; --limit 1/hour --limit-burst 2 -j LOG --log-prefix &quot;XXX =
ICMP LOG AFTER DROP XXX &quot;&nbsp;&nbsp;&nbsp; </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -s xxx.xxx.xxx.xxx -p =
icmp -j ACCEPT</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">iptables -A INPUT -s 0/0 -p icmp -j =
LOG --log-prefix &quot;XXX ICMP DROP XXX &quot;</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">Then ping from a remote machine outside =
of our firewall (The above rules are on the firewall).</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">I would expect 3 pings then nothing =
for an hour.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I get no limit on the pings, they =
continue without interruption.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">I get the first LOG followed by the =
second LOG message.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">As a sanity check If I comment out the =
rule which accepts the xxx.xxx.xxx.xxx address the pinging from that =
address stops.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">This should be a simple test to add to =
any rule set.&nbsp; If anyone has the time could you try it out and let =
me know your results?</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I tried on RedHat 7.2, 8.0 and 9.0 =
systems</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks</FONT>
</P>
<BR>

<P><B><FONT FACE=3D"Arial">Len Laulainen</FONT></B>

<BR><FONT SIZE=3D2 FACE=3D"Arial">(952) 567-4211</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">len@euler.com</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C36E72.54961180--

