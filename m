From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables + smnp + mrtg
Date: Tue, 6 Jul 2004 20:22:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407062022.18606.Antony@Soft-Solutions.co.uk>
References: <000001c46395$3c6f98c0$8c1ea8c0@Marketing01>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c46395$3c6f98c0$8c1ea8c0@Marketing01>
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

On Tuesday 06 July 2004 9:10 pm, knom wrote:

> Hi !
> I want to use iptables firewall to block all incoming traffic except on
> several ports like www, smtp, pop.
> It works all fine except for SNMP.
>
> I want to use MRTG on localhost therefore I need the snmp port 161.
>
> Therefore I did:
>
> /sbin/iptables -I INPUT -p tcp --dport 161 -j ACCEPT
> /sbin/iptables -I INPUT -p udp --dport 161 -j ACCEPT
> /sbin/iptables -I INPUT -p tcp --dport 162 -j ACCEPT
> /sbin/iptables -I INPUT -p udp --dport 162 -j ACCEPT
> /sbin/iptables -P INPUT DROP
>
> Now whenever I start mrtg from localhost and it wants to connect to my
> external IP-adress I get an error "no response received"
> When I make /sbin/iptables -P INPUT ACCEPT it works.
>
> I connect from the same host where the firewall and the snmp is running
> via the external IP.
>
> Can you help me ??

Do you ACCEPT all packets on the lo (loopback) interface?   If not, you might 
want to add a rule:

iptables -A INPUT -i lo -j ACCEPT

Otherwise, add a LOG rule after the four rules you have shown above, run mrtg, 
and see what packets get LOGged (just before getting DROPped by the default 
policy).   That should tell you what you want to ACCEPT instead.

Regards,

Antony.

-- 
I think, therefore I am.
I'm pink, therefore I'm Spam.
I drink, therefore I think I am.

                                                     Please reply to the list;
                                                           please don't CC me.


