From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Does redirect in PREROUTING require open port in INPUT?
Date: Sat, 27 Mar 2004 20:50:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403272050.09406.Antony@Soft-Solutions.co.uk>
References: <jbm.20040327143144.8905e4c3@alkaid.pc9>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <jbm.20040327143144.8905e4c3@alkaid.pc9>
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

On Saturday 27 March 2004 8:31 pm, forum@users.pc9.org wrote:

> My situation is, I run two different nameservers (one on udp 53 and another
> one on udp 5300). The one on the higher port is meant to be private and
> used only by permitted IPs.
>
> Currently, I am using the following with success:
> -----------------------
> iptables -P INPUT DROP
> iptables -A INPUT -i $EXTIF -p udp --dport 53 -j ACCEPT
> iptables -A INPUT -i $EXTIF -p udp --dport 5300 -j ACCEPT
>
> iptables -t nat -A PREROUTING -i $EXTIF -p udp --dport 53 -s 1.2.3.4 \
> 	-j REDIRECT --to-ports 5300
> -----------------------
>
> Works fine; only the IP 1.2.3.4 can access the private nameserver while all
> other public requests go to the default server on port 53. However I found
> that I needed to explicitly open up port 5300 on INPUT for this to work.
> While I could throw in an additional -s check in the INPUT rules, it seems
> like an ugly duplication if I have a large number of IPs.
>
> Is there a more elegant way to do this port redirection without opening up
> the private port to the world? i.e. somehow see that a REDIRECT happened,
> rather than a packet actually coming in with destination port 5300?

I would recommend the use of split DNS.

Do it at the application layer instead of the network layer, then everything 
works on port 53.

Regards,

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


