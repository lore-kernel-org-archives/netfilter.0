From: Scott van Looy <scott@ethosuk.org.uk>
Subject: RE: MS Messenger
Date: Wed, 13 Nov 2002 09:15:36 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211130914150.16075-100000@novak.ethosuk.org.uk>
References: <E131E9F1848D0148813EAF06A846608FD77706@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E131E9F1848D0148813EAF06A846608FD77706@w2ks-e2k.iconos.be>
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
To: netfilter@lists.netfilter.org

On Nov 12 Sneppe Filip did spake thusly:

> Aaron Clausen [mailto:maureen-taocow@alberni.net] wrote:
> >
> >I'm running iptables, and have a user claiming that they cannot use MS
> >Messenger.  I have no other complaints, but I'm not exactly sure if any
> >other users are actually using MS Messenger?  Does there have to be special
> >connection tracking.
> >
> 
> Hi Aaron,
> 
> You need a connection tracking helper module if you want to do
> file transfers, as these open random ports. That module has not been
> written yet for netfilter/iptables.
> 
> >
> >I'm also blocking the MS file sharing ports at the router.  Would this cause
> >the problem?
> >
> 
> Well, if you block tcp port 1863, or if you block access to the MSN
> login servers, your clients won't be able to sign in. 1863 Is the port
> were everything except file transfers happen, AFAIK.

I got MSN file transfers working fine by installing "reaim" on my gateway...google for it and you'll find it...it just acts as a gatekeeper and it works
really well as far as I can see :)

-- 
Scott van Looy - email:me@ethosuk.org.uk | web:www.ethosuk.org.uk
PGP Fingerprint: 7180 5543 C6C4 747B 7E74  802C 7CF9 E526 44D9 D4A7
      -------------------------------------------
      |/// /// /// /// WIDE LOAD /// /// /// ///|
      -------------------------------------------

Disco is to music what Etch-A-Sketch is to art.




