From: Rickard Eriksson <riceri@home.se>
Subject: Re: PPTP
Date: Wed, 09 Oct 2002 17:31:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DA44BCF.5020900@home.se>
References: <E131E9F1848D0148813EAF06A846608F615F6F@w2ks-e2k.iconos.be>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sneppe Filip <Filip.Sneppe@cronos.be>, netfilter@lists.netfilter.org

Sneppe Filip wrote:

> Rickard,
>
> >When i try to install the pptp-conntrack module i get this error:
> >
> >Testing patch extra/pptp-conntrack-nat.patch...
> >    Placed new Config.in line
> >    Placed new Configure.help entry
> >    Placed new Makefile line
> >    Placed new Makefile line
> >    Placed new ip_conntrack.h line
> >    Placed new ip_conntrack.h line
> >Could not find place to slot in ip_conntrack.h line
> >Could not find place to slot in ip_conntrack.h line
> >Could not find place to slot in ip_conntrack.h line
> >Could not find place to slot in ip_conntrack.h line
> >Could not find place to slot in ip_conntrack.h line
> >Could not find place to slot in ip_conntrack.h line
> >TEST FAILED: patch NOT applied.
> >
> >
> >anyone know whats wrong?
>
> You *are* applying this to a kernel with newnat support, aren't you ?
>
> Regards,
> Filip
>
The z-newnet patch? I can't install that patch.

BTW, this is the first time i am patching a kernel.

/Rickard



