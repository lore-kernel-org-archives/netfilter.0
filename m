From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPsec & FreeS/WAN
Date: Thu, 4 Jul 2002 19:28:31 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020704182835.BEFN16050.mta01-svc.ntlworld.com@there>
References: <200FAA488DE0D41194F10010B597610D2BA1F6@JUPITER> <20020703191224.LSGV19225.mta07-svc.ntlworld.com@there> <20020704175913.GA27072@willow.seitz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020704175913.GA27072@willow.seitz.com>
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

On Thursday 04 July 2002 6:59 pm, Ross Vandegrift wrote:

> On Wed, Jul 03, 2002 at 08:12:22PM +0100, Antony Stone wrote:

> > What kernel source do you start from ?
>
> I start from a clean, bleeding edge tree in the 2.4 series.  I usually
> apply a few misc patches: Andrew Morton's lowlatency, any available
> reiserfs fixes, sometime and AC series patch.

> Part of the problem was that there wasn't an easy way to just run the
> kernel patching script.  IIRC, the scripts configure FreeS/WAN, and then
> run something like "make config dep clean bzImage modules" in the kernel
> source tree.  I'd much rather do "make patch" in the FreeS/WAN source tree,
> and then be left to my own devices to build the KLIPS kernel.

You should have a quick look at the Makefile for FreeS/WAN.

I've just had a look, and it's rather nicely split up into different sections 
/ modules for doing different bits, and for example, "make menugo" (which is 
the one I normally use) does:
make precheck verset insert
make mcf
make confcheck programs install kernel

Therefore I'm sure you could use this list to start working out which bits 
you'd like to run with the make script and which bits you want to do later on 
by hand...

 

Antony.

