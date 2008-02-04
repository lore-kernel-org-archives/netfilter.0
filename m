From: RUMI Szabolcs <rumi_ml@rtfm.hu>
Subject: Re: MASQUERADE/SNAT before IPsec
Date: Mon, 4 Feb 2008 12:26:42 +0100
Message-ID: <20080204122642.dbfd94e3.rumi_ml@rtfm.hu>
References: <20080202220014.ab018f1d.rumi_ml@rtfm.hu>
	<BAY103-DAV9E97CD56D54A10E4D90C4B2310@phx.gbl>
	<20080203011009.14cf09ea.rumi_ml@rtfm.hu>
	<BAY103-DAV2B2147898979C3A7FA314B2320@phx.gbl>
	<20080203191923.b146b7ed.rumi_ml@rtfm.hu>
	<BAY103-DAV11310E55CA4ED35DB98CE7B2330@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY103-DAV11310E55CA4ED35DB98CE7B2330@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Marco Berizzi <pupilla@hotmail.com>

On Mon, 4 Feb 2008 10:48:51 +0100
"Marco Berizzi" <pupilla@hotmail.com> wrote:

> RUMI Szabolcs wrote:
> 
> > iptables -t nat -A POSTROUTING -s 10.1.1.0/24 -d 164.99.192.0/22 -j
> SNAT --to-source 164.99.195.8
> 
> > The IP address in --to-source 164.99.195.8  is the one that was
> > dynamically allocated by the remote corporate VPN concentrator
> > (not under my control) at the time I've tested the setup.
> 
> > I cannot make an iproute2 dump because I'm using the oldskool
> 
> which ike/ipsec implementation are you using?

On the kernel level I'm using the one that comes with the 2.6 kernel,
so USAGI I guess.

On the userspace level I'm using ipsec-tools-0.6.3_turnpike which is
a special version maintained by Novell that allows us to use their
proprietary Nortel Contivity binary IPsec plugins which are needed
to connect to the corporate VPN. It is using some nasty non-standard
proprietary authentication mechanism in order to be non-compatible
with free implementations but I doubt that my problem is caused by
this.

http://forge.novell.com/modules/xfcontent/downloads.php/turnpike/ipsec-tools-0.6.3/

> > and goes through iptables and gets NATed in the POSTROUTING
> > chain it goes straight out to eth0 and it does not get
> > reevaluated whether it should be handled by IPsec.
> 
> mhhh which kernel version?

To be exact it's 2.6.22-gentoo-r9 from Gentoo Linux.
You can find patch information here:

http://dev.gentoo.org/~dsd/genpatches/patches-2.6.22-9.htm

Thanks!

Best regards,
Sab
