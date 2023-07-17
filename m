From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [ANNOUNCE] libnftnl 1.2.6 release
Date: Mon, 17 Jul 2023 12:20:36 +0200 (CEST)
Message-ID: <p722n04o-80pp-6573-r832-621610s2r749@vanv.qr>
References: <ZK2KUlzZzlQ8/mKa@calendula> <36852014-p9pp-srp2-pn24-orr4385p70qo@vanv.qr> <ZLUHo/spWd98PMUS@calendula>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <ZLUHo/spWd98PMUS@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org, netfilter-announce@lists.netfilter.org, lwn@lwn.net, guigom@riseup.net


On Monday 2023-07-17 11:19, Pablo Neira Ayuso wrote:
>On Mon, Jul 17, 2023 at 10:09:09AM +0200, Jan Engelhardt wrote:
>> 
>> On Tuesday 2023-07-11 18:58, Pablo Neira Ayuso wrote:
>> >The Netfilter project proudly presents:
>> >        libnftnl 1.2.6
>> 
>> Something is off here.
>> With 1.2.5 I had:
>> 
>> /usr/lib/python3.11/site-packages/nftables
>> /usr/lib/python3.11/site-packages/nftables/__init__.py
>> 
>> With 1.2.6 I get:
>> 
>> /usr/lib/python3.11/site-packages/nftables-0.1-py3.11.egg/nftables/__init__.py
>
>Could you revert:
>1acc2fd48c75 ("py: replace distutils with setuptools")
>I suspect the problem is in the update from distutil to setuptools.

Revert alone is not enough; a removal of python3-setuptools from the
buildroot is also needed to restore the previous structure, which
suggests there is an autoforwarding mechanism in python :(
