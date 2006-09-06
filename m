From: Danny Rathjens <gmane@rathjens.org>
Subject: Re: Newbie question about NAT and forwarding
Date: Wed, 06 Sep 2006 18:24:34 -0400
Message-ID: <ednhr3$pjc$1@sea.gmane.org>
References: <20060906205232.GA23980@crowfix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060906205232.GA23980@crowfix.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

felix@crowfix.com wrote:
> I have a small network with a gateway machine which has two interfaces
> to the internet.  One is (yes!) ppp0, a dialup account, the other is a
> broadband connection.  Some of the network machines behind the gateway
> have real static addresses, some have 192.168.* or similar local net
> addresses.  The dialup account has static real addresses for those
> local net machines which need internet access, but the broadband
> connection gets its address dynamically from DHCP.  As much as it
> would be nice to ditch the dialup account altogether, that is not
> practical at the moment.
> 
> I would like all the local net machines to not be aware of there being
> multiple connections, to route all SMTP traffic, both in and out, thru
> the dialup account, and to route all other traffic thru the broadband
> connection.
> 
> I think I know how to route based on the protocol.  For SMTP, that is
> made easier by not needing to NAT anything.  But I need NAT for all
> other traffic using the broadband connection, right? since it has only
> a single synamically assigned DHCP address.  This is where I get
> confused.
> 
> What iptables commands would I used to route non-SMTP packets between,
> say, eth0 (local net, static real addresses) and eth1 (broadband DHCP)?
 
I just did something similar.
Just follow normal procedure for NAT of traffc using and us broadband as default route:
route add default gw $broadband_gateway

Then you just need to route the smtp traffic through your dial-up.

iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 25 -j MARK --set-mark 2
echo 202 mail >> /etc/iproute2/rt_tables
ip rule add fwmark 2 table mail
ip route add default via $dialup_gateway dev eth0 table mail
ip route flush cache


