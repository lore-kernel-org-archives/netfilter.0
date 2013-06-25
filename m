From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset hash:ip,port not matching
Date: Tue, 25 Jun 2013 11:30:27 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1306251123010.12575@blackhole.kfki.hu>
References: <51C9371E.8020305@logix.net.nz> <alpine.DEB.2.00.1306250937500.12575@blackhole.kfki.hu> <51C95D77.9060405@logix.net.nz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51C95D77.9060405@logix.net.nz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ludvig <mludvig@logix.net.nz>
Cc: netfilter@vger.kernel.org

On Tue, 25 Jun 2013, Michael Ludvig wrote:

> On 25/06/13 19:40, Jozsef Kadlecsik wrote:
> > On Tue, 25 Jun 2013, Michael Ludvig wrote:
> >
> >> ~ # iptables -I INPUT -m set --match-set test-ipport dst -j LOG
> >> --log-prefix "IPSET(test-ipport,dst): "
> >> ~ # iptables -I INPUT -m set --match-set test-ipport src -j LOG
> >> --log-prefix "IPSET(test-ipport,src): "
> > In the rules above you specified a single direction flag for a two 
> > dimensional set, thus the matching returned "false". If in the first rule 
> > the port is the destination, then it should be:
> >
> > iptables -I INPUT -m set --match-set test-ipport dst,dst -j LOG ...
> 
> Thanks! I didn't know I'm supposed to specify the direction for each
> dimension of the set. That actually makes it quite flexible.
> 
> Is it possible to make iptables fail when there are not enough src's and
> dst's in the command? To let users know there's something wrong.

The set match and target check the existence of the set only, and don't 
verify the dimension of the set and the number of the direction flags. 
This is due to the list set type: in that case the direction flags are 
passed to the members, which may change runtime anytime.

The match and target could verify the directions for other set types, 
though. It'd need a protocol change because the required information is 
not passed in either direction at checking time.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
