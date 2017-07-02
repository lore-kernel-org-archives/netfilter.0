From: Robert White <rwhite@pobox.com>
Subject: Re: Full NAT forward and source routing - possible without packet
 marking?
Date: Sun, 2 Jul 2017 10:33:33 +0000
Message-ID: <f3f547d7-738a-b01e-3dd1-0cc914043e79@pobox.com>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <520045a0-9f63-04f0-cd4e-7c791762401b@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <520045a0-9f63-04f0-cd4e-7c791762401b@plouf.fr.eu.org>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On 07/02/2017 07:29 AM, Pascal Hambourg wrote:
> Le 01/07/2017 =E0 22:26, Robert White a =E9crit :
> I think you missed the point and focused on an irrelevant detail in the
> OP. This topic is about advanced routing.

Read the OP again. Traffic is coming in on ppp0, hitting a server
hanging off eth1, and then the replies are supposed to go back to eth1
and go out on ppp0.

There is literally no simpler task in DNAT.

This was not an "advanced routing" question, this was an "introduction
to DNAT" level question.

It is a mistake to assume that simple questions are complex.

OP needed to be shown that he was "overthinking" his rules. ZRM and I
discussed hairpin nat in a later fragment of the conversation that
almost certainly didn't help Mr. Kaurstad in the slightest.
