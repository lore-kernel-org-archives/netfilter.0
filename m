From: Aaron Clausen <maureen-taocow@alberni.net>
Subject: Re: cbq.init and iptables NAT routing
Date: Thu, 3 Oct 2002 13:15:57 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0210031314220.27868-100000@ts1.alberni.net>
References: <1033672321.682.12.camel@elendil>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1033672321.682.12.camel@elendil>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: Aaron Clausen <maureen-taocow@alberni.net>, netfilter@lists.netfilter.org

On 3 Oct 2002, Cedric Blancher wrote:
>
> Imho, you must have set up your eth0 rule with SNAT address, which does
> not work, as explained below.

Here's the portion of my iptables script which sets up NAT.  Maybe you can
gleam something more from this.  It should be noted that I'm not using NAT
for security purposes, and I have it set up so my local public subnet can
see the NAT addresses.

iptables -t nat -A PREROUTING -i eth0 -d 64.251.69.2 -j DNAT --to 10.102.106.2
iptables -t nat -A POSTROUTING -o eth0 -s 10.102.106.2 -j SNAT --to 64.251.69.2
iptables -t nat -A PREROUTING -i eth0 -d 64.251.69.3 -j DNAT --to 10.101.106.2
iptables -t nat -A POSTROUTING -o eth0 -s 10.101.106.2 -j SNAT --to 64.251.69.3

iptables -t nat -A POSTROUTING -o eth0 -s 10.101.104.0/21 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth0 -s 10.102.104.0/21 -j MASQUERADE
iptables -t nat -A POSTROUTING -o eth0 -s 10.103.104.0/21 -j MASQUERADE


-- 
Aaron Clausen


