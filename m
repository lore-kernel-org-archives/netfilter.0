From: "Andrew Brink" <abrink@netstandard.net>
Subject: RE: Traffic Reflecting / Redirecting
Date: Thu, 3 Apr 2003 19:31:07 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B45570C481D7904FA8C47E19444BF6CD030B21@nsimail1.netstandard.inc>
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
To: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

I tried this, but for some reason it did not work, I was unable to ssh
in...

-----Original Message-----
From: Daniel Chemko [mailto:dchemko@smgtec.com]=20
Sent: Thursday, April 03, 2003 4:48 PM
To: Andrew Brink; netfilter@lists.netfilter.org
Subject: RE: Traffic Reflecting / Redirecting


If you have a single entry point and a single IP address, this is a
non-issue.=20

iptables -A PREROUTING -j DNAT -p tcp --destination-port 22
--destination 10.1.1.1 --to-destination 192.168.1.1

If you have multiple gateways that a PC can use to get out of a network,
there is no guarantee that the return packet will take the correct path
back through 10.1.1.1. In this case I don't believe there is a way to
accomplish this with total transparency.

You can use an SNAT rule to make 192.168.1.1 see the middle party, but
the originating host would still be unknowing of any NAT occurrences.

Hope this helps.

-----Original Message-----
From: Andrew Brink [mailto:abrink@netstandard.net]=20
Sent: Thursday, April 03, 2003 1:36 PM
To: netfilter@lists.netfilter.org
Subject: Traffic Reflecting / Redirecting

All -=20

I am trying to set up a box that can reflect traffic to another box
transparently.

An Example would be:  Initiate a ssh connection to 10.1.1.1, 10.1.1.1
then sends this packet to 192.168.1.1, then the return path must also go
through 10.1.1.1.

The trick is getting this to work transparently, and over the internet,
not a local network.

Any thoughts or ideas would be helpful.

Thanks.

Andrew Brink, CCNA, WCSP=20
NetStandard, Inc.=20
913-262-3888=20


