From: Jason Opperisano <opie@817west.com>
Subject: Re: Rules for Cisco VPN Client
Date: Thu, 10 Mar 2005 10:28:23 -0500
Message-ID: <20050310152822.GA29914@bender.817west.com>
References: <20050310143608.M70602@tkevans.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050310143608.M70602@tkevans.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Mar 10, 2005 at 10:36:08AM -0400, Tim Evans wrote:
> Anyone have working iptables rules for supporting the Cisco VPN client?  Thanks.

depends how the clients are configured.

you'll always need to allow UDP 500 for IKE.

then depending on the configuration of the clients you would need one
(or some, or all) of the following:

IP Proto 50 (ESP)
UDP 4500 (PIX NAT-T)
UDP 10000 (VPN CON NAT-T 1)
TCP 10000 (VPN CON NAT-T 2)

if the VPN server is a Concentrator--the encapsulation port can be set
to pretty much any arbitrary value--consult with the admin for details.

kitchen sink rules would be:

  iptables -A FORWARD -i $INSIDE_IF -o $OUTSIDE_IF -p 50 \
    -s $INSIDE_NET -d $VPN_GW -j ACCEPT

  iptables -A FORWARD -i $INSIDE_IF -o $OUTSIDE_IF -p udp \
    -s $INSIDE_NET -d $VPN_GW --dport 500 -j ACCEPT

  iptables -A FORWARD -i $INSIDE_IF -o $OUTSIDE_IF -p udp \
    -s $INSIDE_NET -d $VPN_GW --dport 4500 -j ACCEPT

  iptables -A FORWARD -i $INSIDE_IF -o $OUTSIDE_IF -p udp \
    -s $INSIDE_NET -d $VPN_GW --dport 10000 -j ACCEPT

  iptables -A FORWARD -i $INSIDE_IF -o $OUTSIDE_IF -p tcp --syn \
    -s $INSIDE_NET -d $VPN_GW --dport 10000 -j ACCEPT

again--if the TCP/UDP encapsulation port has been changed from the
default, you'd need to accommodate for that as well.

HTH...

-j

--
"Simpson, Homer Simpson, he's the greatest guy in his-tor-y. From
 the town of Springfield, he's about to hit a chestnut tree....D'oh!"
        --The Simpsons

