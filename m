From: <bmcdowell@coxhealthplans.com>
Subject: RE: netfiltering and ethernet bridging doesn't appear to work as advertised, help!
Date: Wed, 21 Jan 2004 11:27:47 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7A3B4AA360FDEF448F3390421FC8D731014BE7BB@coxhpexg.coxhp.com>
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
To: netfilter@lists.netfilter.org


From my point of view, you can ignore physical/virtual interfaces with
respect to INPUT, OUTPUT, and FORWARD.  It's all about where the IP
address resides, and whether or not that IP is local or remote.  Let me
whip up a quick example.

Say we have a bridging firewall with two ethX interfaces and one brX
interface:

eth0-br0-eth1

Not that you would normally want to, but lets put IP's on all of these
interfaces:

eth0(10.10.10.1)-br0(10.10.10.2)-eth1(10.10.10.3)

Now lets add a few clients:

client1(10.10.10.5) -
[eth0(10.10.10.1)-br0(10.10.10.2)-eth1(10.10.10.3)] -
client2(10.10.10.6)

With me so far?

Now let's apply those to filter chains.  Examples:

	Situation				Chain (from the point of
view of the bridge)

Client1 pings Client2			FORWARD
Client2 pings Client1			FORWARD
Client1 pings 10.10.10.1		INPUT (and OUTPUT for the reply)
Client1 pings 10.10.10.2		INPUT (and OUTPUT for the reply)
Client1 pings 10.10.10.3		INPUT (and OUTPUT for the reply)
Client2 pings 10.10.10.1		Probably INPUT/OUTPUT - not sure
here

It isn't recommended to have IP's on ethX's.  Really, my bridge should
look more like this:

eth0(0.0.0.0)-br0(10.10.10.2)-eth1(0.0.0.0)

In this case, only traffic dealing with 10.10.10.2 would be handled by
the INPUT/OUTPUT chains.  Everything else is FORWARD, because it deals
with two non-local IPs.

Have I confused you yet?


Bob

-----Original Message-----
From: Kirk Reiser [mailto:kirk@braille.uwo.ca]
Sent: Wednesday, January 21, 2004 10:35 AM
To: Bob McDowell
Cc: netfilter@lists.netfilter.org
Subject: Re: netfiltering and ethernet bridging doesn't appear to work
as advertised, help!

<SNIP>
I'm having a bit of trouble with this statement because to me it
doesn't seem to make sense without the notion of the interface cards.
If eth0 is our interface to the net and eth1 our interface to the lan
then input to an interface makes sense because input to eth0 means one
set of rules while input to eth1 means a totally separate set.  When
you are talking about a virtual interface such as br0 how do input and
output relate?  Is input meaning packets entering both real interfaces
eth0 and eth1 or does input mean to the virtual device br0.  If the
latter what direction is input verses output, the order you add the
NICs?  I don't see how this can be.
<SNIP>

