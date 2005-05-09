From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: ICMP rule for stateful firewall
Date: Mon, 09 May 2005 09:47:46 -0500
Message-ID: <427F7812.3010500@riverviewtech.net>
References: <9927912d05050903154ad4c3f6@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d05050903154ad4c3f6@mail.gmail.com>
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

> I wanted to ask if such a rule was possible:
> 
> iptables -A FORWARD -i eth0 -o eth0 -s 192.168.10.0/24 -d
> 192.168.10.0/24 -m state --state NEW,ESTABLISHED,RELATED -p icmp
> --icmp-type echo request -j ACCEPT

Yes, such a rule seems valid as in there are no syntax errors.  However I think this type of rule is a bit odd to see.  The fact that you are coming in and doing out the same interface does not bother me, but the fact that your source and destination are on the same subnet perplexes me.  Normally this sort of operation would be reserved for a single physical LAN subnet.  I have seen such traffic before, namely when I used a DNAT to redirect web traffic from a LAN back in to a proxy on the same LAN.  (This was used to thwart people that tried to bypass the proxy on the LAN.)  I find it a little odd that you would need ICMP traffic from the local LAN destined to the local LAN to pass through your router, but hey, I'm not saying that it would never happen.  Based on your rule ICMP traffic from someone on your local LAN on eth0 with a source IP in the 192.168.10.0/24 subnet destined to your 
 local LAN on eth0 with a destination IP in the 192.168.10.0 subnet *SHOULD* work just fin
d.



Grant. . . .

