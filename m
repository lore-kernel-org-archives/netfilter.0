From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 11:59:46 -0500
Message-ID: <200506201159.46123.rob0@gmx.co.uk>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
	<49bf7d7050620091748a270fc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49bf7d7050620091748a270fc@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: "terry l. ridder" <artisticforge@gmail.com>
Cc: netfilter@lists.netfilter.org

On Monday 20 June 2005 11:17, terry l. ridder wrote:
> while i have reservations concerning posting the output of
> iptables-save i have placed it on my web server:
>
> http://204.238.34.206/iptables-save-20jun2005.txt

Yikes, this is very long. First, I see that you're doing all your 
filtering in nat, PREROUTING and POSTROUTING. Why? I prefer to do 
filtering in the filter table as $DEITY intended. :)

Second, I think you would benefit from reading the HOWTOs (again?). I 
would also strongly suggest enabling and using connection tracking.

I have no idea what you will get with all this filtering in the nat 
table. It is giving me a headache to try to figure it out! In fact I 
hereby give up.

There are many premade iptables scripts which can produce good, safe 
firewalls, but they will only work on kernels with standard netfilter 
options enabled. For me the netfilter section of kernel configuration 
is very simple. I modularise every available option!

My suggestion to you, then, is to remake your kernel (or maybe just 
modules) and get a more standard firewall. Then add your rules as 
desired.

The particular task you are trying to accomplish here appears to be 
related to spam control. Blocking off huge portions of the Internet 
indeed can reduce your spam. But please consider that the USA is far 
and away the world's largest spam source.

I prefer to do spam control in the MTA. I'm fairly effective there; not 
perfect but quite good nonetheless. I do no blocking of large 
netblocks, and minimal prequeue content filtering.

> > Put a logging rule here to prove it:
> > iptables -vA $CHAIN -s 200.0.0.0/7 -j LOG --log-prefix
> > "LACNIC-leak: "

Please try this, with "-p tcp --dport 25" as amended by followup. Put 
this rule in either filter/INPUT or filter/FORWARD as appropriate. It 
won't hurt anything to put it in both if you're not sure. Watch your 
appropriate kernel logs to see what hits.

> > > i also have a short web page concerning the iptables leaks at:
> > > http://204.238.34.206/iptables-leaks.txt
> >
> > Still not clear to me.
>
> what part is not clear? i will attempt to clarify.

I do not think you really understand what your NAT rules are doing. I 
sure don't.

> > I do see that you've disabled CONFIG_IP_NF_CONNTRACK, which is a
> > very odd choice. Connection tracking is the strength of iptables!
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

