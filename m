From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: SNAT rule on LAN - unexpected result
Date: Mon, 22 Jul 2013 11:01:13 +0530
Message-ID: <51ECC3A1.4050002@atc.tcs.com>
References: <CAODtcdc7X8yJjihVcQomBNuuHGHPLebM2W9SGD_AA62fjwC-cg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAODtcdc7X8yJjihVcQomBNuuHGHPLebM2W9SGD_AA62fjwC-cg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Al Grant <bigal.nz@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On 07/21/2013 02:21 PM, Al Grant wrote:
> Hi All,
>
> Doing a little experimenting with iptables and more specifically SNAT.
>
> I have two computers, a Ubunutu box and a Win7 box with a  switch between them.
>
> On the Ubuntu box (192.168.15.200) I have added:
>
> iptables -t nat -A POSTROUTING -o eth4 -j SNAT --to-source 192.168.15.201
>
>
> Now I run wireshark on the Win7 machine and various bits of broadcast
> traffic which was coming from .200 now shows as from .201 - great!
>
> So I tried a ping from the Win7 machine and would expect a reply to
> show in wireshark, but that the src address be changed to .201 - but
> nope I get a reply from .200. How is this so?
> Conversely a ping from the Ubuntu machine to the win7 machine shows
> the packets with a src of .201 in wireshark - as expected.

I think, this is due to the fact that 'nat' table will be consulted only 
for new connections. Unlike ping request, the ping *reply* may not be 
considered as part of a new connection.


Regards,
Vignesh
