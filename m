From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: DHCP works but iptables should have dropped
Date: Mon, 15 Oct 2007 15:39:59 +0000 (UTC)
Message-ID: <slrnfh72ef.7et.petr.pisar@album.ics.muni.cz>
References: <E1IgS7N-0000Jz-Kg@www3.emo.freenet-rz.de> <slrnfh5249.8cf.petr.pisar@album.ics.muni.cz> <47135720.9040804@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On 2007-10-15, G=E1sp=E1r Lajos <swifty@freemail.hu> wrote:
>> The raw socket has one important attribute: it recieves packets befo=
re
>> netfilter. The same mechanism is used by tcpdump/libcap.
>>
> Are you saying that We CAN NOT "protect" the DHCP-server with iptable=
s?
>
The way how you say it is bad but it's true.

OTOH, how do you want to protect server before malicous packets which
have source address 0.0.0.0? It makes no sense. Just omit the interface
name in argument list of dhcpd and be happy ;)

-- Petr

