From: Bart De Schuymer <bdschuym@pandora.be>
Subject: Re: iptables - bridge - physin
Date: Tue, 1 Apr 2003 18:30:10 +0200
Sender: bridge-admin@math.leidenuniv.nl
Message-ID: <200304011830.10528.bdschuym@pandora.be>
References: <D3DD55FDB74AD511BA51005004163680176597@orion.ibh.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <bridge-admin@math.leidenuniv.nl>
In-Reply-To: <D3DD55FDB74AD511BA51005004163680176597@orion.ibh.de>
Errors-To: bridge-admin@math.leidenuniv.nl
List-Unsubscribe: <http://www.math.leidenuniv.nl/mailman/listinfo/bridge>,
	<mailto:bridge-request@math.leidenuniv.nl?subject=unsubscribe>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:bridge@math.leidenuniv.nl>
List-Help: <mailto:bridge-request@math.leidenuniv.nl?subject=help>
List-Subscribe: <http://www.math.leidenuniv.nl/mailman/listinfo/bridge>,
	<mailto:bridge-request@math.leidenuniv.nl?subject=subscribe>
List-Archive: <http://www.math.leidenuniv.nl/pipermail/bridge/>
Content-Type: text/plain; charset="us-ascii"
To: Jochen Vogel <jvogel@it-sec.de>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>, "'bridge@math.leidenuniv.nl'" <bridge@math.leidenuniv.nl>

On Tuesday 01 April 2003 12:18, Jochen Vogel wrote:
> hi all,
>
> i compiled iptables and teh bridge patch.
> all is working fine. but in my old iptables script i configured many rules
> with -i and -o.
> in the logs i can see, that iptables use as IN and OUT the bridge and have
> an additional entry for PHYSIN.
> is there an option to use the PHYSIN?

In the 2.4 patch you can just use -i and -o, for the 2.5 standard kernel, you 
need to use the ipt_physdev module (the kernel module is in the standard 2.5 
kernel, the userspace module is in the iptables CVS (standard make is 
enough)).

-- 
cheers,
Bart
