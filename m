From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables help
Date: Thu, 29 Jul 2004 07:32:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407290732.13336.Antony@Soft-Solutions.co.uk>
References: <410834D9.10404@pcraft.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <410834D9.10404@pcraft.com>
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

On Thursday 29 July 2004 12:20 am, Ashley M. Kirchner wrote:

>     I need some help adding a few blocking rules (*) to an iptables
> script that I once inherited, and grown over time.  I don't want to post
> the whole thing here because I don't need to be spamming everyone with
> it, but if there's a kind soul willing to help, I'll gladly send it
> (unless no one objects to getting the whole file.)
>
>     (*) the basic gist is that I need to block places like hotmail.com,
> yahoo.com, and other sites from getting accessed from only two machines
> on our private network, during a specific period of time.  If we like
> the way it works, we'll add more machines/IPs to it later.

1. What help do you need?   Adding rules to block specific traffic is quite 
simple:

iptables -I FORWARD -s a.b.c.d -d w.x.y.z -p tcp --dport 80 -j REJECT

(this is assuming that you meant you want to block web access - I've assumed 
this because the domains you mentioned are best known as large websites)

a.b.c.d is the machine in your network you want the block to apply to
w.x.y.z is a machine on the Internet you don't want them to access

2. Applying a time window to rules is also fairly simple once you've applied 
the 'time' match from patch-o-matic:

iptables -I FORWARD -s a.b.c.d -d w.x.y.z -p txp --dport 80 -m time 
--timestart 09:00 --timestop 17:00 -j REJECT

Do block the same packets as for the previous rule, but only between 09:00 and 
17:00 each day.

3. If it is primarily web access you want to restrict, you may well find that 
Squid http://www.squid-cache.org is a better way of doing it; that can 
control access to domains by domain name rather than requiring a rule for 
each web server IP address (as netfilter does), and can also do time-based 
matching as a standard facility.

Hope this helps,

Regards,

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


