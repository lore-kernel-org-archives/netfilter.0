From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: iptables related
Date: Mon, 8 Dec 2003 14:35:00 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312081435.00136.JALaramie@Loudoun-Fairfax.com>
References: <20031208191947.GA1603@msservices>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031208191947.GA1603@msservices>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Monday 08 December 2003 14:19, Jeffrin wrote:
> hello all,
>
> iptables -A INPUT -sport 80 -j ACCEPT
>
> shows error ...
>
>  msservices:~# iptables -A INPUT --sport 80 -j ACCEPT
> iptables v1.2.9: Unknown arg `--sport'
> Try `iptables -h' or 'iptables --help' for more information.
>
> please help me ...

There are 2 dashes before sport:  --sport 80

Jeff

