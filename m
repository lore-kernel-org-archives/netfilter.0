From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: NetFilter DMZ question...
Date: Sat, 24 May 2003 11:22:33 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6CC5@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: Richard Whittaker <RWHITTAKER@nwtel.ca>, netfilter@lists.netfilter.org

This is not right, DNAT only changes the Destination (Address =
Translation) of the packet.
The source is left the same unless you have a rule in your POSTROUTING =
on the DMZ nic which changes it's source to the firewall which is =
usually required when the NAT webserver is on the same network as a =
workstation (ie. workstation on DMZ trying to browse webserver on =
external address) which then you must NAT the source.

can you provide all the rules for the NIC and EXTERNAL NIC? change the =
Ext addy if you should.

-----Original Message-----
From: Richard Whittaker [mailto:RWHITTAKER@nwtel.ca]
Sent: Saturday, May 24, 2003 6:29 AM
To: netfilter@lists.netfilter.org
Subject: NetFilter DMZ question...


Greetings:

We have a webserver living in a DMZ, and I have the following rule
setup to allow this:

/usr/sbin/iptables -A PREROUTING -t nat -i eth1 -p tcp -d 199.85.228.1
--dport 80 -j DNAT --to 192.168.70.3:80

Unfortunately, the web server only sees the IP address of the
interface, not the source IP address, which kinda messes with our
statistical programs, since the only address the web server "sees" is
the same one over, and over... Is there any way to present the web
server with the "real" address, or should it be be already?....

Thanks,
Richard...


Richard Whittaker, CISSP
System Manager
NorthwesTel Inc.
Whitehorse, YK
(867) 393-7756



