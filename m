From: paulo bruck <paulobruck1@gmail.com>
Subject: Re: packages leaving interface wrongly using loadbalance
Date: Thu, 16 Nov 2017 13:39:35 -0200
Message-ID: <CANSGRxSVJ5xjgODkY_v_9MQRHUrRuybg=e6TK8ur8Z871JSu0w@mail.gmail.com>
References: <CANSGRxQkCfa8FSQ+RPdZ2sv54hL=srh0G80Rdad7tyZ6Ude_TA@mail.gmail.com>
 <a017a16d-4c29-93ea-6e13-ff35e4b89809@gmail.com> <CANSGRxTFSJrUhjOaKg1tvw1q9JxHGghkJBaRncOLLcVw_3UW6A@mail.gmail.com>
 <ced608bd-ea9f-c4ab-46ee-87c12bda92aa@pkfnet.co.za> <CANSGRxTVd4EnsWdw3A79DdFEDfixgP-X9CF3n5mWzYnorbz0-A@mail.gmail.com>
 <CAN_K0LQ3YUepxSv86YeRCZ=o=CG7X1FzXeZBR0RDKhfnVWkmxQ@mail.gmail.com> <CANSGRxRW4986Ka8zqVHyTi31pMi2-b68+NicRYe6kgHzFkA=BA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=w43aCFyIy3J9CvtsVTqSD4tc84kU5gbKJzDmtrcTFqk=;
        b=kAX3gnXAMFiRi1efE8E8Ucfb17FVb0q4q+X64octObJ5V9d7bKhB1l+2gkCKrfThI5
         uoPU3c87PUsfiQoA1MbOmOJImCuYYiERUBPWef+tyfcoGdPHPYJOwfubOfqeui075sZ7
         C1IPtdAGvJGO79ePdLNyDLHoUaHYlcMp71eKo4wZ0w2SZnfOJ7JI/he8LTpdPQZkPNnr
         GLM3FkXDOkpoQOXikdji6RCpGgKeGFSJLgPMUfmFi36bSKrjF7KFWSh/V/3mNZ2Xv5FP
         l/GqgJ7BNwaeqicEsN9ptPNgi99rgWwy3jhppLZY4cIoITXqZ/lj4yDW8nDf2Q08J+k7
         gzRQ==
In-Reply-To: <CANSGRxRW4986Ka8zqVHyTi31pMi2-b68+NicRYe6kgHzFkA=BA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hmm after some research  I discovered..

Indeed Fatih , you code is excellent  and runs smoothly 80)

The difference is that I insert you scripts at my environment and I
have squid and email w/kvm running w/ firewall...80) that's the
difference..80)

My apologies 80)

thanks in advance  and now second round  to addapt  your script to my needs=
. 80)

