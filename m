From: Daniel Chemko <dchemko@smgtec.com>
Subject: Re: Are IP ALIASES supported by iptables?
Date: Mon, 28 Jul 2003 22:20:21 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F260415.2030200@smgtec.com>
References: <008301c3558f$22b075e0$080a0a0a@medannic>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008301c3558f$22b075e0$080a0a0a@medannic>
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
To: HTB <kerasakti@nusa.net.id>
Cc: netfilter@lists.netfilter.org

nope. IP Aliases are depreciated, baby!

HTB wrote:

> When i want to active nat using iptable on eth0:0 (aliasing) "error 
> appear"
> # /sbin/iptables -A POSTROUTING -j MASQUERADE -t nat -s 192.168.0.0/24 
> -o eth0:0
> Warning: wierd character in interface `eth0:0' (No aliases, :, ! or *).
>  
>
> Are IP ALIASES supported by iptables?
>
>  
>
> regards
>
> HTB
>


