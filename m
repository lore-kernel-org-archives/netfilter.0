From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: IP  + MAC filter -  doubt
Date: Wed, 04 May 2005 22:43:07 -0500
Message-ID: <4279964B.90001@riverviewtech.net>
References: <c76dd6c78318.c78318c76dd6@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c76dd6c78318.c78318c76dd6@vsnl.net>
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

> A FORWARD -i eth1 -o eth0 -s 192.168.0.5 \
> -m mac --mac-source XX:XX:XX:XX:XX:XX -j ACCEPT
> 
> First tell me if above rule correct.

Yes, that is one way to do it.  The ""other way(s) have to do with ACCEPTing vs redirecting to another chain for additional testing.

> Second I think I need first a  rule to 
> deny all IPs and MACs. Is that correct ?

Yes you will need a rule (or FORWARD policy) to not forward or DROP packets.  I would put this at the end of your FORWARD chain (or at least the section that does your MAC to IP pairing) after you have decided what MAC IP pairs to allow through.  Explicitly allow what you want to get out and then DROP or REJECT the rest of the chaff.

> Howto first deny all IPs and MACs ?

iptables -t filter -A FORWARD -i eth1 -o eth0 -j DROP

> Thanks in advance

No problem.



Grant. . . .