2017-11-08 20:49 GMT-02:00 paulo bruck <paulobruck1@gmail.com>:
> Hy Fatih thanks for helping me
>
> Just to remember that I m using debian with kernel 3.16.0-4
>
> I clean all my iptables rules and route,  set all parameters at your
> script as you adviced. Reboot and call you script.
>
> Unfortunately I still see packages from LAN leaving WAN1 and WAN2, but
>
> GOOD NEWS!!! I haven't seen packages from ipwan1 leaving wan2 and vice
> versa....80)
>
> Humm could be something related with sysctl.conf????
>
>
> best regards
>
>
> 2017-11-08 19:12 GMT-02:00 Fatih USTA <fatihusta86@gmail.com>:
>> Hi Paulo
>> I tried my scripts today. It's work.
>> Please run My script. I think very easy  configure.
>>
>> Don't use weighted multiple nexthop for default gw.
>> Please use dummy interface for default gateway.
>>
>> Note1: use 1-1 weight on statistics module during test.
>>
>> Note2: My script have failover feature. (link and gw detection.)
>>
>>
>> On Nov 8, 2017 20:58, "paulo bruck" <paulobruck1@gmail.com> wrote:
>>>
>>> Hi Mark
>>>
>>> Yes but using CONNMARK and MARK I still see packages from lan leaving
>>> WAN  and packages that should leave WAN1 with address of WAN2....
>>>
>>> Certanly I am still doing something wrong,...80(
>>>
>>> I tried to mark ALL packages at prerouting mangle into enp2so ( lan)
>>> with mark=3D1 but even this not worked....
>>>
>>> Comparing with scripts that Fatih developed I see now minor
>>> differences ( one of then is route default ) Maybe the problem is
>>> there?
>>>
>>> root@zeus:~# ip r l
>>> default
>>> nexthop via 192.168.1.1  dev enp7s0 weight 99
>>> nexthop via 201.6.110.1  dev enp6s1 weight 1
>>> 192.168.1.0/24 dev enp7s0 proto kernel scope link src 192.168.1.2
>>> 192.168.10.0/24 dev enp2s0 proto kernel scope link src 192.168.10.1
>>> 192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1
>>> 201.6.110.0/24 dev enp6s1 proto kernel scope link src 201.6.110.xxx
>>>
>>> root@zeus:~# ip r l table WAN1
>>> default via 192.168.1.1 dev enp7s0
>>> 127.0.0.0/8 dev lo scope link
>>> 192.168.1.0/24 dev enp7s0 proto kernel scope link src 192.168.1.2
>>> 192.168.10.0/24 dev enp2s0 proto kernel scope link src 192.168.10.1
>>> 192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1
>>> 201.6.110.0/24 dev enp6s1 proto kernel scope link src 201.6.110.xxx
>>>
>>> root@zeus:~# ip r l table WAN2
>>> default via 201.6.110.1 dev enp6s1
>>> 127.0.0.0/8 dev lo scope link
>>> 192.168.1.0/24 dev enp7s0 proto kernel scope link src 192.168.1.2
>>> 192.168.10.0/24 dev enp2s0 proto kernel scope link src 192.168.10.1
>>> 192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1
>>> 201.6.110.0/24 dev enp6s1 proto kernel scope link src 201.6.110.xxx
>>>
>>> root@zeus:~# ip rule list
>>> 0: from all lookup local
>>> 32762: from 201.6.110.0/24 lookup WAN2
>>> 32763: from all fwmark 0x2 lookup WAN2
>>> 32764: from 192.168.1.0/24 lookup WAN1
>>> 32765: from all fwmark 0x1 lookup WAN1
>>> 32766: from all lookup main
>>> 32767: from all lookup default
>>>
>>> and iptables mangle
>>> Chain PREROUTING (policy ACCEPT 2911 packets, 570078 bytes)
>>>     pkts      bytes target     prot opt in     out     source
>>>      destination
>>>       99     4574 CONNMARK   all  --  virbr0 *       0.0.0.0/0
>>>    0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
>>>        0        0 MARK       tcp  --  virbr0 *       192.168.122.2
>>>    0.0.0.0/0            multiport dports 25 /* mercurio#5 */ ctstate
>>> NEW MARK set 0x2
>>>       99     4574 CONNMARK   all  --  virbr0 *       0.0.0.0/0
>>>    0.0.0.0/0            CONNMARK save
>>>      373   113087 CONNMARK   all  --  enp2s0 *       0.0.0.0/0
>>>    0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
>>>        2      183 MARK       udp  --  enp2s0 *       0.0.0.0/0
>>>    0.0.0.0/0            multiport dports 15000:16000 /*
>>> saida_do_80_e_443_preferencial_pelo_SPeedy */ ctstate NEW MARK set 0x1
>>>        4      240 MARK       tcp  --  enp2s0 *       0.0.0.0/0
>>>    0.0.0.0/0            multiport dports 80,443,8080,873,15000:16000
>>> /* saida_do_80_e_443_preferencial_pelo_SPeedy */ ctstate NEW MARK set
>>> 0x1
>>>      469   119098 CONNMARK   all  --  enp2s0 *       0.0.0.0/0
>>>    0.0.0.0/0            CONNMARK save
>>>      373   113087 CONNMARK   all  --  enp2s0 *       0.0.0.0/0
>>>    0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
>>>       96     6011 CONNMARK1  all  --  enp2s0 *       0.0.0.0/0
>>>    0.0.0.0/0            ctstate NEW statistic mode random probability
>>> 0.99000000022
>>>        1       60 CONNMARK2  all  --  enp2s0 *       0.0.0.0/0
>>>    0.0.0.0/0            ctstate NEW statistic mode random probability
>>> 0.00999999978
>>>       99     4574 CONNMARK   all  --  virbr0 *       0.0.0.0/0
>>>    0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
>>>        0        0 CONNMARK1  all  --  virbr0 *       0.0.0.0/0
>>>    0.0.0.0/0            ctstate NEW statistic mode random probability
>>> 0.99000000022
>>>        0        0 CONNMARK2  all  --  virbr0 *       0.0.0.0/0
>>>    0.0.0.0/0            ctstate NEW statistic mode random probability
>>> 0.00999999978
>>>     675   145108 CONNMARK   all  --  enp7s0 *       0.0.0.0/0
>>>   0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
>>>      141     9097 MARK       all  --  enp7s0 *       0.0.0.0/0
>>>    0.0.0.0/0            ctstate NEW MARK set 0x1
>>>      816   154205 CONNMARK   all  --  enp7s0 *       0.0.0.0/0
>>>    0.0.0.0/0            CONNMARK save
>>>        2      112 CONNMARK   all  --  enp6s1 *       0.0.0.0/0
>>>    0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
>>>        8      400 MARK       all  --  enp6s1 *       0.0.0.0/0
>>>    0.0.0.0/0            ctstate NEW MARK set 0x2
>>>       10      512 CONNMARK   all  --  enp6s1 *       0.0.0.0/0
>>>    0.0.0.0/0            CONNMARK save
>>> ---cut----------
>>> Chain CONNMARK1 (2 references)
>>>     pkts      bytes target     prot opt in     out     source
>>>      destination
>>>     5118  1549128 MARK       all  --  *      *       0.0.0.0/0
>>>    0.0.0.0/0            MARK set 0x1
>>>     5118  1549128 CONNMARK   all  --  *      *       0.0.0.0/0
>>>    0.0.0.0/0            CONNMARK save
>>>
>>> Chain CONNMARK2 (2 references)
>>>     pkts      bytes target     prot opt in     out     source
>>>      destination
>>>        4      242 MARK       all  --  *      *       0.0.0.0/0
>>>    0.0.0.0/0            MARK set 0x2
>>>        4      242 CONNMARK   all  --  *      *       0.0.0.0/0
>>>    0.0.0.0/0            CONNMARK save
>>>
>>>
>>> NAT
>>> Chain POSTROUTING (policy ACCEPT 2452 packets, 118448 bytes)
>>>     pkts      bytes target     prot opt in     out     source
>>>      destination
>>>     2597   163863 SNAT       all  --  *      enp7s0  0.0.0.0/0
>>>    0.0.0.0/0            /*  saida padr=C3=A3o do POSTROUTING da 192.168=
.1.2
>>> */ to:192.168.1.2
>>>       43     3138 SNAT       all  --  *      enp6s1  0.0.0.0/0
>>>    0.0.0.0/0            /*  saida padr=C3=A3o do POSTROUTING da
>>> 201.6.110.xxx */ to:201.6.110.xxx
>>>
>>>
>>>
>>> root@zeus:~# tcpdump  -nlptqi enp7s0 host ! 192.168.1.2
>>> tcpdump: verbose output suppressed, use -v or -vv for full protocol dec=
ode
>>> listening on enp7s0, link-type EN10MB (Ethernet), capture size 262144
>>> bytes
>>> IP 192.168.10.21.52207 > 51.15.4.13.80: tcp 0
>>> IP 201.6.110.xxx.57096 > 124.150.9.21.51568: tcp 0
>>>
>>> root@zeus:~# conntrack -L --dst=3D51.15.4.13
>>> tcp      6 6 CLOSE_WAIT src=3D192.168.10.21 dst=3D51.15.4.13 sport=3D42=
080
>>> dport=3D1337 src=3D51.15.4.13 dst=3D192.168.1.2 sport=3D1337 dport=3D42=
080
>>> [ASSURED] mark=3D1 use=3D1
>>> tcp      6 10 CLOSE_WAIT src=3D192.168.10.21 dst=3D51.15.4.13 sport=3D5=
2404
>>> dport=3D80 src=3D51.15.4.13 dst=3D192.168.1.2 sport=3D80 dport=3D52404 =
[ASSURED]
>>> mark=3D1 use=3D1
>>>  Strange isnt it? packages are marked but leaving wihout NAT
>>>
>>> root@zeus:~# conntrack -L --dst=3D124.150.9.21
>>> udp      17 125 src=3D192.168.10.21 dst=3D124.150.9.21 sport=3D51413
>>> dport=3D51568 src=3D124.150.9.21 dst=3D192.168.1.2 sport=3D51568 dport=
=3D51413
>>> [ASSURED] mark=3D1 use=3D1
>>> This is real strange  package with ource IP from WAN2 leaning WAN1 and
>>> marked as WAN1.....
>>>
>>> Any ideas would be very appreciated... 80)
>>>
>>> 2017-11-08 9:01 GMT-02:00 Mark Coetser <mark@pkfnet.co.za>:
>>> >
>>> > On 08/11/2017 01:58, paulo bruck wrote:
>>> >>
>>> >> Hi Fatih
>>> >>
>>> >> Thanks for quickly response.
>>> >>
>>> >> Unfortunately using your scripts  is the same. I see packages leavin=
g
>>> >> wan interface w/ lan address and packages  leaving WAN1 w/ WAN2 ip..=
.
>>> >> 80((
>>> >>
>>> >> I have read about routing cache not exist after kernel 3....8(     b=
ut
>>> >>   I not found any replacement for it untill now.
>>> >>
>>> >> Tested in Debian stretch using kernel 3.16 and 4.9.51-1
>>> >>
>>> >> I think that with your ideia I have reach 1/2 of path.....
>>> >>
>>> >> Any other idea ?
>>> >>
>>> >> Thanks
>>> >
>>> >
>>> > You are correct, the route cache is no longer available. you need to =
use
>>> > iptables with conntrack and statistic to balance the connections acro=
ss
>>> > each
>>> > link.
>>> >
>>> >
>>> > --
>>> > Thank you,
>>> >
>>> > Mark Adrian Coetser
>>>
>>>
>>>
>>> --
>>> Paulo Ricardo Bruck consultor
>>> tel 011 3596-4881/4882  011 98140-9184 (TIM)
>>> http://www.contatogs.com.br
>>> http://www.protejasuarede.com.br
>>> gpg AAA59989 at wwwkeys.us.pgp.net
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>
> --
> Paulo Ricardo Bruck consultor
> tel 011 3596-4881/4882  011 98140-9184 (TIM)
> http://www.contatogs.com.br
> http://www.protejasuarede.com.br
> gpg AAA59989 at wwwkeys.us.pgp.net



--=20
Paulo Ricardo Bruck consultor
tel 011 3596-4881/4882  011 98140-9184 (TIM)
http://www.contatogs.com.br
http://www.protejasuarede.com.br
gpg AAA59989 at wwwkeys.us.pgp.net
