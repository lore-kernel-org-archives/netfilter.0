From: "krv" <krv@kaevee.com>
Subject: Re: Synfloods - SNAT slow down
Date: Fri, 23 Apr 2004 20:25:07 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00c601c42942$f7b919e0$2800a8c0@jupiter>
References: <005201c428d1$a2ab2ea0$2800a8c0@jupiter> <200404230801.57077.lists@edeca.net> <007601c42938$e74199c0$2800a8c0@jupiter> <005f01c42940$79a18210$1202a8c0@admin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

----- Original Message -----
From: "Rob Sterenborg" <rob@sterenborg.info>
To: <netfilter@lists.netfilter.org>
Sent: Friday, April 23, 2004 8:07 PM
Subject: Re: Synfloods - SNAT slow down


> > I have two thousand hosts and two thousand forward rules :(
>
> With so many hosts/rules you should be able to match subnets instead of
> each host separately, reducing the number of rules greatly which in turn
> improves Netfilter performance. Or do you have a special reason to do
> this ?
>
>
> Gr,
> Rob
>

I had seen a patch in patch-o-matic which is supposed to fix a performance
issue in SNAT during floods. In fact the current kernel runs with the above
said patch.

You are right. In fact, I am rewriting the script which will generate
netfilter rules. I wanted to find out whether I can fine tune the new
netfilter rule set to offset the overloading of the gateway due to syn/icmp
floods.

Do you think, if I have a hierarchical filter rule set, there would be an
improvement?

KRV




