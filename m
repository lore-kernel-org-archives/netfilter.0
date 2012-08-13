From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Conntrackd issue with bonding
Date: Mon, 13 Aug 2012 11:46:08 +0200
Message-ID: <20120813094608.GA22561@1984>
References: <5024B38E.1060200@cica.es>
 <20120810091927.GB1729@1984>
 <5024DC4E.1080201@cica.es>
 <20120812190548.GA512@1984>
 <5028A96E.7090905@cica.es>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5028A96E.7090905@cica.es>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arturo Borrero <aborrero@cica.es>
Cc: netfilter@vger.kernel.org

On Mon, Aug 13, 2012 at 09:14:54AM +0200, Arturo Borrero wrote:
[...]
> results here (i'm no longer using bond2, but others):
> 
> root@debian:~/git/libnfnetlink/utils# ./iftest bond1
> Cannot translate device idx=13
> root@debian:~/git/libnfnetlink/utils# ./iftest bond0
> Cannot translate device idx=12
> root@debian:~/git/libnfnetlink/utils# ./iftest eth8
> Cannot translate device idx=10
> root@debian:~/git/libnfnetlink/utils# ./iftest eth1
> Cannot translate device idx=9

Still, not useful.

Please, git pull again, run make check, run the test and send me the
results.

I want to make sure you're getting the device flags.
