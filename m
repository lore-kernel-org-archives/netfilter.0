From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: iptables1.2.7 + pptp + rh9
Date: Wed, 22 Oct 2003 21:55:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031022215549.4b028338.arnt@c2i.net>
References: <7C9884991ADAE0479C14F10C858BCDF52E375B@alderaan.smgtec.com>
	<6.0.0.22.0.20031021210350.01b66818@pop3.uol.com.br>
	<009501c39837$e1883850$2800a8c0@karu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009501c39837$e1883850$2800a8c0@karu>
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

On Wed, 22 Oct 2003 06:30:13 +0530, 
"Venkatesh. K" <venkatesh@cbayscribe.com> wrote in message 
<009501c39837$e1883850$2800a8c0@karu>:

> ----- Original Message ----- 
> From: "Fernando Barrocal" <fbarrocal@uol.com.br>
> To: "Daniel Chemko" <dchemko@smgtec.com>;
> <netfilter@lists.netfilter.org> Sent: Wednesday, October 22, 2003 4:35
> AM Subject: RE: iptables1.2.7 + pptp + rh9
> 
> 
> >
> > Let me ask another question ... a newbie one ...
> >
> > Is that order correct ?
> >
> > - apply pptp patch
> > - compile iptables
> > - compile kernel (config, dep, clean, image, modules)
> >
> 
> Apply patch
> Compile Kernel

..ahem; compile kernel (config, dep, clean,  modules, image)

> Compile IPtables

..was also possible possible to apply the pptp patch woih the 
"kernelmod" package from poptop.sf.net, last time I checked.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



