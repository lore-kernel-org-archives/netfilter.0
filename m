From: "Andrew E. Mileski" <andrewm@isoar.ca>
Subject: Re: NAT and DNS/NTP servers
Date: Sat, 01 May 2004 16:00:02 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409401C2.5080801@isoar.ca>
References: <409310DE.2020004@isoar.ca> <200405010819.30079.Antony@Soft-Solutions.co.uk> <4093E190.8020308@isoar.ca> <200405011905.30495.Antony@Soft-Solutions.co.uk> <4093FFB3.9060502@isoar.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4093FFB3.9060502@isoar.ca>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Andrew E. Mileski wrote:
> When a private client (192.168.1.2) sends a packet to the same place,
> the packet arriving on the LAN_IFC has:
>   source address: private client = 192.168.1.2
>   source port: 123
>   destination address: time.nist.gov = 192.43.244.18
>   destination port: 123
> This gets SNAT'ed by the gateway and sent out the WAN_IFC to the
> internet looking like this:
>   source address: WAN_IP = 209.217.118.226
>   source port: 123
>   destination address: time.nist.gov = 192.43.244.18
>   destination port: 123
> A reply packet from time.nist.gov arrives on WAN_IFC with:
>   source address: time.nist.gov = 192.43.244.18
>   source port: 123
>   destination address: WAN_IP = 66.11.173.24
>   destination port: 123
> Because the port wasn't remapped, there appears to be ambiguity
> in whether the reply packet should be routed to the private host
> (192.168.1.2) or the NTP server process on the router.

Doh! made a mistake the WAN_IP in the reply above should
be 209.217.118.226 not 66.11.173.24.  Sorry.  [That's why
I tried to avoid typing numbers originally; to avoid mistakes.]

-- 
Andrew E. Mileski

