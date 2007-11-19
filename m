From: Diego Alencar Alves de Lima <listas@diegolima.org>
Subject: Re: Can't use statistic target on iptables
Date: Mon, 19 Nov 2007 09:15:05 -0200
Message-ID: <1195470908.24616.6.camel@ws-diego.consuldata.lan>
References: <1194877442.16101.13.camel@ws-diego.consuldata.lan>
	 <20071113083828.GA5064@geppetto>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071113083828.GA5064@geppetto>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Stefano Sabatini <stefano.sabatini-lala@poste.it>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

Greetings,

> I got the same problem with Ubuntu, see:
> https://bugs.launchpad.net/ubuntu/+source/iptables/+bug/141436
> 
> Try instead the last SVN version, it should work just fine (if you
> already compiled from source, did you installed it with make
> install?).

I was indeed having that problem with Ubuntu. I didn't try the svn
version, but the lastest stable didn't compile libipt_statistic.so. For
now I am switching to Debian as it seems to work properly. 

Thank you.

-  
Diego Alencar Alves de Lima
Linux User #405564
http://www.diegolima.org



> 
> HTH, regards.

