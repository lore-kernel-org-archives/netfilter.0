From: Jason Opperisano <opie@817west.com>
Subject: Re: Input chain, traffic from interface lo
Date: Wed, 08 Dec 2004 08:00:05 -0500
Message-ID: <1102510805.3556.2.camel@hubcap.ljm.dom>
References: <20041208123229.14114.qmail@web54106.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041208123229.14114.qmail@web54106.mail.yahoo.com>
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

On Wed, 2004-12-08 at 07:32, Vesselin Kostadinov wrote:
> Hi,
> 
> The current "Iptables Tutorial" contains the following lines:
> 
> $IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
> $IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LAN_IP -j ACCEPT
> $IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $INET_IP -j ACCEPT
> 
> where $LO_IFACE is "lo", $LO_IP is "127.0.0.1", $LAN_IP is "192.168.0.2" and
> $INET_IP is "194.236.50.155". 
> 
> I fully agree with the first line but I am a bit puzzled by the other 2
> lines. Is there any chance packets with source IP other than 127.0.0.1 to
> come from interface lo?

no.  the linux routing code drops packets with source IP != 127.0.0.1
received on lo as a "martian source."

i used to have the actual line in the source code handy, but i'm sure
some constructive grepping will get you there.

-j

--
"Look, just give me some inner peace, or I'll mop the floor with ya!"
	--The Simpsons


