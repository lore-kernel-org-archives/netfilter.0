From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Synflood filtering and Conntrack
Date: Fri, 30 Jul 2010 00:18:30 +0200
Message-ID: <4C51FE36.4000500@chello.at>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5161E2.8020407@chello.at> <alpine.LSU.2.01.1007291315440.2646@obet.zrqbmnf.qr> <4C516687.6060602@chello.at> <4C517559.2030702@plouf.fr.eu.org> <alpine.LSU.2.01.1007291448450.15281@obet.zrqbmnf.qr> <alpine.DEB.2.00.1007291723040.32027@blackhole.kfki.hu>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1007291723040.32027@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

> On Thu, 29 Jul 2010, Jan Engelhardt wrote:

> They are not destroyed on DROP, and you can easily check that.

YOU could have easily check that - arrogant brick!!!

>>>>> 2 minutes it is.

[...]

> Think. -m conntrack --ctstate NEW would not work if the ct only
> sprung into existence once it is confirmed.

Think yourself.

[...]

> Oh we'll all die of earlier arthritis now...

arrogant bs

[...]

>> But the ct entry must undoubtly exist to be able to match -m conntrack
>> --ctstate NEW.
 >> Perhaps it's just that conntrack(8) won't show it?

Now it's the others... of course.


 > On Thu, 29 Jul 2010, Jozsef Kadlecsik wrote:

> I don't see why it looks soo complicated: of course, a ct entry is created
> by conntrack whenever a new connection is detected. And of course the
> entry is destroyed if the packet, which triggered to create the new entry,
> is dropped by a rule. Why should the conntrack entry be kept, if the
> connection is not allowed by the rules?
>
> The new ct entries are kept in the unconfirmed list and only added to the
> conntrack hash iff the entry will be confirmed, that is the entry-creating
> packet won't be dropped by a rule.

roflmao

Jan: shame, shame, shame - shame on you!


Thanks Pascal, Josef


