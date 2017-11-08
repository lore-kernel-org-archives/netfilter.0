From: paulo bruck <paulobruck1@gmail.com>
Subject: Re: packages leaving interface wrongly using loadbalance
Date: Wed, 8 Nov 2017 15:57:14 -0200
Message-ID: <CANSGRxTVd4EnsWdw3A79DdFEDfixgP-X9CF3n5mWzYnorbz0-A@mail.gmail.com>
References: <CANSGRxQkCfa8FSQ+RPdZ2sv54hL=srh0G80Rdad7tyZ6Ude_TA@mail.gmail.com>
 <a017a16d-4c29-93ea-6e13-ff35e4b89809@gmail.com> <CANSGRxTFSJrUhjOaKg1tvw1q9JxHGghkJBaRncOLLcVw_3UW6A@mail.gmail.com>
 <ced608bd-ea9f-c4ab-46ee-87c12bda92aa@pkfnet.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=+MohZu72ECwuW4YLSdKwUVvD3AB9imOyXaNRyoZBVHY=;
        b=AUT2Y7YzXwM/qsL9wLa7FVRTF6yIZMrlFU8Z0jfUwZbm4Cl1MIhW03IOhUgBkYnBhx
         Exkb0vO73oQDOsvTOWYYX2I7Lh+MOxEszZ2DFdQpJOzAWzbqWx7aTSaazdaxyjUrjRL+
         fs+xh4WdJNZlFv8voKahXWni/16VtUk2KADKi5o/vTwlf++JcSTkH6DpnJ7Oj/ElJ6Ew
         awZuAXoM122yd70DWS2pZkxh9+1Yh64wx2B/2mCxYmXC8WRKdG9S5DY/ggnEr+44ZpGT
         7ogmjowXRgD75PK97OpR1elwlfTDa6w/EV5Mzcr2ytPVhggl89+hA+tyKikONZ+FnbcK
         YC2Q==
In-Reply-To: <ced608bd-ea9f-c4ab-46ee-87c12bda92aa@pkfnet.co.za>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi Mark

Yes but using CONNMARK and MARK I still see packages from lan leaving
WAN  and packages that should leave WAN1 with address of WAN2....

