From: Manuel Samper <manuel@samper.dyndns.org>
Subject: Re: ICMP: What should be blocked?
Date: Thu, 6 Mar 2003 22:12:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030306211219.GB28937@quark.lan>
References: <3E65A2C5.3030007@mega-bucks.co.jp>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3E65A2C5.3030007@mega-bucks.co.jp>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Jean-Christian Imbeault, on Wednesday, Mar  5 2003 at 08:09, wrote:
> I been googling the web trying to find what rules I should set up for 
> ICMP but I've seen some people say one thing while other say something 
> completely different.
> 
> One question I have not been able to find an answer to though, should I 
> block ICMP messages of type 11 (TTL exceeded)?
> 
> Also if anyone knows of a good resource that explains what ICMP messages 
> I should block (why and how :) could they let me know? I understand that 
> it of course depends on my level of paranoia and how friendly I want to 
> be to the rest of the net, but I get the feeling from my readings that 
> the are some ICMP messages that just should not be let through a 
> firewall ....

Here are a good start point:
http://www.sns.ias.edu/~jns/security/iptables/iptables_conntrack.html#ICMP
http://www.sns.ias.edu/~jns/security/iptables/rules.html

Although it's somewhat paranoid with icmp (e.g. the icmp_echo_ignore_all),
you can tune it to your needs.

(note also that the REJECT rule of auth port found there needs an output one
 with an OUTPUT DROP default policy, something like:
 iptables -A OUTPUT -o $IFACE -p tcp -m state --st REL --sp ident -j ACCEPT)

	Manuel

