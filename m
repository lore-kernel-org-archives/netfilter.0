From: Victor Julien <victor@nk.nl>
Subject: Re: help with setting up iptables for use with snort_inline (QUEUE target)
Date: Thu, 1 Jul 2004 17:45:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407011745.19571.victor@nk.nl>
References: <200407011656.01529.victor@nk.nl> <200407011609.58553.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407011609.58553.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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

On Thursday 01 July 2004 17:09, Antony Stone wrote:

<snip>
> You might find the new "helper" match does what you need?   I'm not certain
> because I haven't played with it, but it seems like a likely bet...

You seem to be right!

I added this rule:
iptables -t mangle -A OUTPUT -m helper --helper "ftp" -j MARK --set-mark 0x1

and ftp now seems to work!

> By the way, why are you doing all this in the OUTPUT chain?

Just for testing. I'm particularly interested in using snort_inline to protect 
Internet Explorer. So i'm trying to QUEUE http, ftp etc, to snort_inline and 
try to visit sites with example exploits and see if snort_inline catches 
it... (i'm not running ie on my linux machine of course ;-)

> I'm not quite sure that I see the purpose of running snort-inline on a
> single machine.   A router for a network, yes, but why on a standalone
> system?

I agree, allthough it does work. The recent troubles with IE show that it cant 
hurt protecting a client against a webserver. And my system is a lot faster 
(2.2 ghz) than my firewall (200 mhz), so it makes _some_ sense!

Too bad the helper module is not in the stock Debian Stable kernel. It is in 
the 2.4.26 kernel at www.backports.org however, so i'm happy.

Thanx Antony!

Regards,
Victor

>
> Regards,
>
> Antony.

