From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: NAT machines cant do 'dir' after connecting to FTP
Date: Mon, 3 Jun 2002 17:58:12 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615D88@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C20B17.76ABE2F4"
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Neil Aggarwal <neil@JAMMConsulting.com>, netfilter <netfilter@lists.samba.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C20B17.76ABE2F4
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

you need to do modprobe ip_nat_ftp


-----Original Message-----
From:	Neil Aggarwal [mailto:neil@JAMMConsulting.com]
Sent:	Mon 3/06/2002 17:30
To:	netfilter
Cc:=09
Subject:	NAT machines cant do 'dir' after connecting to FTP
Hello:

I have this setup:
	Internet --- Linux Server --- Switch --- Internal Machines

The Linux server has a set of public IP addresses, lets
say 11.22.33.44 thru 11.22.33.99.  These are mapped
using NAT to the internal machines running static IP
addresses of 192.168.1.44 thru 192.168.1.99.

I can ftp from an internal machine and connect to an
external server.  I can give it a user name and password
and login successfully, but when I try to type dir or
ls, the ftp client sits for a long time
and then I get a message:
 425 Not able to open data connection.

Here are the commands that I used:
	# Load the conntrack ftp module
      /sbin/modprobe ip_conntrack_ftp

      # Flush any existing rules
      /sbin/iptables -F
      /sbin/iptables -t nat -F

	# Set the default policies to ACCEPT all packets
      /sbin/iptables -P INPUT ACCEPT
      /sbin/iptables -P OUTPUT ACCEPT
      /sbin/iptables -P FORWARD ACCEPT
      /sbin/iptables -t nat -P PREROUTING ACCEPT
      /sbin/iptables -t nat -P POSTROUTING ACCEPT

      # Turn on forwarding
      echo "1" > /proc/sys/net/ipv4/ip_forward

	# Set-up routing to allow NAT of the internal machines (I did these
	# three commands foe each of the internal machines)
      /sbin/ifconfig eth0:n 11.22.33.n netmask $NETMASK broadcast $BCAST
      /sbin/iptables -t nat -A PREROUTING -d 11.22.33.n -j DNAT --to
192.168.1.n
      /sbin/iptables -t nat -A POSTROUTING -s 192.168.1.n -j SNAT --to
11.22.33.n

Any ideas??

Thanks,
	Neil.

--
Neil Aggarwal
JAMM Consulting, Inc.    (972) 612-6056, http://www.JAMMConsulting.com
Custom Internet Development    Websites, Ecommerce, Java, databases






------_=_NextPart_001_01C20B17.76ABE2F4
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.5762.3">
<TITLE>RE: NAT machines cant do 'dir' after connecting to FTP</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>you need to do modprobe ip_nat_ftp<BR>
<BR>
<BR>
-----Original Message-----<BR>
From:&nbsp;&nbsp; Neil Aggarwal [<A =
HREF=3D"mailto:neil@JAMMConsulting.com">mailto:neil@JAMMConsulting.com</A=
>]<BR>
Sent:&nbsp;&nbsp; Mon 3/06/2002 17:30<BR>
To:&nbsp;&nbsp;&nbsp;&nbsp; netfilter<BR>
Cc:&nbsp;&nbsp;&nbsp;&nbsp;<BR>
Subject:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NAT machines cant do =
'dir' after connecting to FTP<BR>
Hello:<BR>
<BR>
I have this setup:<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Internet --- Linux Server --- =
Switch --- Internal Machines<BR>
<BR>
The Linux server has a set of public IP addresses, lets<BR>
say 11.22.33.44 thru 11.22.33.99.&nbsp; These are mapped<BR>
using NAT to the internal machines running static IP<BR>
addresses of 192.168.1.44 thru 192.168.1.99.<BR>
<BR>
I can ftp from an internal machine and connect to an<BR>
external server.&nbsp; I can give it a user name and password<BR>
and login successfully, but when I try to type dir or<BR>
ls, the ftp client sits for a long time<BR>
and then I get a message:<BR>
&nbsp;425 Not able to open data connection.<BR>
<BR>
Here are the commands that I used:<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Load the conntrack ftp =
module<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/modprobe ip_conntrack_ftp<BR>
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Flush any existing rules<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/iptables -F<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/iptables -t nat -F<BR>
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Set the default policies to =
ACCEPT all packets<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/iptables -P INPUT ACCEPT<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/iptables -P OUTPUT ACCEPT<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/iptables -P FORWARD ACCEPT<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/iptables -t nat -P PREROUTING =
ACCEPT<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/iptables -t nat -P POSTROUTING =
ACCEPT<BR>
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Turn on forwarding<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;1&quot; &gt; =
/proc/sys/net/ipv4/ip_forward<BR>
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Set-up routing to allow NAT =
of the internal machines (I did these<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # three commands foe each of =
the internal machines)<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/ifconfig eth0:n 11.22.33.n netmask =
$NETMASK broadcast $BCAST<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/iptables -t nat -A PREROUTING -d =
11.22.33.n -j DNAT --to<BR>
192.168.1.n<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sbin/iptables -t nat -A POSTROUTING -s =
192.168.1.n -j SNAT --to<BR>
11.22.33.n<BR>
<BR>
Any ideas??<BR>
<BR>
Thanks,<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Neil.<BR>
<BR>
--<BR>
Neil Aggarwal<BR>
JAMM Consulting, Inc.&nbsp;&nbsp;&nbsp; (972) 612-6056, <A =
HREF=3D"http://www.JAMMConsulting.com">http://www.JAMMConsulting.com</A><=
BR>
Custom Internet Development&nbsp;&nbsp;&nbsp; Websites, Ecommerce, Java, =
databases<BR>
<BR>
<BR>
<BR>
<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C20B17.76ABE2F4--

