From: "Darryl Romano" <dromano@vmware.com>
Subject: RE: I need some clarification about multiple ISPs...
Date: Fri, 1 Sep 2006 08:32:08 -0700
Message-ID: <882A4B7A51024043B9E5EA13382DF211FFFEFC@PA-EXCH03.vmware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: "Taylor, Grant" <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@lists.netfilter.org>

This is an exact scenario I had a while back.  I did not find a =
resolution
unfortunately.  I would love to find an answer to this.

From my experiences, the traffic going back out will always try to go =
out the
default route, and since its destination is waiting for the ISP2 ip and =
not
the ISP ip, it will reject the packet breaking the connection.

I love computers.

Darryl Romano, VCP, RHCE
VMware Technical Support
=20
1-877-4-VMWARE
1-877-486-9273
=20
Use our Knowledge Base to search for
Troubleshooting information:
http://www.vmware.com/kb
=20
 VMware Community Access:
http://www.vmware.com/community/index.jspa


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Taylor, =
Grant
Sent: Friday, September 01, 2006 11:06 AM
To: Mail List - Netfilter
Subject: I need some clarification about multiple ISPs...

Hello, a colleague and I are at a minor disagreement that I believe =
NetFilter
Mailing List subscribers will be able to clarify.

The situation is I have a client who has (will once they are activated) =
two
internet connections through two different providers.  Either connection =
will
work just fine by it's self.  I also believe that I can use both =
connections
simultaneously with client initiated traffic just fine.  What I perceive =
as a
problem will be if someone (myself) initiates an inbound connection =
(SSH) to
either of the connections.  If the system is configured to use ISP 1 as =
the
default and the connection is targeted at the IP for the ISP 2 =
interface,
where will the connections traffic go back out from?  I am of the =
opinion
that I will need to mark the traffic that comes in on at least one of =
the
interfaces to make sure that said marked traffic goes back out the =
correct
interface.

More specifically I suspect that  will have two (sub) routing tables in
addition to the main routing table.  Have the system use the main =
routing
table for all client side initiated out bound (and related) traffic.  =
Mark
traffic that comes in the interface for ISP 1 such that the returning
outbound traffic will be directed to use the ISP 1 routing table.  Mark
traffic that comes in the interface for ISP 2 such that the returning
outbound traffic will be directed to use the ISP 2 routing table.

Any thought(s) / opinion(s) / suggestion(s) are welcomed and =
appreciated.



Grant. . . .


