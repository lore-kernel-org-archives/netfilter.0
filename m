From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: I submit you my rules, to have your opinions.
Date: Fri, 12 Mar 2004 12:52:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403121252.40589.Antony@Soft-Solutions.co.uk>
References: <4051AEC2.30100@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4051AEC2.30100@wanadoo.fr>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Friday 12 March 2004 12:36 pm, Rakotomandimby Mihamina wrote:

> Hi everybody.
> I made several searches over the internet to build my firewall rules.
> Here they are :
> http://stko.dyndns.info/scripts/ipt

I really think you should restrict the rules:

> # My ISP DNS's ... is it correct to put this like that ?
> iptables -A INPUT -s 193.252.19.3 -j ACCEPT
> iptables -A INPUT -s 193.252.19.4 -j ACCEPT

so that they only allow DNS packets (TCP + UDP, both port 53).   There's no 
reason to give your ISPs DNS servers free access to everything on your 
Firewall.

You don't actually need:

> iptables -A INPUT -p tcp --dport 20 -j ACCEPT

because you already have:

> iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

This rule will allow FTP data connections on port 20 as being RELATED to the 
control connection on port 21.

SSH doesn't use UDP, so no need for this rule:

> iptables -A INPUT -p udp --dport 22 -j ACCEPT

Same for HTTP, FTP, NNTP and POP3 - they don't use UDP, so remove these rules:

> iptables -A OUTPUT -p udp --dport 80 -j ACCEPT
> iptables -A OUTPUT -p udp --dport 21 -j ACCEPT
> iptables -A OUTPUT -p udp --dport 119 -j ACCEPT
> iptables -A OUTPUT -p udp --dport 110 -j ACCEPT

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


