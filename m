From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: DNAT - TCP_MISS/503
Date: Thu, 7 Nov 2002 14:03:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FD8F124A387AD6119F7900A0D218B321019974@hslex01.hsl-brabantzuid.nl>
References: <NGBBJHGGHKMOJBIADANIAEKGEFAA.eugenio@imidianet.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NGBBJHGGHKMOJBIADANIAEKGEFAA.eugenio@imidianet.com.br>
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

> Sorry! I think this is a netfilter problem, because I'd
> stoped my squid
> and the problem not stoped.
>
> (If you test localhost IP my web server [123.0.0.18] it's okay!! but
> if you test the name of the local domain
> (wwww.mywebserver.com.br) it's not
> okay,
> the netscape report this error.)
>
> The access from INTERNET IP or domain name it's Okay, I don't
> undestant why.
>
> It's probably something with my Iptables CHAIS, what do you think?

What webserver did you test ; http://localhost or http://123.0.0.18 ?

We don't know anything about your setup so it's quite difficult if not
impossible to answer your question.
Could you post your iptables rules so that we might be able help you (and
please, not the output of : iptables -L, but the actual commands) ?


Rob


