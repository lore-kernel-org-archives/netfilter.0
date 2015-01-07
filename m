From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: Transparent proxy requirement
Date: Wed, 07 Jan 2015 22:40:51 +0100
Message-ID: <m8k953$vu2$1@ger.gmane.org>
References: <m768fd$cqt$1@ger.gmane.org> <54AA58A9.10502@ngtech.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <54AA58A9.10502@ngtech.co.il>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Eliezer Croitoru wrote, On 01/05/2015 10:26 AM:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hey,
>
> For the example:
> A client from ip 192.168.0.1 tries to access "serverpgm" which is
> using an tcp based protocol... and has the IP 192.168.0.2.
> Tproxy will not help you since the server needs to understand it and
> since the proxypgm might be able to understand it.. still it cannot
> pass the connection details to the serverpgm which talks plain TCP and
> cannot be modified.

Why is it so?
I just want the same functionality every router device does:
it passes the originating ip, even thru NAT, to the serverpgm.

> What do you need proxypgm to do? it depends on what you need to do...
> Maybe there is some component in the linux kernel which can do what
> you need.

I wanted to write the said proxypgm that does a kind of gateway functionality:
it shall accept the connection, analyse the originating ip and the
protocol hdr data, and finally pass the data to the serverpgm;
ie. play a transparent proxy between the internet client and the serverpgm.


>
> Eliezer

> On 12/21/2014 12:47 PM, U.Mutlu wrote:
>> Hi everybody,
>>
>> I've this scenario: internet <--> proxypgm <--> serverpgm
>>
>> whith these requirements: 1) only ipv4 is used 2) protocol is tcp
>> 3) proxypgm and serverpgm are one the same host (linux with recent
>> kernel) 4) serverpgm is reachable only thru the proxypgm 5)
>> serverpgm needs to know the originating ip:port of the client 6)
>> serverpgm cannot be modified (it does not know of TPROXY or
>> IP_TRANSPARENT socket option etc.) 7) proxypgm needs to be
>> developed (in C/C++)
>>
>> And now the question: Can TPROXY be used for this?
>>
>> Are there other alternatives? What about doing this with raw
>> sockets?
>>
>> Thx


