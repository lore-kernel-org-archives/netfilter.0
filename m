From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Conntrackd issue with bonding
Date: Sun, 12 Aug 2012 21:05:48 +0200
Message-ID: <20120812190548.GA512@1984>
References: <5024B38E.1060200@cica.es>
 <20120810091927.GB1729@1984>
 <5024DC4E.1080201@cica.es>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5024DC4E.1080201@cica.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero <aborrero@cica.es>
Cc: netfilter@vger.kernel.org

On Fri, Aug 10, 2012 at 12:02:54PM +0200, Arturo Borrero wrote:
[...]
> >Somoething is wrong with the link state checking.
> >
> >Please, get a working copy of libnfnetlink:
> >
> >git clone git://git.netfilter.org/libnfnetlink
> >autoreconf -fi
> >./configure --prefix=/usr
> >make
> >make check
> >
> >[no need to make install]
> >
> >Then go to utils/ directory, run ./iftest and get back to the list to
> >report what it says.
> >
[...]
> This is the result of iftest:
> 
> root@debian:~/git/libnfnetlink/utils# ./iftest
> index (1) is lo (RUNNING) (UP)
> index (2) is eth5 (NOT RUNNING) (DOWN)
> index (3) is eth2 (RUNNING) (UP)

Hm, not very useful sorry :-(

Please, git pull and run make check again. Then, run:

./iftest bond2

to obtain the device flags. Compare that output to that of `ip link'.

I want to make sure there's no problem with obtaining the device
flags.
