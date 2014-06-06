From: Nicolas RENAULT <nicolas_renault@yahoo.fr>
Subject: Re: conntrackd crash after few seconds
Date: Fri, 06 Jun 2014 09:49:39 +0200
Message-ID: <53917293.6010705@yahoo.fr>
References: <53908A7E.4020802@yahoo.fr> <20140605154944.GA29302@finrod> <CAOkSjBifDQQNNQJbkdraYxNvStvK9CrWRNO7LtawpJJ5n=cTMg@mail.gmail.com> <20140605160639.GB29302@finrod>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s1024; t=1402040983; bh=hVQIIPF6mGCryO8aCxvSvJi7gCqJnBKzMPnunOjDQf0=; h=Received:Received:Received:DKIM-Signature:X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:X-Rocket-Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=5H6geoleo/NiHIxtLGRpKOg6PmJMFCzTa5eMAlOc5lkPd6Ddv7hJKdMWOKT0zvBl0+3nv5IOxrvLCDb7FJWQRWecd35f9PTOcye9Yrh493sORfX1QvJP02Ayg6OqQkpnJqVPFCkiV0syVHChCUoEFlVkavlWoEB0HYIgP18wLYQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s1024; t=1402040983; bh=hVQIIPF6mGCryO8aCxvSvJi7gCqJnBKzMPnunOjDQf0=; h=X-Yahoo-Newman-Id:X-Yahoo-Newman-Property:X-YMail-OSG:X-Yahoo-SMTP:X-Rocket-Received:Message-ID:Date:From:User-Agent:MIME-Version:To:Subject:References:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=NsDcT/+xfAJjw2u5X4uahEqSaiEUdByF6P4nqUjyDnKHyujlBCb3i/xfGaoqJ0TV5lQ/9JyVuKpoWrjI1gWvNMQk1AeeLB6QES+PMJuzkTjN5f4NQSDrro5x/jOcaALMBJ0cO6NAKF3atJMgjko8dfhml6D2aW6DFv9/hVrTgPk=
In-Reply-To: <20140605160639.GB29302@finrod>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Le 05/06/2014 18:06, Martin Kraus a =E9crit :
> On Thu, Jun 05, 2014 at 05:59:19PM +0200, Arturo Borrero Gonzalez wro=
te:
>> On 5 June 2014 17:49, Martin Kraus <lists_mk@wujiman.net> wrote:
>>
>>> On Thu, Jun 05, 2014 at 05:19:26PM +0200, Nicolas RENAULT wrote:
>>>> informations :
>>>>
>>>> debian wheezy     3.2.0-4-amd64 #1 SMP Debian 3.2.57-3+deb7u2 x86_=
64
>>> Hi.
>>>
>>> We had crashes on debian wheezy which were solved by upgrade to
>>>
>>> linux-image-3.13-0.bpo.1-amd64
>>>
>>
>> Is this the same as the Debian bug #746464 [0]?
> probably not. we hit a kernel panic and when I redirected kernel cons=
ole to
> the serial port for another run it showed that there was a stalled cp=
u core running
> conntrackd process and everything was just dead.
>
> mk
Hi,

thanks for the reply.

some more informations :

I don't have kernel panic and so on , as i say in the first post it's=20
just conntrackd that stop running after about 10 secondes. no message i=
n=20
syslog or messages or deamon.log or conntrackd.log....

I use conntrackd but i'm not a specialist so when i say that a try to=20
run it with

conntrackd -C /etc/conntrackd/conntrackd.conf         i'm right ?

on the firt post my conntrackd.conf is good or not ?  perhaps i made a=20
mistake on the buffer size or thinks like that ?

I will try to update to  linux-image-3.13-0.bpo.1-amd64 but i hope that=
=20
it will not broke others thinks :)

regards

--=20
Nicolas

