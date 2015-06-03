From: "Lukas Hubschmid (s)" <lukas.hubschmid@students.fhnw.ch>
Subject: Re: TCP sequence checking
Date: Wed, 3 Jun 2015 19:52:21 +0200
Message-ID: <556F3ED5.6000205@students.fhnw.ch>
References: <556EFE9A.2020003@students.fhnw.ch> <alpine.DEB.2.10.1506031915590.23917@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.10.1506031915590.23917@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Thank you Jozsef!
I am not quite sure if I read the C-code correctly - so TCP sequence 
checking seems to be enabled by default, right? Or do I need to set some 
flag when adding a rule?

KR,
Lukas

Am 03.06.2015 um 19:16 schrieb Jozsef Kadlecsik:
> On Wed, 3 Jun 2015, Lukas Hubschmid (s) wrote:
>
>> Does iptables support TCP sequence checking, to check if a TCP packet has a
>> valid sequence number (according to previous packets of the same TCP
>> connection)?
> Yes, have a look at net/netfilter/nf_conntrack_proto_tcp.c in the kernel
> source tree.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
>            H-1525 Budapest 114, POB. 49, Hungary

