From: "Bradley Kite" <bradley.kite@gmail.com>
Subject: Re: NAT for multiple non-directly connected subnets
Date: Fri, 9 Nov 2007 15:42:32 +0000
Message-ID: <e97f32c10711090742h45794a40me7207df8d0d98473@mail.gmail.com>
References: <e97f32c10711081353t5602912fr560386581cd39c7@mail.gmail.com>
	 <1194559495.19115.105.camel@grateful.d.umn.edu>
	 <e97f32c10711081417s19405b28p39cdf353ac2731cb@mail.gmail.com>
	 <1194560755.19115.110.camel@grateful.d.umn.edu>
	 <e97f32c10711081434p52358fbcs6a22619fba121bb9@mail.gmail.com>
	 <e97f32c10711090243m277b0bfcyc9e0015780c210f5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=aANyH/T1dmgMs7ReWuFm7h4BfjIFAcOMSdz9o0ePork=;
        b=HsNyzFtmPYE1a9d8r9DG67j+dZ0w8omBDnsfvi3M0KYch9LYREFP/+f/XrYE/6Fxf4GZYtZ6wzFXjQ2FzzEomBxQAV73mTIbpkqH2DxkVN4X0CV4Z2GI8MyrpeDJak1XlwNDH1XJKrpkTSmZKDVL7O1a1yspDCwu3rxIqmp4zhA=
In-Reply-To: <e97f32c10711090243m277b0bfcyc9e0015780c210f5@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 09/11/2007, Bradley Kite <bradley.kite@gmail.com> wrote:
> On 08/11/2007, Bradley Kite <bradley.kite@gmail.com> wrote:
> > On 08/11/2007, Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
> > >
> > > On Thu, 2007-11-08 at 22:17 +0000, Bradley Kite wrote:
> > > > On 08/11/2007, Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
> > >
> [snip]
> >
> > I tried this with the same results I'm afraid. If I cannot get this
> > working then I'll have to make the upstream router do NAT too so that
> > the entire network is seen from the address of the up-stream router -
> > as Linux is NATing that address without problems.
> >
> > Or maybe I'll try a kernel upgrade to see if that makes any difference.
>
> Hmm. I've tried also with the latest kernel (2.6.23) but I still have
> the same problem.
>
> Has any body else managed to get something like this working before?
>

Just in case any body else has this problem, I have found the solution
so thought I would share:

I am actually running a virtual network within my linux machine for
testing/studying. This means that as packets leave the various routers
within my virtual network, they are seen by the IP-Tables because of
the bridges I have set up to connect the virtual routers.

the connection-tracking needs to be turned off on the bridges in order
to make this work:

iptables --table raw -A PREROUTING -i [BRIDGE] -j NOTRACK

this then allows the packet to correctly enter the POSTROUTING table
once it eventually gets to the NAT interface on the same linux device.

Hopefully somebody else will find this useful.
--
Brad.
