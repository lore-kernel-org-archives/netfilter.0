From: Bernd Petrovitsch <bernd@firmix.at>
Subject: RE: (no subject)
Date: Tue, 21 Nov 2006 11:54:04 +0100
Message-ID: <1164106444.10072.16.camel@tara.firmix.at>
References: <B81183566FF73947875C3A207CD60AA6027C72AC@LONEX01.tideway.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B81183566FF73947875C3A207CD60AA6027C72AC@LONEX01.tideway.com>
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
To: Tim Edwards <t.edwards@tideway.com>
Cc: netfilter@lists.netfilter.org

On Tue, 2006-11-21 at 10:44 +0000, Tim Edwards wrote:
> 
> -----Original Message-----
> From: Bernd Petrovitsch [mailto:bernd@firmix.at] 
> Sent: 21 November 2006 10:13
> To: Tim Edwards
> Cc: netfilter@lists.netfilter.org
> Subject: Re: (no subject)
> 
> > Yes. Just insert such a rule into the OUTPUT chain.
> 
> Ok I have the following rules but it still isn't cutting off existing
> connections:

Yup.

> #!/bin/bash
> 
> # First clear all rules (and set the policy to DROP on the default
> chains)
> iptables -F
> # Second delete all the extra (user-defined) chains
> iptables -X
> # Set polcy on the default chains
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> # allow anything over loopback
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
> # Allow incoming ssh and http/s connections
> iptables -A INPUT -p tcp -m tcp -m multiport --dports 22,80,443 -j
> ACCEPT
> iptables -A INPUT -j LOG --log-prefix="INPUT REJECT" --log-level=info
> iptables -A INPUT -j REJECT
> # Allow already established ssh and http/s connections back out through
> the firewall
> iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

This allows all existing connections. If the above comment should be
correct, you probably forgot here something.

> iptables -A OUTPUT -j LOG --log-prefix="OUTPUT REJECT" --log-level=info
> iptables -A OUTPUT -j REJECT
> iptables -A FORWARD -j LOG --log-prefix="FORWARD REJECT"
> --log-level=info
> iptables -A FORWARD -j REJECT

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


