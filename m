From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables and smtp
Date: Fri, 7 May 2004 18:27:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405071827.09173.Antony@Soft-Solutions.co.uk>
References: <1083949806.710.239.camel@worldvenue.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1083949806.710.239.camel@worldvenue.org>
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

On Friday 07 May 2004 6:10 pm, Barry Skidmore wrote:

> I am experimenting with Trustix-2.1 Linux on a home machine connected
> directly to the Internet.  I am using Postfix as the MTA and mutt as the
> email client.
>
> The problem is that I am not able to receive mail, although I can send,
> when the iptables rules below are implemented.

>  #set default policies.
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT DROP

Good.

(Ruleset snipped to show the important bits)

>  #drop everything else.
> iptables -A INPUT -j DROP

(Later)

> #iptables -A INPUT -p TCP --dport 25 -j ACCEPT

You need to put this before DROPping all packets - otherwise no packets will 
ever get as far as this rule :)

I suggest you remove the DROP *rules* and just leave the DROP *policies* in 
place - then you can add more rules to accept other types of packets without 
getting confused like this.

> #OUTPUT rules
>  #drop all outgoing invalid packets.
> iptables -A OUTPUT -m state --state INVALID -j DROP
>  #outgoing traffic is allowed without restriction.
> iptables -A OUTPUT -j ACCEPT

This is why you can send mail - no restrictions on OUTPUT (and INPUT allows 
replies).

Regards,

Antony.

-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.

                                                     Please reply to the list;
                                                           please don't CC me.


