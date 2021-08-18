From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: NAT - how external source port is selected
Date: Wed, 18 Aug 2021 17:15:29 +0200
Message-ID: <e8eda3b8-0870-7971-b537-e83525e90c02@thelounge.net>
References: <9cc05668-b4fb-4ed8-1588-7a0f5c378b3a@tootai.net>
 <53d27ba0-56ed-9683-0e19-0c946888e781@thelounge.net>
 <30dceaf1-7087-2f80-800d-129d6e0dcb59@tootai.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <30dceaf1-7087-2f80-800d-129d6e0dcb59@tootai.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Daniel <tech@tootai.net>, netfilter@vger.kernel.org



Am 18.08.21 um 16:50 schrieb Daniel:
> How is the magic done then ?

which magic?

a tuple is "src-ip:src-port dst-ip:dst-port" and as long there is no 
collision it's 1:1, if there is a collison a random port is used - 
that's what conntrack is for

you don't need to care on a nat router

> Le 18/08/2021 à 16:22, Reindl Harald a écrit :
>>
>>
>> Am 18.08.21 um 15:53 schrieb Daniel:
>>> how on a NAT firewall server using iptables or nftables, are the 
>>> external source ports choosen?
>> NAT don't chose any ports at all
