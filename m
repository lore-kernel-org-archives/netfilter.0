From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Ping only inside my network
Date: Mon, 20 Dec 2004 08:34:26 +0100
Message-ID: <20041220073406.E37712F42A@kshira.sterenborg.info>
References: <41C65E7F.9040609@allpossible.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41C65E7F.9040609@allpossible.gr>
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

netfilter-bounces@lists.netfilter.org wrote:

>   First time to write, i hope i do it the right way :) i want

Welcome :o)

> to be able to make pings inside my network. At the moment i
> am trying to ping my linux box from an windows terminal and i get
> request timed out. 

You don't give much information about what you've done already, but you
have probably set the policy for the INPUT chain to DROP so it will drop
any packet for which NF has no rule to accept it.
In that case you'll have to accept ICMP traffic from your LAN :
iptables -A INPUT -i $IF_LAN -s $IP_LAN -p icmp -j ACCEPT

If you have also set policy to DROP for the OUTPUT chain, you'll want to
be able to send the reply packets :
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT


Gr,
Rob


