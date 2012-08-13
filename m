From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Conntrackd issue with bonding
Date: Mon, 13 Aug 2012 20:01:06 +0200
Message-ID: <20120813180106.GA23002@1984>
References: <5024B38E.1060200@cica.es>
 <20120810091927.GB1729@1984>
 <5024DC4E.1080201@cica.es>
 <20120812190548.GA512@1984>
 <5028A96E.7090905@cica.es>
 <20120813094608.GA22561@1984>
 <alpine.LNX.2.01.1208131214450.27005@frira.zrqbmnf.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.01.1208131214450.27005@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: Arturo Borrero <aborrero@cica.es>, netfilter@vger.kernel.org

On Mon, Aug 13, 2012 at 12:35:21PM +0200, Jan Engelhardt wrote:
> 
> On Monday 2012-08-13 11:46, Pablo Neira Ayuso wrote:
> >
> >Please, git pull again, run make check, run the test and send me the
> >results.
> 
> The problem is that nlif_receive is only called once by nlif_catch,
> and ignores RTM_F_MULTI, therefore missing most interfaces.

Thanks Jan. That was indeed the problem.

I have committed the fix for this issue:

http://git.netfilter.org/cgi-bin/gitweb.cgi?p=libnfnetlink.git;a=commit;h=8b15e485c0d5f4a1e56b2148a34995ed1fa9e95b

@Arturo: Please, install a fresh working copy of libnfnetlink and let
me know if the problem persists.

Before that, check that ./iftest bond1 displays valid device
information.
