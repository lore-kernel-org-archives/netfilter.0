From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Possible IPTables bug in INPUT interface filtering?
Date: Thu, 22 Apr 2010 00:10:37 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004220004040.2067@obet.zrqbmnf.qr>
References: <p2l464fbb2d1004152012p719184c9g57ac7c7562994929@mail.gmail.com>  <t2p186ebf761004211127k7512fb29r5b4873627925fece@mail.gmail.com> <j2h56378e321004211430xc2912428wab13e04f016b4f2d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <j2h56378e321004211430xc2912428wab13e04f016b4f2d@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Horton <arimus.uk@googlemail.com>
Cc: Narendra Choyal <narendrachoyal@gmail.com>, John Engelke <john.engelke@gmail.com>, netfilter@vger.kernel.org

On Wednesday 2010-04-21 23:30, Richard Horton wrote:

>On 21 April 2010 19:27, Narendra Choyal <narendrachoyal@gmail.com> wrote:
>
>> NOTE :
>> -i also not work when we have two virtual IPs like eth0 and eth0:1 .
>> In this case first rule will be applied whatever the interface is
>> written i.e eth0 or eth0:1 .
>
>Might be totally off base but have vague memories that the virtual
>interface can't be filtered using -i / -o.

Because they are _NOT_ interfaces. Please, stop using tools like 
ifconfig. Their ioctls don't deal with multiple addresses and thus use 
fugly hacks like making up interfaces that are not really there and 
confusing the hell outta users.
(Use iproute2 instead.)
