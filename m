From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Full NAT forward and source routing - possible without packet
 marking?
Date: Sun, 2 Jul 2017 13:19:48 +0200
Message-ID: <f297920c-6ca4-d912-a870-099c24674bcc@plouf.fr.eu.org>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <520045a0-9f63-04f0-cd4e-7c791762401b@plouf.fr.eu.org>
 <f3f547d7-738a-b01e-3dd1-0cc914043e79@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f3f547d7-738a-b01e-3dd1-0cc914043e79@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Robert White <rwhite@pobox.com>
Cc: netfilter@vger.kernel.org

Le 02/07/2017 =E0 12:33, Robert White a =E9crit :
> On 07/02/2017 07:29 AM, Pascal Hambourg wrote:
>> Le 01/07/2017 =E0 22:26, Robert White a =E9crit :
>> I think you missed the point and focused on an irrelevant detail in the
>> OP. This topic is about advanced routing.
>
> Read the OP again. Traffic is coming in on ppp0, hitting a server
> hanging off eth1, and then the replies are supposed to go back to eth1
> and go out on ppp0.
>
> There is literally no simpler task in DNAT.
>
> This was not an "advanced routing" question, this was an "introduction
> to DNAT" level question.

Again, you missed the important point : reply packets must go out=20
through ppp0 but the default route is through eth0, not ppp0. Without=20
advanced routing, reply packets will go out through eth0.
