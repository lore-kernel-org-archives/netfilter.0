From: Ivan Gustin <ivan.gustin@pu.t-com.hr>
Subject: Re: Rerouting remote users to VPN channel
Date: Tue, 25 Apr 2006 10:21:07 +0200
Message-ID: <444DDBF3.6050500@pu.t-com.hr>
References: <444D25BA.6040505@pu.t-com.hr>
	<ac931180604250056o78395d79tb793c857b312886c@mail.gmail.com>
Reply-To: ivan.gustin@pu.t-com.hr
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ac931180604250056o78395d79tb793c857b312886c@mail.gmail.com>
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
To: Matt Barclay <mbarclay@openfbo.com>
Cc: netfilter@lists.netfilter.org

Matt Barclay:
> Yes, you need SNAT and DNAT rules.  Something like this ought to work

Thank you, Matt, for answering.

> iptables -t mangle -A PREROUTING -d <yourPublicIP> -p tcp --dport 80
> -j MARK --set-mark 80
> iptables -t nat -A PREROUTING -m mark --mark 80  -j DNAT --to 192.168.30.9
> iptables -A FORWARD -m mark --mark 80 -j ACCEPT
> iptables -t nat -A POSTROUTING -m mark --mark 80 -j SNAT --to
> <firewallPrivateIP>

Yes, I set up something like this few hours ago, and it worked. But, 
unfortunately, Intranet Web application uses absolute private IP 
addresses, so that can't work. Application starts, but when user clicks 
on some option connection hangs trying to open http://192.168.30.9/.... 
:-( I can't change third-party Web app.

I don't see any other solution but setting up VPN so users have private 
routeable IP addresses.

Thanks anyway.

GI

