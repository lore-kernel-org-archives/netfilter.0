From: Whit Blauvelt <whit@transpect.com>
Subject: Re: DNAT from an IP address that does not exist to another that exists
Date: Thu, 7 Aug 2003 08:03:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030807120330.GA16731@china.patternbook.com>
References: <004e01c35caf$86bd4910$200aa8c0@thorin> <006201c35cb0$e2f396c0$200aa8c0@thorin>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <006201c35cb0$e2f396c0$200aa8c0@thorin>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carlo Florendo <carlo@hq.astra.ph>
Cc: netfilter@lists.netfilter.org

On Thu, Aug 07, 2003 at 02:55:28PM +0800, Carlo Florendo wrote:

> So this means that:     
> 
> iptables -t nat -I POSTROUTING -s 192.168.30.0/24 -d 192.168.30.11 \ -j MASQUERADE  (your solution)
> 
> and 
> 
> iptables -I POSTROUTING -t nat -s 192.168.30.0/24 -o $INTDEV -d \ 
>     192.168.30.11 -j SNAT --to 192.168.30.1 (c/o George Vieira)
> 
> are equivalent (given that 192.168.30.1 is the gateway).

They get you to the same place. But it's said that SNAT is more resource
efficient.

Whit

