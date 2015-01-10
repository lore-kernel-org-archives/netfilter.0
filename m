From: Eliezer Croitoru <eliezer@ngtech.co.il>
Subject: Re: Transparent proxy requirement
Date: Sat, 10 Jan 2015 19:37:35 +0200
Message-ID: <54B1635F.5040101@ngtech.co.il>
References: <m768fd$cqt$1@ger.gmane.org> <54AA58A9.10502@ngtech.co.il> <m8k953$vu2$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <m8k953$vu2$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: "U.Mutlu" <for-gmane@mutluit.com>

Hey,

To understand what you are talking about you need to understand the 
specific case you are talking about.
Since the destination software doesn't know a thing about tproxy the 
only way that it can receive a packet would be either a full blown proxy 
between it and the internet.. which would in many case be weird...
Or some other solutions.
If you will do what you seek using two different OS stacks(IE two 
servers) which one is the default GW for the other you would be able to 
do so and there is a way to do it with haproxy if I remember right.

You main issue\demand is that these two pieces of software will sit on 
the same machine.
In this specific case you cannot use tproxy since there are issues with 
that.
You can try.... And see the result your self.
If something was changed in tproxy since the last time I have used and 
analyzed it.. it would be possible.

All The Bests,
Eliezer

On 07/01/2015 23:40, U.Mutlu wrote:
> Eliezer Croitoru wrote, On 01/05/2015 10:26 AM:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hey,
>>
>> For the example:
>> A client from ip 192.168.0.1 tries to access "serverpgm" which is
>> using an tcp based protocol... and has the IP 192.168.0.2.
>> Tproxy will not help you since the server needs to understand it and
>> since the proxypgm might be able to understand it.. still it cannot
>> pass the connection details to the serverpgm which talks plain TCP and
>> cannot be modified.
>
> Why is it so?
> I just want the same functionality every router device does:
> it passes the originating ip, even thru NAT, to the serverpgm.
>
>> What do you need proxypgm to do? it depends on what you need to do...
>> Maybe there is some component in the linux kernel which can do what
>> you need.
>
> I wanted to write the said proxypgm that does a kind of gateway
> functionality:
> it shall accept the connection, analyse the originating ip and the
> protocol hdr data, and finally pass the data to the serverpgm;
> ie. play a transparent proxy between the internet client and the serverpgm.


