From: Michael Gale <mgale@utilitran.com>
Subject: Re: iptables related
Date: Mon, 8 Dec 2003 12:38:47 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031208123847.6f8fe3c6.mgale@utilitran.com>
References: <20031208191947.GA1603@msservices>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031208191947.GA1603@msservices>
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


You need to specify a protocol if you want to specify ports.

For example: 

iptables -A INPUT -p tcp --sport 80 -j ACCEPT

Michael


On Tue, 9 Dec 2003 00:49:47 +0530
Jeffrin <jeffrin@gamebox.net> wrote:

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
> 
> 


-- 
Michael Gale
Network Administrator
Utilitran Corporation

