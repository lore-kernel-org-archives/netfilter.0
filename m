From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: DNAT/SNAT and logging
Date: Mon, 19 Jan 2004 10:21:36 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <400BF600.9060005@Loudoun-Fairfax.com>
References: <1074524662.2456.23.camel@ankarloo.got.volvo.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1074524662.2456.23.camel@ankarloo.got.volvo.net>
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

Johan Ankarloo wrote:

>Hi
>
>Does anyone know how to log a DNAT/SNAT connection? When logging a NAT
>connection you also want to know the origin source/destination/port of
>that packet. Is that possible?
>
>  
>

Sure. The easiest way to do it is to add a matching log rule just before 
the nat rule:

iptables -t nat -A POSTROUTING -o $Net_Interface -j LOG --log-prefix 
"SNAT: "
iptables -t nat -A POSTROUTING -o $Net_Interface -j SNAT --to $Net_IP

Jeff


