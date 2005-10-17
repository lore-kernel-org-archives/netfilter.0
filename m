From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: lots of source ip & same dst port to one line??
Date: Sun, 16 Oct 2005 22:54:48 -0500
Message-ID: <200510162254.48811.rob0@gmx.co.uk>
References: <BAY12-F7B5C06FEC165BFDD024EF857E0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY12-F7B5C06FEC165BFDD024EF857E0@phx.gbl>
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

On Sunday 2005-October-16 20:06, Monty Ree wrote:
> which same dst ip and port but source ip is not like below.
>
> iptables -A INPUT -p tcp -s 1.1.1.1 -d 10.10.10.10 --dport  25 -j
> ACCEPT
snip similar commands
> This rule in not good for performance as I know.

I wouldn't worry about it much. I've never known netfilter performance 
problems, myself. At home I used to use a 80386 as router, now I use a 
little embedded Linksys. Not much power in the thing, but it passes 
packets like a champ.

At commercial sites I use better, but still not impressive, machines.

> So, is there any method which I can put together one line or rule??

Consider user-defined chains, to wit:

iptables -N TenTenTenTen # or hostname, whatever makes sense to you
iptables -A INPUT -d 10.10.10.10 -j TenTenTenTen
iptables -A TenTenTenTen -s 1.1.1.1 -p tcp --dport 25 -j ACCEPT
...

At the end of TenTenTenTen you can have something different than the 
policy, or if you want to hit the policy, do nothing. Anything which 
didn't match goes back to the next rule in the calling chain.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

