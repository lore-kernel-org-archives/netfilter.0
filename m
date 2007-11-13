From: Stefano Sabatini <stefano.sabatini-lala@poste.it>
Subject: Re: Can't use statistic target on iptables
Date: Tue, 13 Nov 2007 09:38:28 +0100
Message-ID: <20071113083828.GA5064@geppetto>
References: <1194877442.16101.13.camel@ws-diego.consuldata.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1194877442.16101.13.camel@ws-diego.consuldata.lan>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

On date Monday 2007-11-12 12:23:59 -0200, Diego Alencar Alves de Lima wrote:
> Greetings,
> 
> I am trying to use the "random" and "nth" methods on iptables. I have
> already compiled and loaded the xt_statistic kernel module but I can't
> figure out how to compile the statistic iptables object. I have compiled
> from v1.3.8 source and I get the following message:
> 
> iptables v1.3.8: Couldn't load match
> `statistic':/usr/local/lib/iptables/libipt_statistic.so: cannot open
> shared object file: No such file or directory
> 
> Do I have do add any parameter when I compile iptables to enable
> statistic?

Hi Diego,

I got the same problem with Ubuntu, see:
https://bugs.launchpad.net/ubuntu/+source/iptables/+bug/141436

Try instead the last SVN version, it should work just fine (if you
already compiled from source, did you installed it with make
install?).

HTH, regards.
-- 
Stefano Sabatini
Linux user number 337176 (see http://counter.li.org)
