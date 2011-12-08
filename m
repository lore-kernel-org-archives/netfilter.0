From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: What happens after PREROUTING/nat ?
Date: Thu, 08 Dec 2011 14:58:15 +0100
Message-ID: <4EE0C277.8030909@freemail.hu>
References: <4EDFA920.4040804@freemail.hu> <3132035.exjJScDA16@alaris>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3132035.exjJScDA16@alaris>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-2?Q?Michal_Kube=E8ek?= <mkubecek@suse.cz>, netfilter list <netfilter@vger.kernel.org>

Hi,

Thank you for your response, but... :D


2011-12-08 09:55 keltez=E9ssel, Michal Kube=E8ek =EDrta:
> On Wednesday 07 of December 2011 18:57EN, G=E1sp=E1r Lajos wrote:
>> But if "C" is in the LAN then the packets are simply disappearing...
> They are not. If you monitor the LAN traffic, you should notice that =
the
> problem is not the redirected packet but the reply from B to C. Becau=
se
I know about this problem and I have the required SNAT rules too...
And as I wrote the packets did not hit the line... (After C->A there wa=
s=20
no A->B.... because of a missing PROMISC flag on the bridge...)

> 3. When translating the destination address from A to B for packets
> coming from LAN, translate source address as well ("masquerade"). The=
n
> the reply will go back to A and it will translate both source and
> destination address. Awful? Definitely, but this is where all those
> masquerades got us...
This is what I got... And it is working now... See my other post...

Thank you ! :D

Swifty
