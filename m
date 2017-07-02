From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Full NAT forward and source routing - possible without packet
 marking?
Date: Sun, 2 Jul 2017 19:10:34 +0200
Message-ID: <a7ef1ff2-4bd7-1f56-c127-e8f30ea05952@plouf.fr.eu.org>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <520045a0-9f63-04f0-cd4e-7c791762401b@plouf.fr.eu.org>
 <f3f547d7-738a-b01e-3dd1-0cc914043e79@pobox.com>
 <f297920c-6ca4-d912-a870-099c24674bcc@plouf.fr.eu.org>
 <e5a4184c-19db-7d36-f247-7e7bfe235e50@dynator.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <e5a4184c-19db-7d36-f247-7e7bfe235e50@dynator.no>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: oyvind@dynator.no, netfilter@vger.kernel.org

Le 02/07/2017 =E0 17:58, =D8yvind Kaurstad a =E9crit :
>
> Not sure if this clarified anything

There was no need to clarify anything to me. Your original post was=20
clear enough, except the reason for the internal SNAT that you explained=20
but which is irrelevant, as you mentionned. However, hopefully that will=20
help other readers concentrate on the real issue.

> but it still seems to me I need to leverage the connection tracking
> with packet marking to be able to ensure the reply packets that should
> go back out a non-default route actually does that.

I'm afraid so, unless you can add a second IP address to the target device.
