From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: ip alias
Date: Tue, 28 Sep 2004 08:56:58 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41596DAA.9040900@pbl.ca>
References: <002a01c4a509$74f94b40$936ffea9@alpha>	<1096351043.4158fd43638a8@webmail2>
	<007f01c4a552$7c95a620$936ffea9@alpha>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <007f01c4a552$7c95a620$936ffea9@alpha>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

John Black wrote:
> but the traffic from 192.168.1.23 that i need to go to the internet i would
> like to
> have addressed as 161.31.31.23

You need SNAT (source NAT), not DNAT (destination NAT).  I'll assume 
eth0 has address 161.31.31.23:

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source 161.31.31.23

or if eth0 has dinamically allocated IP address:

iptables -t nat -A POSTROUTING -o eth0 -j MASQUARADE

I'm not sure why you are assigning local IP address as an alias to your 
external interface (probably something you haven't mentioned), so I 
wan't comment on whether it is needed or not.  Also, in case when you 
have multiple IP addresses (aliases) assigned to an interface, I'm not 
sure exactly how MASQUERADE target behaves.  man iptables for more 
details and differences between SNAT and MASQUERADE targets.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