Certanly I am still doing something wrong,...80(

I tried to mark ALL packages at prerouting mangle into enp2so ( lan)
with mark=3D1 but even this not worked....

Comparing with scripts that Fatih developed I see now minor
differences ( one of then is route default ) Maybe the problem is
there?

root@zeus:~# ip r l
default
nexthop via 192.168.1.1  dev enp7s0 weight 99
nexthop via 201.6.110.1  dev enp6s1 weight 1
192.168.1.0/24 dev enp7s0 proto kernel scope link src 192.168.1.2
192.168.10.0/24 dev enp2s0 proto kernel scope link src 192.168.10.1
192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1
201.6.110.0/24 dev enp6s1 proto kernel scope link src 201.6.110.xxx

root@zeus:~# ip r l table WAN1
default via 192.168.1.1 dev enp7s0
127.0.0.0/8 dev lo scope link
192.168.1.0/24 dev enp7s0 proto kernel scope link src 192.168.1.2
192.168.10.0/24 dev enp2s0 proto kernel scope link src 192.168.10.1
192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1
201.6.110.0/24 dev enp6s1 proto kernel scope link src 201.6.110.xxx

root@zeus:~# ip r l table WAN2
default via 201.6.110.1 dev enp6s1
127.0.0.0/8 dev lo scope link
192.168.1.0/24 dev enp7s0 proto kernel scope link src 192.168.1.2
192.168.10.0/24 dev enp2s0 proto kernel scope link src 192.168.10.1
192.168.122.0/24 dev virbr0 proto kernel scope link src 192.168.122.1
201.6.110.0/24 dev enp6s1 proto kernel scope link src 201.6.110.xxx

root@zeus:~# ip rule list
0: from all lookup local
32762: from 201.6.110.0/24 lookup WAN2
32763: from all fwmark 0x2 lookup WAN2
32764: from 192.168.1.0/24 lookup WAN1
32765: from all fwmark 0x1 lookup WAN1
32766: from all lookup main
32767: from all lookup default

and iptables mangle
Chain PREROUTING (policy ACCEPT 2911 packets, 570078 bytes)
    pkts      bytes target     prot opt in     out     source
     destination
      99     4574 CONNMARK   all  --  virbr0 *       0.0.0.0/0
   0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
       0        0 MARK       tcp  --  virbr0 *       192.168.122.2
   0.0.0.0/0            multiport dports 25 /* mercurio#5 */ ctstate
NEW MARK set 0x2
      99     4574 CONNMARK   all  --  virbr0 *       0.0.0.0/0
   0.0.0.0/0            CONNMARK save
     373   113087 CONNMARK   all  --  enp2s0 *       0.0.0.0/0
   0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
       2      183 MARK       udp  --  enp2s0 *       0.0.0.0/0
   0.0.0.0/0            multiport dports 15000:16000 /*
saida_do_80_e_443_preferencial_pelo_SPeedy */ ctstate NEW MARK set 0x1
       4      240 MARK       tcp  --  enp2s0 *       0.0.0.0/0
   0.0.0.0/0            multiport dports 80,443,8080,873,15000:16000
/* saida_do_80_e_443_preferencial_pelo_SPeedy */ ctstate NEW MARK set
0x1
     469   119098 CONNMARK   all  --  enp2s0 *       0.0.0.0/0
   0.0.0.0/0            CONNMARK save
     373   113087 CONNMARK   all  --  enp2s0 *       0.0.0.0/0
   0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
      96     6011 CONNMARK1  all  --  enp2s0 *       0.0.0.0/0
   0.0.0.0/0            ctstate NEW statistic mode random probability
0.99000000022
       1       60 CONNMARK2  all  --  enp2s0 *       0.0.0.0/0
   0.0.0.0/0            ctstate NEW statistic mode random probability
0.00999999978
      99     4574 CONNMARK   all  --  virbr0 *       0.0.0.0/0
   0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
       0        0 CONNMARK1  all  --  virbr0 *       0.0.0.0/0
   0.0.0.0/0            ctstate NEW statistic mode random probability
0.99000000022
       0        0 CONNMARK2  all  --  virbr0 *       0.0.0.0/0
   0.0.0.0/0            ctstate NEW statistic mode random probability
0.00999999978
    675   145108 CONNMARK   all  --  enp7s0 *       0.0.0.0/0
  0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
     141     9097 MARK       all  --  enp7s0 *       0.0.0.0/0
   0.0.0.0/0            ctstate NEW MARK set 0x1
     816   154205 CONNMARK   all  --  enp7s0 *       0.0.0.0/0
   0.0.0.0/0            CONNMARK save
       2      112 CONNMARK   all  --  enp6s1 *       0.0.0.0/0
   0.0.0.0/0            ctstate RELATED,ESTABLISHED CONNMARK restore
       8      400 MARK       all  --  enp6s1 *       0.0.0.0/0
   0.0.0.0/0            ctstate NEW MARK set 0x2
      10      512 CONNMARK   all  --  enp6s1 *       0.0.0.0/0
   0.0.0.0/0            CONNMARK save
---cut----------
Chain CONNMARK1 (2 references)
    pkts      bytes target     prot opt in     out     source
     destination
    5118  1549128 MARK       all  --  *      *       0.0.0.0/0
   0.0.0.0/0            MARK set 0x1
    5118  1549128 CONNMARK   all  --  *      *       0.0.0.0/0
   0.0.0.0/0            CONNMARK save

Chain CONNMARK2 (2 references)
    pkts      bytes target     prot opt in     out     source
     destination
       4      242 MARK       all  --  *      *       0.0.0.0/0
   0.0.0.0/0            MARK set 0x2
       4      242 CONNMARK   all  --  *      *       0.0.0.0/0
   0.0.0.0/0            CONNMARK save


NAT
Chain POSTROUTING (policy ACCEPT 2452 packets, 118448 bytes)
    pkts      bytes target     prot opt in     out     source
     destination
    2597   163863 SNAT       all  --  *      enp7s0  0.0.0.0/0
   0.0.0.0/0            /*  saida padr=C3=A3o do POSTROUTING da 192.168.1.2
*/ to:192.168.1.2
      43     3138 SNAT       all  --  *      enp6s1  0.0.0.0/0
   0.0.0.0/0            /*  saida padr=C3=A3o do POSTROUTING da
201.6.110.xxx */ to:201.6.110.xxx



root@zeus:~# tcpdump  -nlptqi enp7s0 host ! 192.168.1.2
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on enp7s0, link-type EN10MB (Ethernet), capture size 262144 bytes
IP 192.168.10.21.52207 > 51.15.4.13.80: tcp 0
IP 201.6.110.xxx.57096 > 124.150.9.21.51568: tcp 0

root@zeus:~# conntrack -L --dst=3D51.15.4.13
tcp      6 6 CLOSE_WAIT src=3D192.168.10.21 dst=3D51.15.4.13 sport=3D42080
dport=3D1337 src=3D51.15.4.13 dst=3D192.168.1.2 sport=3D1337 dport=3D42080
[ASSURED] mark=3D1 use=3D1
tcp      6 10 CLOSE_WAIT src=3D192.168.10.21 dst=3D51.15.4.13 sport=3D52404
dport=3D80 src=3D51.15.4.13 dst=3D192.168.1.2 sport=3D80 dport=3D52404 [ASS=
URED]
mark=3D1 use=3D1
 Strange isnt it? packages are marked but leaving wihout NAT

root@zeus:~# conntrack -L --dst=3D124.150.9.21
udp      17 125 src=3D192.168.10.21 dst=3D124.150.9.21 sport=3D51413
dport=3D51568 src=3D124.150.9.21 dst=3D192.168.1.2 sport=3D51568 dport=3D51=
413
[ASSURED] mark=3D1 use=3D1
This is real strange  package with ource IP from WAN2 leaning WAN1 and
marked as WAN1.....

Any ideas would be very appreciated... 80)

2017-11-08 9:01 GMT-02:00 Mark Coetser <mark@pkfnet.co.za>:
>
> On 08/11/2017 01:58, paulo bruck wrote:
>>
>> Hi Fatih
>>
>> Thanks for quickly response.
>>
>> Unfortunately using your scripts  is the same. I see packages leaving
>> wan interface w/ lan address and packages  leaving WAN1 w/ WAN2 ip...
>> 80((
>>
>> I have read about routing cache not exist after kernel 3....8(     but
>>   I not found any replacement for it untill now.
>>
>> Tested in Debian stretch using kernel 3.16 and 4.9.51-1
>>
>> I think that with your ideia I have reach 1/2 of path.....
>>
>> Any other idea ?
>>
>> Thanks
>
>
> You are correct, the route cache is no longer available. you need to use
> iptables with conntrack and statistic to balance the connections across e=
ach
> link.
>
>
> --
> Thank you,
>
> Mark Adrian Coetser



--=20
Paulo Ricardo Bruck consultor
tel 011 3596-4881/4882  011 98140-9184 (TIM)
http://www.contatogs.com.br
http://www.protejasuarede.com.br
gpg AAA59989 at wwwkeys.us.pgp.net
