From: Daniel David Benson <dan@spoontail.com>
Subject: Connection Rate Limiting
Date: Thu, 15 May 2003 08:58:25 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.44.0305150852190.7322-100000@dudester.spoontail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hopefully this one hasn't been answered before.  We need to rate
limit on a per source IP address to port 80.  We are seeing certain
web servers suffer from resource starvation under a DDOS attack.
The solution to this problem is rate limit the number of
connections any source IP address can make.  Is this possible
to do with iptables?  I have searched just about everything and
I can't seem to find anything.  I know I can do traffic shaping
with iproute2, but I don't think that is the direction I want
to take.

I know there is -limit in iptables, but unless I don't clearly
understand the implementation this limit is matched against
the resource and not on a per source.  So, you have 5 source
IPs comming in with requests all of which effect the counters
global instead of each source having their own counter.

We have tried mod_throttle for apache...but that crashes quite
a bit as the tables grow.  Plus. I want to stop the attacks
before the apache level.

Any help on this would be greatly appreciated.

Thanks!

-Dan



