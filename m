From: "Ashley M. Kirchner" <ashley@pcraft.com>
Subject: Re: Re: iptables help
Date: Thu, 29 Jul 2004 10:29:14 -0600 (MDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0407291026030.2121-100000@ivanhoe.pcraft.com>
References: <200407290732.13336.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407290732.13336.Antony@Soft-Solutions.co.uk>
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

On Thu, 29 Jul 2004, Antony Stone wrote:

> 1. What help do you need?   Adding rules to block specific traffic is quite 
> simple:

	Simple, yes, I agree.  However, because there are several sections 
in this iptables file, I'm not sure _where_ I need to be inserting more 
rules for it to work properly.

> iptables -I FORWARD -s a.b.c.d -d w.x.y.z -p tcp --dport 80 -j REJECT
> 
> a.b.c.d is the machine in your network you want the block to apply to
> w.x.y.z is a machine on the Internet you don't want them to access

	However, with places such as Yahoo and Hotmail, where there's a 
whole farm of machines doing the work, blocking per IP will simply result 
in a long list of rules, correct?  Is there a way to use a CIDR address?

> 3. If it is primarily web access you want to restrict, you may well find that 
> Squid http://www.squid-cache.org is a better way of doing it; that can 
> control access to domains by domain name rather than requiring a rule for 
> each web server IP address (as netfilter does), and can also do time-based 
> matching as a standard facility.

	I agree with this point as well, except we're time strapped right 
now and I'm not in a position to go install a new application, configure 
it, test it, make sure it all works, before I can block this particular 
traffic.  Unfortunately it's something that needed to happen last Monday, 
and I just haven't had time to even address the problem.  Right now, I 
just need to block that traffic, before management decides to blow their 
top.

-- 
L | I haven't lost my mind; it's backed up on tape somewhere.
  +--------------------------------------------------------------------
  Ashley M. Kirchner <mailto:ashley@pcraft.com>   .   303.442.6410 x130
  IT Director / SysAdmin / WebSmith             .     800.441.3873 x130
  Photo Craft Laboratories, Inc.            .     3550 Arapahoe Ave. #6
  http://www.pcraft.com ..... .  .    .       Boulder, CO 80303, U.S.A.


