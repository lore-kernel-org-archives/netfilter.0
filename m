From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: source nat does'nt work in bridge mode
Date: Wed, 8 Mar 2006 15:27:36 +0100 (CET)
Message-ID: <29018.217.166.60.19.1141828056.squirrel@ma.rtij.nl>
References: <3115d56e0603080251s485040f2n3bbcdb825363c752@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3115d56e0603080251s485040f2n3bbcdb825363c752@mail.gmail.com>
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
To: afshinlamei@gmail.com
Cc: netfilter@lists.netfilter.org

afshin lamei zei:
> dear all, I've a linux box with iptables which is working in bridge
> mode. I want to change (NAT) the source IP of the outging packets,
> using:
> iptables -t nat -A POSTROUTING -s 192.168.100.100 -j SNAT --to-source
> 192.168.100.1
> the rule works correctly (source nat is done), but the client
> (192.168.100.100) does not revieve any packet of the reply. sniffing the
> outgoing traffic shows that the next hop can not find the client with
> translated IP (192.168.100.1). what should I do?

Create a static arp entry on the firewall for 192.168.100.1 so the packets
can find their way back to the firewall. Remember, 192.168.100.1 does not
"exist" so we have to fake it in order for the arp protocol to work.

HTH,
M4




