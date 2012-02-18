From: "Rob Sterenborg (Lists)" <lists@sterenborg.info>
Subject: Re: Compiling conntrack-tools
Date: Sat, 18 Feb 2012 12:10:01 +0100
Message-ID: <1329563401.2540.23.camel@kushiel.sterenborg.info>
References: <1326902665.2646.20.camel@ns014530.dcyb.net>
	  <alpine.LNX.2.01.1201181713170.32001@frira.zrqbmnf.qr>
	 <1326904059.2646.25.camel@ns014530.dcyb.net>
	 <loom.20120218T095118-20@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20120218T095118-20@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@vger.kernel.org>

On Sat, 2012-02-18 at 08:51 +0000, ping wrote:
> Hello,
> 
> I have the same problem. 
> Could you point me how to solve the problem? 
> Thank you so much. 
> 
> specifying any libs in _LIBS to actually 
> link in into ./conntrack. <-- what can I do ?

Did you set PKG_CONFIG_PATH when using configuring conntrack-tools?
Something like:

PKG_CONFIG_PATH=/path/to/lib/pkgconfig \
./configure ...

Where /path/to/lib/pkgconfig is the pkgconfig directory where the
libnfnetlink and libnetfilter_conntrack .pc files are installed. (You
did install these libraries, right?)
This way the correct CFLAGS, LDFLAGS and LIBS will be set automatically.


--
Rob


