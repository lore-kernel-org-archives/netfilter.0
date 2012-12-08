From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: iptable rule to change incoming interface
Date: Sat, 8 Dec 2012 22:04:52 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212082201060.18194@nerf07.vanv.qr>
References: <1DAF6950-F0F7-4B32-88F4-FC65798EB4B3@gmail.com> <alpine.LNX.2.01.1212070816080.1338@nerf07.vanv.qr> <CACnXgaebvzwa=d3BSDo3CKcFnz6EhGHDohtQ9-pv5SUcBDZU4A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACnXgaebvzwa=d3BSDo3CKcFnz6EhGHDohtQ9-pv5SUcBDZU4A@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: rishi kapoor <rkapoor.rishi@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2012-12-07 20:03, rishi kapoor wrote:
>On Thu, Dec 6, 2012 at 11:17 PM, Jan Engelhardt <jengelh@inai.de> wrot=
e:
>>
>>>
>>>I am looking for a iptables rule which can change packet's
>>incoming interface.
>>
>>But what is the point of doing that? You cannot deny the fact that it
>>has come through a particular interface regardless.
>
>Well, I have 2 port NIC and want to configure a local lldp agent runni=
ng on
>system to configure port A based on messages received on port B. =C2=A0=
You can
>think of port B as a control network.

You can change the LLDP agent program to configure A based upon B,
you do not need to edit the interface field for that.
