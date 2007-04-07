From: "jj" <jj_rocks2003@yahoo.com>
Subject: iptables, multiple hosts, one IP
Date: Fri, 6 Apr 2007 20:43:24 -0400
Message-ID: <06fe01c778ad$c063a6a0$7c01a8c0@peg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi,

I searched all over the internet, but cant find this in any forum, so
hopefully someone can help.  I dont even know if iptables can help, but
hopefully it will.

I have only dedicated IP address, and I have 3 hosts (same for physical or
virtual hosts, I guess) and what I would like is:

to have each host have its own LAMP hosting its own domains, but from the
outside world, everyone should only see www.whatever.tld, without the need
to add port numbers, etc

can this be done with some form of iptables, apache redirects (via a control
panel like ispconfig, or similar)?

I have a test server running with a xen domain, hosting a couple of them,
and need to expand (currently only the dom-u is visible from outside)

it does not matter to me whether I use xen or vm or anything else, so long
as I can have one machine dictate where each request goes, e.g.:

if dedicated IP is 1.2.3.4, and hosts are
apple 192.168.0.5, hosting first.com, second.com, third.net,
pear 192.168.0.6, hosting fourth.com, fifth.net, sixth.org,
... plum 192.168.0.15 hosting tenth.com, eleventh.com, etc

the idea being that from the outside, someone would enter www.fifth.com, and
it would get to the right host. Ideally, of course, it would be nice to have
only one hosting control panel, but I dont mind having one on each host

can it be done, or must I have multiple dedicated IP's?

any help will be gratefully appreciated   : )

jj

