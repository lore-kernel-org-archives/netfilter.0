From: Jason Williams <jwilliams@courtesymortgage.com>
Subject: Re: Second shot at IPTables script
Date: Fri, 17 Dec 2004 15:40:59 -0800
Message-ID: <6.1.2.0.0.20041217153701.02477400@corpmail.courtesymortgage.com>
References: <6.1.2.0.0.20041217130746.026796b0@corpmail.courtesymortgage.com>
	<1103319685.3262.34.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103319685.3262.34.camel@hubcap.ljm.dom>
References: <6.1.2.0.0.20041217130746.026796b0@corpmail.courtesymortgage.com>
	<1103319685.3262.34.camel@hubcap.ljm.dom>
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
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

At 01:41 PM 12/17/2004, Jason Opperisano wrote:
> > $IPTABLES -A INPUT -p ALL -i $LAN_IFACE -s $LAN_IP_RANGE -j ACCEPT
>
>you really want to allow unlimited access to your firewall from your
>internal network?

Just thought about this. What if I wanted to give just one box SSH access 
to the firewall (maintenance lets say).

It would be something like this:

$IPTABLES -A INPUT -p tcp -i $LAN_IFACE -s 192.168.1.90 -dport 22 -j ACCEPT


My head is getting swimmy. but the idea is just allow that box on my LAN, 
SSh access to the firewall.

Vacation, here I come!.

Cheers,

Jason


