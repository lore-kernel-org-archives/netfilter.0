From: "Adam Pyne" <adam@dialnetwork.com>
Subject: Trouble NAT'ing with a pool of public addresses
Date: Wed, 17 Dec 2003 01:07:25 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1122.63.164.0.198.1071644845.squirrel@squirrel.dialnetwork.com>
Reply-To: adam@dialnetwork.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear list members,

First let me apologize for my ignorance, I've searched as much I could for
an answer on this and bugging you is a last resort.

Recently we moved our NAT service from a Cisco 3640 to a Debian box
running iptables v1.2.6a and kernel version 2.4.18. Our network has 150+
users. Since transitioning, there have been a number of unforseen
obstacles in getting some of our user's applications to work, i.e. AIM and
MSN messenger. I've been able to resolve most of these with the exception
of one last issue.

On our Cisco we used a pool of public IP's for our users to NAT through.
I've found a comparable configuration to do the same with iptables:

iptables -t nat -p all -A POSTROUTING -s 10.0.0.0/8 -o eth0 -j SNAT --to
x.x.x.x - y.y.y.y

With this in place, outbound connections have a source address picked in a
round-robin fashion from the pool which is basically what we want in order
to not overload a single public IP. However, we now have an issue with
some websites that have security measures in place to reject users
connecting via a different IP for each transaction subsequent to logging
in.

For example, if my initial connection to http://secure.foo.com comes from
xxx.xxx.xxx.4, the server will reject my next transaction if it comes from
xxx.xxx.xxx.5.

Somehow the Cisco NAT was able to address this with what I'm guessing was
some kind of translation tracking procedure (either that or perhaps magic
fairy dust) making subsequent connections to a site from a particular user
come from the same IP.

My question is, is there a way to configure iptables to do the same? If
not, in your opinion how many users can we expect to successfully NAT to
one public IP?

Any feedback would be most appreciated. Sorry for my long winded post.

Thanks and Happy Holidays,
Adam Pyne

