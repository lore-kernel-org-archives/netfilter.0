From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 13:29:19 -0500
Message-ID: <200506201329.19701.rob0@gmx.co.uk>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201159.46123.rob0@gmx.co.uk>
	<49bf7d70506201020643ab165@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49bf7d70506201020643ab165@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Monday 20 June 2005 12:20, terry l. ridder wrote:
> > Yikes, this is very long. First, I see that you're doing all your
> > filtering in nat, PREROUTING and POSTROUTING. Why?
>
> because that is the way i know that works.

Again I doubt you know exactly what it is doing. For instance in your 
lonely filter table, FORWARD rules there are 3 rules which do nothing 
at all ... ACCEPT targets, when the policy is ACCEPT. (They do packet 
counting which is limited by the "limit" module, so even the packet 
counters are meaningless.)

> it has worked fine for many years.

Luck.

> it was not until i upgraded the 
> firewall machine (new computer with debian sarge) that iptables
> began to leak.
>
> > I prefer to do filtering in the filter table as $DEITY intended. :)

For me that is more or less a matter of faith. I hope someone who knows 
more about it will come along and explain why your NAT use is poor 
design. In the meantime I bet a few external nmap's of your IP would 
give you some unpleasant surprises.

> <major sniip>
>
> one of the reasons for using table nat is to dnat all ip addresses
> with destination port 25 (smtp) to the mail server, 204.238.34.206.

I'd do that with a single DNAT rule,  have a single SNAT rule to let the 
internal mail server out, and do my filtering in filter / FORWARD. It 
also seems odd that you are using NAT at all, since the mail server 
already has a real Internet IP. I only use NAT with RFC 1918 addresses.

> connection tracking is turned off since at one time i was
> using tarpit instead of just dropping the connections.

Whatever. Without connection tracking you might as well use ipchains.

> i have added logging on both the firewall box, 204.238.34.232, and
> the mail server, 204.238.34.206. both boxes will be logging the
> leaks.

Please do followup with the results; I will be interested to see what 
packets are getting through.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

