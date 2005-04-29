From: "Rikunj" <Rikunj@raha.com>
Subject: Re: How to stop the flood?
Date: Fri, 29 Apr 2005 16:17:31 +0300
Message-ID: <006b01c54cbd$cc580e60$3b3429c4@rp>
References: <20050428154656.AA0188EDCEB@smtp.sterenborg.info>	<1114703659.6fb8089c0e877@webmail.harrisonburg.k12.va.us><035101c54c15$2edb10e0$3b3429c4@rp>
	<4271A606.9090504@riverviewtech.net>
Reply-To: Rikunj <Rikunj@raha.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Thankyou all for such a wonderful response.

All the suggestions are noted and I will post you the final results with my
implementation.

Regards,
Rikunj Patel


----- Original Message -----
From: "Taylor, Grant" <gtaylor@riverviewtech.net>
To: <netfilter@lists.netfilter.org>
Sent: Friday, April 29, 2005 6:12 AM
Subject: Re: How to stop the flood?


> Rikunj wrote:
> > I really don't want them to do this and they are blocked as soon as
> > discovered.
>
> As they should be.
>
> > All the clients are from DHCP IP's of 4 subnets of /24. Blocking them
one by
> > one will eat up IP's.
>
> You could have a range of IPs in your DHCP scope that are for systems that
are not known to the DHCP server, i.e. a smaller scope like what you have
now.  Then set aside part of your existing scope to systems with known MAC
addresses.  This way you can ensure that the computers have a known IP for a
given MAC.  This will also solve the problem where the source IP changes,
assuming that the same system is the problem.
>
> > Moreover they change the attacking src and dst ports making it hard to
> > pinpoint them.
>
> Do they change the source and / destination ports or IP addresses?  Either
way, you should be able to get the DHCP server to log what MAC has what IP
address.  As this would be an on going log you could look back and see who
had what IP at what time to find the MAC.  With the known MAC of the
attacker at any give time you could then look in your log to see what IP is
associated with that MAC at present.  Thus you know what IP an attacker has
presently, if it has changed from the prior IP.  You could even temporarily
block this IP from being able to do any thing on the internet and thus
provoking a call from them thus making them stand out in the crowd.
>
> > My real problem is to identify the curlprits.
> > How can I diferenciate a genuine traffic and a infected attack? What
should
> > I look for?
>
> Genuine traffic will follow patterns and access standard services.  This
will depend on what your client's orginizations are and what they do.  Most
orginizations will access FTP, SSH, Telnet, SMTP, DNS, HTTP, POP3, IMAP,
NNTP, HTTPS and maybe a few others.  If all the traffic that your clients
are generating is internet based there is not much else that is common on
the net aside form the ports that various IM clients use.  You can fairly
quickly pare out the traffic that is obviously standard (as far as ports to
access any way) and be left with a small(er) list of ports that are being
accessed to decide if it is genuine traffic or not.  Unfortunetly this is a
learning process for every administrator on every network.  One tip that I
can give you would be to have rule like the following:
>
> iptables -t filter -A FORWARD -p tcp --dport 143
>
> You would want this rule, with out a jump target (-j...), to act as a
counter to see if you do have any traffic like this at all with out
interfering with the rest of your firewall.  If you put such rules above any
other rules that would effect the FORWARD chain you will get a decent
counter.  I would be tempted to modify the rule slightly, as such:
>
> iptables -t filter -A FORWARD -i $Client_1 -s $Client_1_Subnet -p
tcp --dport 143
>
> This will let you know how much traffic to port 143 (IMAP) Client #1 is
sending.
>
>
>
> Grant. . . .
>


