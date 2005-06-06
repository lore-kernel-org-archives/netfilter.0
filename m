From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: port forwaring from localhost to inet
Date: Mon, 06 Jun 2005 10:56:41 +0200
Message-ID: <42A40FC9.4040804@mnemon.de>
References: <42A1DDEB.9040207@redwhitearmy.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42A1DDEB.9040207@redwhitearmy.com>
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
To: netfilter@lists.netfilter.org

Oran G schrieb:
> hello,
> 
> I want to forward local requests to a mashine on the network.

This is done in nat table with OUTPUT chain. This chain is for natting
locally generated packages. If you don't have this chain, you have to
recompile the kernel with appropriate settings.

Have a nice time

Joerg





