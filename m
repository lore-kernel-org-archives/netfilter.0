From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Brouter basic question .
Date: Tue, 30 Mar 2010 16:47:20 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1003301642380.19967@obet.zrqbmnf.qr>
References: <cfeab66d1003300601l140102e0nd8111713140044b5@mail.gmail.com> <4BB20922.20704@unipex.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BB20922.20704@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michele Petrazzo - Unipex <michele.petrazzo@unipex.it>
Cc: ratheesh k <ratheesh.ksz@gmail.com>, netfilter@vger.kernel.org

On Tuesday 2010-03-30 16:22, Michele Petrazzo - Unipex wrote:

> ratheesh k ha scritto:
>> Hi ,
>>
>>  i have a rule
>>
>>            ebtables -t broute -A BROUTING -j ACCEPT .
>>
>> So packet wont traverse any other chain ?  ( Prerouting , Input ,
>> Forward , Postrouting ) ???
>>
>
> http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html
>
> And
>
> http://ebtables.sourceforge.net/br_fw_ia/PacketFlow.png
>
> broute and iptables chains are different things.

These graphics are outdated. Please see the one from
http://en.wikipedia.org/wiki/Iptables  instead (which represents modern 
kernels).
