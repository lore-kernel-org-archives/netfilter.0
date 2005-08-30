From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: FQDN filtering
Date: Tue, 30 Aug 2005 12:23:48 -0500
Message-ID: <200508301223.48999.rob0@gmx.co.uk>
References: <20050830125809.68053.qmail@web52505.mail.yahoo.com>
	<43145D94.40707@solutti.com.br> <431479A9.40105@nobarrier.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <431479A9.40105@nobarrier.co.za>
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

Please do not top-post. Thank you.

On Tuesday 2005-August-30 10:22, InfoMail wrote:
> this is the rule and below is the error .. is this ment to work
> 
> $IPTAB -A OUTPUT -p tcp -o eth0 -s 0/0 -d www.microsoft.com -j DROP
> ##$IPTAB -A FORWARD -s 0/0 -d www.microsoft.com -m state --state NEW
> -j DROP

To do this most effectively, consider using HTTP proxy servers, like 
Squid ( http://www.squid-cache.org/ ).

Again you're not explicit about your goal. Allow me to give an example: 
"I want to block all HTTP access to servers at www.microsoft.com., for 
hosts in my NAT'ed network." Squid is the best means of that; my DNS 
hijacking idea in the other post might also work, although it would 
also affect anything else resolving from www.microsoft.com, not just 
HTTP.

Or: "I want to block all access, all protocols, to all Microsoft 
servers, from my host and from NAT'ed hosts."

Say what it is you want to do!

I sense also a likely misunderstanding of the roles of the built-in 
chains. OUTPUT only affects traffic which originated on the machine 
itself. If you're wanting to block NAT'ed traffic, you need to do this 
in FORWARD. Please see "man iptables".

> starting rules for NATing
> iptables v1.2.11: host/network `www.microsoft.com' not found
> Try `iptables -h' or 'iptables --help' for more information.

The problem here is that at the time your script tries to run that 
iptables command, your rules do not yet allow DNS access to your 
nameserver[s].
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

