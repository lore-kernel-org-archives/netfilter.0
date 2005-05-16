From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: broadcast and router ?
Date: Mon, 16 May 2005 16:22:40 -0500
Message-ID: <42890F20.90808@riverviewtech.net>
References: <42876bf0.7523c613.1324.592eSMTPIN_ADDED@mx.gmail.com>
	<1403218a050516012475c0343f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1403218a050516012475c0343f@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

> ebtables ??
> 
>>Hi. Sorry for my bad english.
>>
>>Our local chat use a UDP 8167 and broadcast. All is OK but people over
>>router in other network don't receive a packets.
>>
>>Can I have route this packets to they's network with iptables?
>>
>>networks are 192.168.0.255 and 192.168.1.255

If I could not get both networks working on a larger subnet (/23?) I would possibly try (D/S)NATing traffic that was destined to one subnetworks broadcast address to another and vice-versa.  I would also seriously look to see if there was an application level proxy for your chat program.  Below is a sample rule that I would be tempted to try:

iptables -t nat -A PREROUTING -i $LAN_1_if -d 192.168.0.255 -p udp --dport 8167 -j DNAT --to-destination 192.168.1.255
iptables -t nat -A PREROUTING -i $LAN_2_if -d 192.168.1.255 -p udp --dport 8167 -j DNAT --to-destination 192.168.0.255
iptables -t nat -A POSTROUTING -o $LAN_1_if -d 192.168.0.255 -p udp --dport 8167 -j SNAT --to-source $LAN_1_if_IP
iptables -t nat -A POSTROUTING -o $LAN_2_if -d 192.168.1.255 -p udp --dport 8167 -j SNAT --to-source $LAN_2_if_IP

I *think* this is a quick and *DIRTY* hack that should get the traffic to cross the subnets.  I say DIRTY b/c this type of practice is avoided for a lot of different reasons.  You may or may not want to SNAT the traffic depending on how the client software plays.  I would make sure to ONLY DNAT traffic to the broadcast to a specific UDP port to prevent spreading of any other broadcast traffic.



Grant. . . .

