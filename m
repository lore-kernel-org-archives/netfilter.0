From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Error accepting new connection
Date: Mon, 23 Jul 2007 21:46:42 +0200
Message-ID: <46A505A2.6040304@rtij.nl>
References: <46A49E6C.70403@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46A49E6C.70403@unipex.it>
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
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter@lists.netfilter.org

Michele Petrazzo - Unipex srl wrote:
> Hi list,
> I don't know if this are a iptables or a kernel or where it come from,
> but after this, I cannot more login on my server, so I think that it's a
> kernel/net problem, so I ask here :)
>
> I see that on my syslog there are a ton (milions) of:
>
> Jul 22 11:44:51 srv syslog-ng[22054]: Error accepting new connection;
> error='Too many open files (24)'
>
> But this is a "simple" server that do only nat and some other, simple,
> tasks, and there are no programs that can open so many files.

Doesn't seem like a netfilter problem. Try using lsof (before the point 
where you cannot login, or on a previous login if that still works) and 
netstat to see where those filehandles go.

HTH,
M4


