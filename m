From: Patrick McHardy <kaber@trash.net>
Subject: Re: problem getting uid in nfqueue
Date: Tue, 22 Jun 2010 10:18:20 +0200
Message-ID: <4C2071CC.60300@trash.net>
References: <1624629744.165291276781877065.JavaMail.root@zimbra6-e1.priv.proxad.net> <4C1FD0EC.6000302@free.fr> <alpine.LSU.2.01.1006221003230.13935@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1006221003230.13935@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Beluc <beluc.mailing@free.fr>, netfilter@vger.kernel.org

Jan Engelhardt wrote:
> On Monday 2010-06-21 22:51, Beluc wrote:
>
>   
>> no idea ? maybe i didn't explain very well :/
>>
>> i saw that when using LOG target in OUTPUT policy, there is the user's uid who
>> send packet.
>>     
>
> That is not the user's uid, but the uid of the socket's creator.


Filtering based on UID is best done using the owner match. nfnetlink_queue
currently doesn't supply the UID/GID, but it could be added easily.
