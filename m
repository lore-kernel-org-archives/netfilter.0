From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Nat and firewall holes
Date: Mon, 22 Mar 2010 20:40:15 +0100
Message-ID: <4BA7C79F.9030505@plouf.fr.eu.org>
References: <cfeab66d1003220846h20c255d4u280ada41d2df1a2b@mail.gmail.com>	 <4BA7A4F9.6020001@plouf.fr.eu.org>	 <cfeab66d1003221027v65611783vf342e3038744a0f6@mail.gmail.com>	 <4BA7AB63.6090908@plouf.fr.eu.org> <cfeab66d1003221043g2057a7d3n4a6affac6429a323@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cfeab66d1003221043g2057a7d3n4a6affac6429a323@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

ratheesh k a =E9crit :
>>>> On Mon, Mar 22, 2010 at 10:42 PM, Pascal Hambourg <pascal.mail@plo=
uf.fr.eu.org> wrote
>> Window and sequence number tracking has been included in TCP connect=
ion
>> tracking since kernel 2.6.9, making out-of-window segments INVALID.
>=20
> Beautiful ...
> So this packet will be rejected by
> iptables -A FORWARD -m state --state INVALID -j DROP  rule ??

Actually not in your masquerading setup : INVALID packets skip NAT
(which is good enough a reason to DROP them in a NAT setup, in order to
prevent private addresses from leaking outside), so the packet won't be
demasqueraded and will fall into the INPUT chain instead of the FORWARD
chain.
