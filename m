From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset/iptables does not check flags related to a set
Date: Tue, 17 Apr 2012 20:26:32 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1204172016410.25638@blackhole.kfki.hu>
References: <20120417144116.GJ29947@sweethome.fritz.box>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120417144116.GJ29947@sweethome.fritz.box>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herz <andi@geekosphere.org>
Cc: netfilter@vger.kernel.org

On Tue, 17 Apr 2012, Andreas Herz wrote:

> While i'm adding the functionality i would like for ipset/iptables i
> stumbled upon the following issues:
> 
> For example you create a bitmap:ip,mac set "foobar" with range
> 192.168.0.0/24 timeout 3600.
> The first issue is, when you want to add a ip like this:
> 
> > ipset add foobar 192.168.0.1 timeout 7200
> 
> The timeout and the ip is set in the "foobar" set but the timeout stays
> on 7200 and won't go down. The correct way would be:

Please read the ipset manpage.
 
> > ipset add foobar 192.168.0.1,12:34:56:78:90:AB timeout 7200
> 
> then it's working. So the first suggestion is, that ipset the userspace
> program parses the arguments and won't accept just an ip when ip,mac is
> needed.
> 
> So with this in mind, the issue also occurs in iptables:
> 
> > iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SET
> > --add-set foobar src --exist --timeout 600
> 
> or
> 
> > iptables -A INPUT -m set --match-set foobar src -j LOG --log-prefix
> > "foobar set matched: "
> 
> Iptables doesn't complain about "src" although "src,src" would be right.
> 
> Can anyone confirm this?

Yes, that's also required: we have list of sets which can contain 
(sub)sets of different dimensions.

> I could work on this, if the bug/issue is confirmed. Although the
> priority is on the addition and compare-set feature, which is working
> quite well here :)

It'd be really great if you'd justify why such a comparison is a good 
thing.

ipset does not aim to solve every issue.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
