From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: bridging with iptables (was no subject)
Date: Fri, 28 Jun 2002 23:53:14 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020628225316.KGEW295.mta03-svc.ntlworld.com@there>
References: <200206281739.AA386531398@mail.ev1.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206281739.AA386531398@mail.ev1.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Friday 28 June 2002 11:39 pm, riffraff wrote:

> From: Antony Stone <Antony@Soft-Solutions.co.uk>
> Date: Fri, 28 Jun 2002 23:29:48 +0100
>
> >In which case.... can anyone here give some advice on combining netfilter
> >with a bridge (which, as Patrick kindly pointed out) doesn't have an IP
> >address on *either* (any?) of its interfaces ?
> >
> >ie does the standard Linux routing system, and the various netfilter
> > hooks, still work sensibly enough to be able to put netfilter rules onto
> > a bridge ?
>
> Yes, look at the bridge-netfilter project:
> http://bridge.sourceforge.net/

Hmmm.   Good.

I know this is getting a bit off-topic now, but does anyone know if you can 
combine bridging with IPsec ?   ie have two bits of the same network address 
range bridged across a VPN link ?

I've only ever set up IPsec links with a routing table pointing to the 
'other' network across the VPN link...


 

Antony.

