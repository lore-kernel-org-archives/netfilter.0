From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: a problem with nat table setting
Date: Wed, 1 Feb 2006 07:49:00 +0100
Message-ID: <001801c626fb$955dff50$0101000a@sterenborg.info>
References: <d268cd070601311720o1d2a4ff4w259e8c8ab915d223@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d268cd070601311720o1d2a4ff4w259e8c8ab915d223@mail.gmail.com>
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
To: Netfilter <netfilter@lists.netfilter.org>

> Hi,
> 
> I am having a problem with the nat table configuration.  I am using
> 2.6.8.1 kernel in a router and also added a http filter proxy which
> uses port 8080. 
> 
> Internet ------------ ROUTER(http filter proxy) ---------linux PC.
>                                       lan ip: 192.168.1.1  
> 192.168.1.2 
> 
> I have found that if there is a established connection exist between
> linux PC and the webserver before I start the proxy, and added the
> iptables nat rules, which can be  checked use netstat, the outgoing
> http packet will not be passed to the proxy, and it seems go out
> directly.

I would say that's why the connection is *established*. Once it's
established, it will not be doing anything else untill the connection is
closed.

> If I leave it untouched (no http activity), and after some
> time later, that connection is gone,  the outgoing http packet will
> be passed to the proxy again. 
> 
> Any one know how to solve this problem?

Kicking an open door : 
- start the proxy before your iptables rules.
- Unless I'm missing something, you are using a proxy for internet
access. In that case you probably don't want to allow http(s)
forwarding, so ; do not use such rules or restrict them to hosts that
should not use the proxy.


Gr,
Rob


