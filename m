From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: Compiling conntrack-tools
Date: Wed, 18 Jan 2012 17:27:39 +0100
Message-ID: <1326904059.2646.25.camel@ns014530.dcyb.net>
References: <1326902665.2646.20.camel@ns014530.dcyb.net>
	 <alpine.LNX.2.01.1201181713170.32001@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1201181713170.32001@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

On Wed, 2012-01-18 at 17:15 +0100, Jan Engelhardt wrote:
> On Wednesday 2012-01-18 17:04, Rob Sterenborg (lists) wrote:
> >
> >I'm using the following to configure conntrack-tools:
> >
> ># export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
> ># LIBNFNETLINK_CFLAGS="-I/usr/local/include" \
> >LIBNFNETLINK_LIBS="-L/usr/local/lib" \
> >LIBNETFILTER_CONNTRACK_CFLAGS="-I/usr/local/include" \
> >LIBNETFILTER_CONNTRACK_LIBS="-L/usr/local/lib" \
> >./configure --prefix=/usr/local
> 
> You are not specifying any libs in _LIBS to actually link in
> into ./conntrack. Hence, the missing symbol reference:
> 
> >  CCLD   conntrack
> >conntrack.o: In function `alloc_tmpl_objects':
> >conntrack.c:(.text+0x71): undefined reference to `nfct_new'

Thanks!! It works..


--
Rob


