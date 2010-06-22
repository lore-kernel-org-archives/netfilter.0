From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: problem getting uid in nfqueue
Date: Tue, 22 Jun 2010 10:45:31 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006221042480.13935@obet.zrqbmnf.qr>
References: <1624629744.165291276781877065.JavaMail.root@zimbra6-e1.priv.proxad.net> <4C1FD0EC.6000302@free.fr> <alpine.LSU.2.01.1006221003230.13935@obet.zrqbmnf.qr> <4C2071CC.60300@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C2071CC.60300@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Beluc <beluc.mailing@free.fr>, netfilter@vger.kernel.org

On Tuesday 2010-06-22 10:18, Patrick McHardy wrote:
>>  
>>> no idea ? maybe i didn't explain very well :/
>>>
>>> i saw that when using LOG target in OUTPUT policy, there is the user's uid
>>> who
>>> send packet.
>>
>> That is not the user's uid, but the uid of the socket's creator.
>
> Filtering based on UID is best done using the owner match.

The owner match, too, uses the socket's creator ;-)
In most cases that is sufficient, but _real_ filtering by UID needs to 
be done by things like snet LSM.

> nfnetlink_queue
> currently doesn't supply the UID/GID, but it could be added easily.

http://bugzilla.netfilter.org/show_bug.cgi?id=600
patch has been lingering there for long.
