From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Trouble NAT'ing with a pool of public addresses
Date: Wed, 17 Dec 2003 18:30:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312171830.14363.Antony@Soft-Solutions.co.uk>
References: <1122.63.164.0.198.1071644845.squirrel@squirrel.dialnetwork.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1122.63.164.0.198.1071644845.squirrel@squirrel.dialnetwork.com>
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

On Wednesday 17 December 2003 7:07 am, Adam Pyne wrote:

> On our Cisco we used a pool of public IP's for our users to NAT through.
> I've found a comparable configuration to do the same with iptables:
>
> iptables -t nat -p all -A POSTROUTING -s 10.0.0.0/8 -o eth0 -j SNAT --to
> x.x.x.x - y.y.y.y
>
> With this in place, outbound connections have a source address picked in a
> round-robin fashion from the pool which is basically what we want in order
> to not overload a single public IP.

Sounds like you're worried about wearing out IP addresses :)

For 150+ users I really wouldn't worry about hanging them all off a single 
public IP.

> However, we now have an issue with
> some websites that have security measures in place to reject users
> connecting via a different IP for each transaction subsequent to logging
> in.
>
> For example, if my initial connection to http://secure.foo.com comes from
> xxx.xxx.xxx.4, the server will reject my next transaction if it comes from
> xxx.xxx.xxx.5.
>
> Somehow the Cisco NAT was able to address this with what I'm guessing was
> some kind of translation tracking procedure (either that or perhaps magic
> fairy dust) making subsequent connections to a site from a particular user
> come from the same IP.
>
> My question is, is there a way to configure iptables to do the same? If
> not, in your opinion how many users can we expect to successfully NAT to
> one public IP?

I would say "well over 150".

The reasoning is as follows:

Each outbound connection uses a different source port on the firewall in order 
to connect to a remote machine.

There are 65535 source ports available, so either:

a) guess how many concurrent connections an average user will have, divide 
into 65535, and that's the number of users you can have, or

b) think up a number of users, divide into 65535, and that's the number of 
simultaneous connections each of them can have.

Therefore, for your estimate of 150 users, 65535 / 150 = 436 simultaneous 
concurrent connections per user.   Seems like enough to me :)

By the way, if you do envisage running out of source ports like this, remember 
to increase the size of the connection tracking table first, otherwise this 
will be the limiting factor well before you run out of ports.

Hope this helps,

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


