From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: CONNMARK not working ?
Date: Tue, 24 Oct 2017 23:57:39 +0200
Message-ID: <92a21baa-33b5-3a8b-9bbd-efb057230380@plouf.fr.eu.org>
References: <CANSGRxTdrVG_-1uMA40bKXO0QxjDsKfWEJ27nLVOR6eXXUE5tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANSGRxTdrVG_-1uMA40bKXO0QxjDsKfWEJ27nLVOR6eXXUE5tQ@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: paulo bruck <paulobruck1@gmail.com>
Cc: netfilter@vger.kernel.org

Le 24/10/2017 à 00:15, paulo bruck a écrit :
> 
> lan------- firewall--------- wan1------internet
>                         |-----------wan2 -----internet
> 
> All interfaces as bridges

Do you mean that lan, wan1 and wan2 are ports in the same bridge ?
Or they are themselves bridges ?

> iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate NEW -j CONNMARK --set-mark 0x1

Sets connection mark to 1.

> iptables -t mangle -A PREROUTING -i wan1 -j CONNMARK --save-mark

IIUC, copies packet mark (unset so far) to the connection mark, 
overwriting the previous value (1). Why are you doing this ?

> iptables -t mangle -A PREROUTING -i wan1 -m conntrack --ctstate ESTABLISHED,RELATED  -j CONNMARK --restore-mark

Copies the connection mark (now unset) to the packet mark.

> I can reach apache  but looking at conntrack -L  I see :
> 
> tcp      6 107 TIME_WAIT src=192.241.152.243 dst=192.168.1.2
> sport=53545 dport=80 src=192.168.1.2 dst=192.241.152.243 sport=80
> dport=53545 [ASSURED] mark=0 use=1
> tcp      6 103 TIME_WAIT src=192.241.152.243 dst=192.168.1.2
> sport=53544 dport=80 src=192.168.1.2 dst=192.241.152.243 sport=80
> dport=53544 [ASSURED] mark=0 use=1
> 
> 
> Should be mark=1 ??

No. See above comments.

> How can I force mark=1

Do not --save-mark when the packet mark is unset.

Why do you need connection marks and packet marks ?
