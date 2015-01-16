From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: IPTABLES + PREROUTING + --set-mark + Ubuntu
Date: Fri, 16 Jan 2015 02:03:34 +0100
Message-ID: <m99o16$uos$1@ger.gmane.org>
References: <CAJb3rWB_G6AkHAcTP2uCYFzL_VLPG5rgw5cnvyf+qCafF+QtXQ@mail.gmail.com> <m99npn$roj$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <m99npn$roj$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

U.Mutlu wrote, On 01/16/2015 01:59 AM:
> The Media Server wrote, On 01/15/2015 11:34 PM:
>> Hi I can't get my PREROUTING iptables rule to mark my packets via
>> --set-mark on Ubuntu
>>
>> iptables -t mangle -A PREROUTING -p tcp --sport 80 -j MARK --set-mark 2
>> rule add fwmark 2 table 2

and the above one should be
    ip rule add fwmark 2 table 2

>> iptables -t mangle -A PREROUTING -j MARK --set-mark 2
>> iptables -t mangle -A INPUT -j MARK --set-mark 2
>> iptables -t nat -A INPUT -j MARK --set-mark 2
>> iptables -t nat -A PREROUTING -j MARK --set-mark 2
>>
>> None of the above pass trough the table2
>>
>> but this does pass trough the table 2 with this rule:
>> ip rule add from 192.168.2.0/24 table 2
>>
>> ----
>> Is there a problem marking packets in Ubuntu 14.04.1 LTS and iptables v1.4.21?
>
> Have you also defined table 2 in /etc/iproute2/rt_tables ?
> It must be something like:
> 2 mytab2
> I think there is no tool for it, you have to edit the file.
>
> later you can use
>    ip rule ls
>    ip route ls
>    ip route ls table 2
> or alternatively
>    ip route ls table mytab2
>
> and don't forget to del the wrong or excess entries there...
>    ip rule del fwmark 2 table 2
>    ip route flush table 2
>


