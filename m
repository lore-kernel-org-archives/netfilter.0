From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Filter ARP and Broadcasts
Date: Sun, 1 Jun 2003 11:54:53 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D71@wardrive.citadelcomputer.com.au>
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
To: bguerra@dtr-software.com, netfilter@lists.netfilter.org

ARP and broadcasts don't route so how it gets through your firewall is =
beyond me. Unless your machine is a bridge or something it shouldn't =
pass to other network cards.

-----Original Message-----
From: Bobby Guerra [mailto:bguerra@dtr-software.com]
Sent: Saturday, May 31, 2003 1:31 AM
To: netfilter@lists.netfilter.org
Subject: Filter ARP and Broadcasts


I have noticed my production subnets broadcasts and ARP request are
leaking into my DMZ.  My goal is to keep the DMZ clean of all but
necessary communication.  Is their a way to filter ARP and broadcasts?=20
If so could you please give syntax.  Thanks for any help you may give.

Bobby Guerra  =20




