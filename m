From: Jason <jason@jasonandjessi.com>
Subject: Re: off topic - hope somebody can help
Date: Thu, 10 Jun 2004 21:13:31 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0406102112280.1382@shinobi.jasonandjessi.com>
References: <000901c44f53$44b9be80$0200000a@heretic>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexis <alexis@tpys.com.ar>
Cc: netfilter <netfilter@lists.netfilter.org>

after you yank the cable, what happens if you run mii-tool ethX .  Does it
say that the link is dead? If so, what I do is run mii-tool in monitor
mode and just look for a "link down" statement in syslog. When it arrives,
I down the interface with no cable.  Not the most elegant, but it has
worked for me for some time now.


-- 
       Jason
www.jasonandjessi.com
It gimme the jibblies

On Thu, 10 Jun 2004, Alexis wrote:

> Does anybody knows why ethernet interfaces stay's up even when i unplug the
> ethernet cable?
>
> I have 2 isp connected to a box, with a default route pointing both of them one
> using a higer weight to use it as backup conection (using iproute2). Ok, if i
> unplug the ethernet cable of eth of isp1 , the ethernet card stays up and nobody
> can make any connection. But, if i "really" force the interface shutdown of
> provider1 (doing ifdown eth1) the traffic goes instantly trough provider2.
>
> Any idea how can i tear down an interface when i unplug the ethernet cable?
>
> Thanks in advance.
>
>
>

