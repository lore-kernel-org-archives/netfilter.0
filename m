From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Aren't these connections ESTABILISHED? (2nd take)
Date: Sat, 1 Oct 2005 19:07:26 -0500
Message-ID: <200510011907.27026.rob0@gmx.co.uk>
References: <dhmn38$hsk$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <dhmn38$hsk$1@sea.gmane.org>
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

On Saturday 2005-October-01 14:12, Gioele Barabucci wrote:
> I spend the last weeks doing experiments with iptables but still I
> have problems with connections that should be ESTABILISHED but are

You have it spelled correctly in the script, but perhaps you should 
check again. ESTABLISHED != ESTABILISHED. I am not sure if iptables 
would complain about that or not, but it's always safest to spell 
things correctly. :)

> not.
>
> Postfix does some DNS lookups on the DNS server (69.93.28.254). After

FWIW: my Postfices do tons of DNS lookups, so much so, that I would 
never run without a caching nameserver on the same machine.

> a bit, iptables forget that the connection is ESTABILISHED and DROPs
> the reply.

When that happens you might want to check the conntrack table. Perhaps 
even script something to run from -j ULOG when a packet is dropped.

Is anything not working? I have a feeling these are just occasional 
strays that ip_conntrack isn't catching for some reason.

> My logs are full of dropped packets like these
> 05:32:33  69.93.28.254 53  myIP 2755  UDP

You *are* getting these from netfilter logs, correct? You have just 
removed all the superfluous information for readability?

> Here is my ruleset (BTW, I did not test much the "limit SMTP trafic",
> do you think that it is correct?)
snip
> echo "Limit smtp traffic"
> iptables -I INPUT -p tcp --dport smtp -i eth0 -m state --state NEW -m
> recent --set
> iptables -I INPUT -p tcp --dport smtp -i eth0 -m state --state NEW -m
> recent --update --seconds 30 --hitcount 4 -j DROP

I have not yet used -m recent. Without RTFM it looks like you are 
wanting to limit to limit any IP to 4 new connections per 30 second 
period. If the problem is dictionary attacks be advised that this might 
not help at all. The attacker could be attempting as many as 
smtpd_recipient_limit (default 1000) usernames in a single session.

Also, I'm not sure it would do anything at all, because there cannot be 
that many --state NEW connections in such a short time. Conntrack would 
call those "RELATED". I think you should try --syn, not --state NEW.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

