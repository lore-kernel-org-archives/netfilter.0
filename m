From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: Strange problem with iptables and ip ranges with leading 0's 
	(works sometimes, but not other times)
Date: Tue, 30 Sep 2003 21:56:17 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064973377.9055.580.camel@alpha.newkirk.us>
References: <51395.202.95.92.167.1064971605.squirrel@webmail.heimic.net>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <51395.202.95.92.167.1064971605.squirrel@webmail.heimic.net>
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
To: michael@heimic.net
Cc: netfilter@lists.netfilter.org

On Tue, 2003-09-30 at 21:26, michael@heimic.net wrote:

> Basically if we enter in a rule like so; (notice leading 0's 007.0xx.0/24)

> ACCEPT springer:~# iptables -A mule -p tcp --dport 4661 -s
> 202.007.077.0/24 -j ACCEPT
> 
> Above works perfect no errors. Now see below.. Continuing on with further
> ranges.
> 
> springer:~# iptables -A mule -p tcp --dport 4661 -s 202.007.078.0/24 -j
> ACCEPT
> iptables v1.2.8: host/network `202.007.078.0' not found

The leading 0's are interpreted as indicating an octal number, rather
than decimal.  (This means your 202.007.077.0 that was accepted, if you
list the rule back, will show 202.7.63.0/24 being ACCEPTed)  I don't see
it documented anywhere as behaving this way, but that's clearly what is
happening.  077=63, 0100=64, 078=Undefined, like trying to interpret
0x1A (the 'x' indicates hexadecimal) in decimal - the 'A' has no
meaning, just like any digit 8 or higher has no meaning in octal.

This is an artifact, I presume, of the function parsing the IP - it
presumes an IP, and tries to decode one based on standard notations used
to represent numbers in programming.  If this fails then it tries to
interpret it as a URL instead of an IP, which also fails.

For your current situation, I presume you have a program generating
these rules - try to drop the leading 0's.  (if you're using %3d for
instance)  Or, try your sprintf or whatever with octal (%0) or hex (%x)
notation for the octets - they both work... ;^)  (unfortunately they
don't work for netmask octets - which would make netmasks easier)

j



