From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Poll on large sites that deploy Iptables.
Date: Wed, 2 Jun 2004 13:54:15 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E32C@alderaan.smgtec.com>
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
To: Brett Simpson <Simpsonb@hillsboroughcounty.org>, netfilter@lists.netfilter.org

Brett Simpson wrote:
> We are a large organization, 3000 plus users, considering switching
> from Checkpoint FW1 to Iptables. I was wondering how many large
> organizations (1000 plus users) are using Iptables in a production
> environment?  =20

I can't speak for concurrent connections, but I know that stability is
pretty good for moderate loads. My network has 100 users with about 10
TB of traffic in the course of 2 months. Linux reboots are rare, but
when you do, you'll want to make sure to update any critical kernel
issues. With so much traffic, any bug could impact your setup
substantially. I can't speak for Checkpoint's qualities, so I'm not the
best reference.

I imagine the best plan would be to take up a test group and object them
to the Linux based gateways and see how THEY like it. I don't think
there should be a show-stopper unless you have a situation that isn't
iptables compatible, like some L5-7 issues, and maybe a few remote-auth
type things.

Net stats:
You can expect to reboot the server quarterly for updates (tested
beforehand on test env.)
I've never had Linux crash, so I assume the mean time error is > 1 year
if you aren't running anything too experimental.
25% CPU utilization on a P4 2.66 (not dual-threaded) when filtering
~120Mb/s of traffic
Concurrent connections exceeding 3000 have never peaked the system
beyond 200MB in the 512MB system (other non-firewall programs as well)

Things to watch out for:
Control your logging because it will get ugly
Plan for proper capacity. 3000 ppl feeding into a T-1 isn't such a big
deal, but if you're edge firewall's hosting a fat pipe, expect to spend
time tuning all of Linux/Netfilter's settings to utilize the best
efficiency. Linux perfect out-of-the-box.
The good thing is that Linux has tons of tools to help you find out
what's going on in the network.
Management time/costs will probably go up due to more baby-sitting the
system. It all depends on how dynamic you network is. The more unique
things you do, the longer it'll take to implement on Linux.

Conclusions
I know it isn't what you wanted, but I hope it gives you some idea on
what to expect.

