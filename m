From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Port FWD via 2 NAT
Date: Thu, 22 May 2003 09:56:06 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6C8A@wardrive.citadelcomputer.com.au>
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
To: Adi <adi@nettek.pl>, netfilter@lists.netfilter.org

Also, you might best use IPSEC and create a tunnel instead of telnetting =
over the internet which people can not only catch passwords but also =
know your IP address behind the NAT. I have IPSEC running and can help =
you set this up but off the list as it's non related..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

=20

-----Original Message-----
From: Adi [mailto:adi@nettek.pl]
Sent: Thursday, May 22, 2003 7:09 AM
To: netfilter@lists.netfilter.org
Subject: Port FWD via 2 NAT


Hello,

For ascii art fans:

INTERNET----[eth0 LINUX1 eth1]----[eth0 LINUX2 eth1]----[Windows]

Linux1 eth0 - public address, NAT, eth1 - 10.0.2.1
Linux2 eth0 - 10.0.2.2, NAT, eth1 - 10.0.5.1
Windows - 10.0.5.13

What I can do on Linux1 and Linux2 to allow connect
from INTERNET to telnet on Windows machine?

I put on Linux1 something like this:
iptables -A PREROUTING -t nat -p tcp -d (public address) --dport 23 -j =
DNAT
--to 10.0.2.2:23
On Linux2:
iptables -A PREROUTING -t nat -p tcp -d 10.0.2.2 --dport 23 -j DNAT --to
10.0.5.13

But it still not working :( What I doing wrong?
Adi



