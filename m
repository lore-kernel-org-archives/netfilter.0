From: Michal Soltys <soltys@ziu.info>
Subject: Re: SFQ hash question
Date: Sun, 13 Sep 2009 00:12:09 +0200
Message-ID: <4AAC1CB9.40806@ziu.info>
References: <0322d4853c39162f0819db9263a210ed@localhost> <4AAA68F6.6020804@ziu.info> <2643b2d5a75307da3d00e97e0245bcf9@localhost> <4AAA70A4.8030707@ziu.info> <ae7bd0d6efc754477dbee35dedeaf6db@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ae7bd0d6efc754477dbee35dedeaf6db@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Julien Vehent <julien@linuxwall.info>
Cc: netfilter <netfilter@vger.kernel.org>

Julien Vehent wrote:
> 
> One theoritical question: imagine I would like to give a hand on the man
> pages, who should I contact?
> 

Well, the maintainer of respective utility/ies + proper devel mailing list. 
Note, that tc, ip, ss - things related to iproute2 in general - belong to netdev, 
not netfilter-devel. Similary user questions about iproute2 -> net, not netfilter. 
AFAIK. Don't remove CC entries either.


As for docs in general, be sure to peek over:


http://www.linuxfoundation.org/en/Net
http://ace-host.stuart.id.au/russell/files/tc/doc/
http://b42.cz/notes/u32_classifier/
http://www.stearns.org/doc/iptables-u32.v0.1.7.html (note that negative offsets don't work though)
http://jengelh.medozas.de/images/nf-packet-flow.png
http://marc.info/?l=lartc&m=117569441229800&w=2 (basic matches)
http://marc.info/?l=linux-netdev&m=120180241422360&w=2 (external hashing, for sfq mainly)
doc subdirectory of iproute2
Documentation[/networking] subdirectory of kernel tree
book: "Understanding Linux Network Internals"
http://www.policyrouting.org/PolicyRoutingBook/ONLINE/TOC.html
http://www.cs.cmu.edu/~istoica/hfsc-tr.ps.gz
  ( depending on gs version, you might need: sed "s|\[FontBBox\]|/FontBBox load |" )
http://www.sonycsl.co.jp/~kjc/software/TIPS.txt (*BSD oriented, still interesting tidbits)


Some of the above will feel pretty heavy.

