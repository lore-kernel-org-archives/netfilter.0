From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: off topic - hope somebody can help
Date: Fri, 11 Jun 2004 12:29:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406111229.36397.Antony@Soft-Solutions.co.uk>
References: <000901c44f53$44b9be80$0200000a@heretic>
Reply-To: "netfilter" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000901c44f53$44b9be80$0200000a@heretic>
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
To: netfilter <netfilter@lists.netfilter.org>

On Friday 11 June 2004 2:27 am, Alexis wrote:

> Does anybody knows why ethernet interfaces stay's up even when i unplug the
> ethernet cable?

Why shouldn't it?   The interface is still fully functioning even if you 
choose to disconnect it - I think plenty of people would get upset if the 
interface went down on its own just because the cable got unplugged (or the 
hub had a short power failure)...

> I have 2 isp connected to a box, with a default route pointing both of them
> one using a higer weight to use it as backup conection (using iproute2).
> Ok, if i unplug the ethernet cable of eth of isp1 , the ethernet card stays
> up and nobody can make any connection. But, if i "really" force the
> interface shutdown of provider1 (doing ifdown eth1) the traffic goes
> instantly trough provider2.
>
> Any idea how can i tear down an interface when i unplug the ethernet cable?

Personally I would prefer to do something like a ping test to each ISPs 
gateway router - then you can switch routes if any part of the connection 
between your box and the link to the Internet goes down, not just one 
specific piece of CAT5 cable.

Regards,

Antony.

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


