From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: MARK?
Date: Mon, 20 Jan 2003 11:24:37 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0301201120280.4807@dns.toxicfilms.tv>
References: <1042933580.1171.186.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042933580.1171.186.camel@localhost.localdomain>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Drew Einhorn <drew.einhorn@starband.net>
Cc: netfilter list <netfilter@lists.netfilter.org>

> What I to do is MARK a packet's stream.  I want to be able to match
> ESTABLISHED packets to determine if they belong to a MARKed stream.
How about:
Well, just mark the packets and then match the marked that are belong to
ESTABLISHED, like so:

example:
iptables -A PREROUTING -t mangle -p tcp --dport 80 -j MARK --set-mark 3

iptables -A FORWARD -m state --state ESTABLISHED -m mark --mark 3 -j LOG

Regards,
Maciej Soltysiak


