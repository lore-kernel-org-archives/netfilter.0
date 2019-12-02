From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [ANNOUNCE] ebtables 2.0.11 release
Date: Mon, 2 Dec 2019 20:30:25 +0100 (CET)
Message-ID: <nycvar.YFH.7.76.1912022027520.18991@n3.vanv.qr>
References: <20191202153356.xowrrxn26jlm5v4f@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20191202153356.xowrrxn26jlm5v4f@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net

On Monday 2019-12-02 16:33, Pablo Neira Ayuso wrote:

>You can download it from:
>
>ftp://ftp.netfilter.org/pub/ebtables/

There is a file called ebtables-2.0.11.tar.bz2 in there, but this is 
actually a gz encoded object. (This confuses rpmbuild, which tries 
to `bzip2 -d` it.)

(Isn't it time to do xz or zstd anyway?)
