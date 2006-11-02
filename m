From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: Transparent splitting
Date: Thu, 2 Nov 2006 17:49:40 +0100 (CET)
Message-ID: <13388.807376805$1162486264@news.gmane.org>
References: <40d14a940611020723k6a73bd1fudbd831624cf1a214@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <40d14a940611020723k6a73bd1fudbd831624cf1a214@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: lee nookx <lnookx@googlemail.com>
Cc: netfilter@lists.netfilter.org

<citaat van="lee nookx">
> Hi,
>
> I am trying to find a way of transparently intercepting packets
> flowing across my network, so that I can transform them for use in
> another application.
>
> The reason I am trying to do this transparently is so that TCP
> clients/servers can operate seamlessly without having to worry about
> the proxy machine(s).
>
> I know that I can redirect the traffic to a proxy of my choice (a la
> -j REDIRECT), but I don't want to have to replicate the client/server
> interactions.
>
> I was thinking I might be able to do this just using a kernel module
> with netfilter hooks, but I can't see any obvious way of doing this.

-j ROUTE --tee

M4

