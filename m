From: "Alexis" <alexis@tpys.com.ar>
Subject: RE: off topic - hope somebody can help
Date: Fri, 11 Jun 2004 16:58:26 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1BYsAQ-0004Yv-Ow@vishnu.netfilter.org>
References: <20040611165451.GA4079@legolas.on.net.mk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040611165451.GA4079@legolas.on.net.mk>
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

It could help


-----Mensaje original-----
De: Damjan [mailto:gdamjan@mail.net.mk] 
Enviado el: Viernes, 11 de Junio de 2004 13:55
Para: netfilter@lists.netfilter.org
CC: Alexis
Asunto: Re: off topic - hope somebody can help

> Does anybody knows why ethernet interfaces stay's up even when i unplug
the
> ethernet cable?
> 
> I have 2 isp connected to a box, with a default route pointing both of
them one
> using a higer weight to use it as backup conection (using iproute2). Ok,
if i
> unplug the ethernet cable of eth of isp1 , the ethernet card stays up and
nobody
> can make any connection. But, if i "really" force the interface shutdown
of
> provider1 (doing ifdown eth1) the traffic goes instantly trough provider2.
> 
> Any idea how can i tear down an interface when i unplug the ethernet
cable?

you can use netplugd, look it up on freshemat.net.

-- 
damjan | ??????
This is my jabber ID --> damjan@bagra.net.mk <-- not my mail address!!!


