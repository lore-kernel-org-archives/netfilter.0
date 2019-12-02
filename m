From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [ANNOUNCE] ebtables 2.0.11 release
Date: Mon, 2 Dec 2019 22:25:28 +0100
Message-ID: <20191202212528.q4bqd5dlbt7vix5b@salvia>
References: <20191202153356.xowrrxn26jlm5v4f@salvia>
 <nycvar.YFH.7.76.1912022027520.18991@n3.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.1912022027520.18991@n3.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net

On Mon, Dec 02, 2019 at 08:30:25PM +0100, Jan Engelhardt wrote:
> On Monday 2019-12-02 16:33, Pablo Neira Ayuso wrote:
> 
> >You can download it from:
> >
> >ftp://ftp.netfilter.org/pub/ebtables/
> 
> There is a file called ebtables-2.0.11.tar.bz2 in there, but this is 
> actually a gz encoded object. (This confuses rpmbuild, which tries 
> to `bzip2 -d` it.)

Just fixed this, thanks for reporting.

> (Isn't it time to do xz or zstd anyway?)

For the sake of saving bits over the wire, yes. Next time.
