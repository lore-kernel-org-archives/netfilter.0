From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Bridge+Bandwidth Control
Date: Sat, 12 Apr 2003 01:54:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030412015418.3dc213da.arnt@c2i.net>
References: <000d01c2ffbd$947bac30$010aa8c0@crz2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c2ffbd$947bac30$010aa8c0@crz2>
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

On Fri, 11 Apr 2003 02:02:01 +0200, 
<000d01c2ffbd$947bac30$010aa8c0@crz2>:

> Hi!
> 
> I was trying to implement traffic control on a linux
> bridge. Basically, I'll need to allocate designated bandwidth
> to various services while the rest get throttled.
> 
> Eg. on a 10MBit bandwidth.
> http/ftp will get 128K
> while the rest (smtp/POP3) will get 64K.
> Whatever traffic passing through the bridge
> in one direction must not exceed 192K.
> 
> To my dismay, I realised that firewall marking classifier
> will not work under bridging mode.
> 
> So right now I'm kind of stuck because of that.
> 
> Can someone tell me whether if I can implement something like
> the above?

..my first throttle box hangs an ip-less bridge outside my isp clients
firewall, (to control bandwidth for his 802.11 linked customers), how 
is your setup ?


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


