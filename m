From: "Gabor Szokoli" <szocske@gmail.com>
Subject: Managed proxy between private network
Date: Thu, 19 Oct 2006 12:03:41 +0200
Message-ID: <de47c0230610190303v37e0b55aia98d80d1bfac9db@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi There,

I am new and have some questions:

We have a linux box (complete control) connected to multiple private
networks with possibly overlapping IP addressing. Its role is to
dynamically create and tear down individual port forwardings between
them.
Our basic idea was to create conntrack entries from the controlling application.
Having imagined conntrack to be like Cisco Express Forwarding, I was
supprised to find out the conntrack lists do not contain the incoming
and outgoing interfaces, only IP addresses which are then routed via
the normal path. Sadly, IP address based routing makes no sense
between the independent private networks which are reusing the same
IPaddresses.

We see two paths, both quite rickety:

-Modify the conntrack module to contain the incoming and outgoing interfaces.
(practically merging the route cache functionality into contrack, may
even have performance benefits)

-Use connmark to paint flows intended for each interface, act on it
with policy routing. Determining the incoming interface might be mad
unnecessary by assigning the incoming forwarded ports uniquely across
interfaces, but we would prefer to avoid this.

I promissed a question so here it is :-)
How would you guys do this?
Must be able to handle thousnads of flows busy with tiny packets
(upside: no fragmentation), so we have a supertitious affinity to
conntrack.
Any of the patches we should look at?

Sidenote:
We tried to make linux forward more packets by throwing more CPUs at
it, but have learned a huge conservative lock prevents paralellism in
network processing. Does anyone here know about any plans on improving
linux networking oerformance on SMP?

