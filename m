From: Brent Clark <bclark@eccotours.co.za>
Subject: Re: Redirecting incoming packets to other port
Date: Wed, 11 Oct 2006 10:48:28 +0200
Message-ID: <452CAFDC.3070909@eccotours.co.za>
References: <c936c6b70610110109v73453362h65b8e34d6771dadd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c936c6b70610110109v73453362h65b8e34d6771dadd@mail.gmail.com>
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

Holger Kinkelin wrote:
> Hello everybody
> 
> how can I redirect packets sent to my computer to another port?
> 
> I tried: iptables -A PREROUTING -t nat -p udp --dport 5060 --sport
> 5060 -j DNAT --to-destination 192.168.0.21:5063
> 
> This rule is accepted but doesn't do anything. There are no other
> rules that could cause side effects.
> 
> Regards,
> Holger


http://www.linuxtopia.org/Linux_Firewall_iptables/x4508.html

HTH

Kind Regards
Brent Clark

