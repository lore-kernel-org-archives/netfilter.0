From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: Firewall Configuration Help
Date: Wed, 05 Aug 2009 15:35:55 +0200
Message-ID: <4A798ABB.5000001@chello.at>
References: <4399fd970907271056m24713eecj5d6f20aed572cc36@mail.gmail.com> <47ae5fdc6d1c4a93d1035f61774996ec@localhost>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47ae5fdc6d1c4a93d1035f61774996ec@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Julien Vehent wrote:
> Hello Nicholas,
>
>
> On Mon, 27 Jul 2009 13:56:59 -0400, NICHOLAS KLINE <nkline@kent.edu> wrote:
>   
>> # Tell netfilter that all TCP sessions do indeed begin with SYN
>>
>> $IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j LOG
>> --log-prefix "Stealth scan attempt?"
>> $IPTABLES -A INPUT -p tcp ! --syn -m state --state NEW -j DROP
>>     
>
> My understanding of the conntrack subsystem is that a connection cannot be
> in the state NEW without a syn packet, therefore I don't think this is
> useful.
>
>
>   
Wrong, from the iptables tutorial 1.2.2 at frozentux:
http://iptables-tutorial.frozentux.net/iptables-tutorial.html#STATEMACHINE

The NEW state tells us that the packet is the first packet that we see. 
This means that the first packet that the conntrack module sees, within 
a specific connection, will be matched. For example, if we see a SYN 
packet and it is the first packet in a connection that we see, it will 
match. However, the packet may as well not be a SYN packet and still be 
considered NEW.

greets

Mart
