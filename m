From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: Time based rule change.
Date: Wed, 23 Oct 2002 09:58:10 +1000 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <38899.192.168.7.14.1035331090.squirrel@iw.k1k2.com>
References: <7415BAE16406EA438981D4A98DE0AE357F6CAD@phexch01.silverline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7415BAE16406EA438981D4A98DE0AE357F6CAD@phexch01.silverline.com>
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

> HI,
>     Is there any netfilter extension which allows time based changing
>     of iptables rules. This is because sometimes you need to open up
>     some ports for a fixed period of time and then you forget to remove
>     the rule. A time based rule will automatically delete itself. I
>     realise the security implications, but do they exist ?
> 
> Regards
> -deepak.

Actually, if such a beast existed I would guess it would work
differently.
The Rule would always exist with time attributes and two targets ...
one for when it is available and one for when it isn't.
Anyone want to write one? :-) :-)

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


