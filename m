From: Adishesh M <adisheshsm@gmail.com>
Subject: Re: ssh session are hanging when firewall is restarted
Date: Thu, 25 Aug 2011 16:04:28 +0530
Message-ID: <CA+f1OFpKdobWsnTrf3QhAJPGp=4GvDDAiAwg3x2Zi_Le_N0u6Q@mail.gmail.com>
References: <CA+f1OFoJ06_94U9EpGr=85TZFyuAAScG7a-E7qzs2GuXFaRy9Q@mail.gmail.com>
	<CAA2qdGXek91jQ0Z7LRzGm4i8WQpp4ruTkqSg9GEf1Yh3UGdn_g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=BBoioo1LlVe2y9q/IpUJxO1RGP26DFpB661DL0W+zUI=;
        b=PqSTRFvi70rry/pbK1oxNfcpJ4awupcAj1PJJokGmiC1vwh1qf63g6wyDdFS5XVyem
         0uoNONp/p65feR/v3lYdrcSOeC49ere9tSYrCGorDt+10qG9Wrm5ZS+efVHW1FwyfFKI
         6kH2LgmN3A/NzTgzrFtt0L4tugr3SUY29I6Zw=
In-Reply-To: <CAA2qdGXek91jQ0Z7LRzGm4i8WQpp4ruTkqSg9GEf1Yh3UGdn_g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org, Pandu Poluan <pandu@poluan.info>

Hi,

I was doing other tests and come cross this issue.
we have not observed this issue on fedora 14.  Only in RHEL 6.1 this
issue is observed.
Solution for this issue may be available in latest netfiler versions
but not yet integrated in RHEL 6.


Thanks and regards,
Adishesh


On Thu, Aug 25, 2011 at 3:45 PM, Pandu Poluan <pandu@poluan.info> wrote=
:
> Why do you need to restart iptables?
>
> iptables is *not* a daemon-based service. It's always on in the
> kernel. All invocation of the iptables command act *immediately*
>
> Rgds,
>
>
> On 2011-08-24, Adishesh M <adisheshsm@gmail.com> wrote:
>> Hi,
>> When we insert below rules into the ip tables, ssh sessions are
>> hanging ( infact all tcp connection are terminated).
>>
>> =93iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN=
 -m
>> state --state NEW -j DROP=94.
>>
>> what is the problem with this above rule. we used this rule to drop
>> bad tcp packets. when firewall is restarted using "service iptables
>> restart", ssh sessions are hanging.
>>
>>
>> Rule used for testing.
>>
>> ssh session hangs
>> <set 1>
>> --------------------------
>> iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m
>> state --state NEW -j DROP
>> iptables -A INPUT -d 10.255.13.157 -m state --state
>> RELATED,ESTABLISHED =A0-j ACCEPT
>> iptables -A INPUT -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACCEP=
T
>> iptables -A =A0INPUT -d 10.255.13.157 =A0 -j DROP
>>
>>
>> ssh session hangs
>> <set 2>
>> ----------------------------
>> iptables -N TEST_LAN_1
>> iptables -A INPUT -p tcp -m tcp ! --tcp-flags FIN,SYN,RST,ACK SYN -m
>> state --state NEW -j DROP
>> iptables -A INPUT -d 10.255.13.157 -j TEST_LAN_1
>> iptables -A TEST_LAN_1 -d 10.255.13.157 -m state --state
>> RELATED,ESTABLISHED =A0-j ACCEPT
>> iptables -A TEST_LAN_1 -d 10.255.13.157 -p tcp -m tcp --dport 22 -j =
ACCEPT
>> iptables -A =A0TEST_LAN_1 -d 10.255.13.157 =A0 -j DROP
>>
>>
>>
>> ssh session does not hang
>> <set 3>
>> ---------------------------------------
>> iptables -N TEST_LAN_1
>> iptables -A INPUT -d 10.255.13.157 -j TEST_LAN_1
>> iptables -A TEST_LAN_1 -d 10.255.13.157 -m state --state
>> RELATED,ESTABLISHED =A0-j ACCEPT
>> iptables -A TEST_LAN_1 -d 10.255.13.157 -p tcp -m tcp --dport 22 -j =
ACCEPT
>> iptables -A =A0TEST_LAN_1 -d 10.255.13.157 =A0 -j DROP
>>
>>
>> ssh session does not hang
>> <set 4>
>> ---------------------------------------
>> iptables -A INPUT -d 10.255.13.157 -m state --state
>> RELATED,ESTABLISHED =A0-j ACCEPT
>> iptables -A INPUT -d 10.255.13.157 -p tcp -m tcp --dport 22 -j ACCEP=
T
>> iptables -A =A0INPUT -d 10.255.13.157 =A0 -j DROP
>>
>>
>> steps to reproduce the this issue
>> -----------------------------------------------
>> =A0 =A0 iptables -F
>> =A0 =A0 iptables =A0-X
>> =A0 =A0 <Insert any one set of rules from set 1 or set 2 >
>> =A0 =A0 service ip6tables stop
>> =A0 =A0 service iptables save
>> =A0 =A0 iptables -L -n
>> =A0 =A0 service iptables restart
>> =A0 =A0 iptables -L -n
>>
>> Thanks and regards,
>> Adishesh
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>
>
> --
> --
> Pandu E Poluan - IT Optimizer
> My website: http://pandu.poluan.info/
>
