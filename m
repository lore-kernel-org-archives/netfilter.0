From: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Subject: Re: Ipset counters question
Date: Thu, 31 Mar 2011 21:05:16 +0200
Message-ID: <4D94D06C.6070201@univ-nantes.fr>
References: <4D91B511.3040005@univ-nantes.fr> <alpine.DEB.2.00.1103302215160.12949@blackhole.kfki.hu> <4D94224B.4050408@univ-nantes.fr> <alpine.DEB.2.00.1103312005580.16579@blackhole.kfki.hu>
Reply-To: jean-philippe.menil@univ-nantes.fr
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1103312005580.16579@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Le 31/03/2011 20:16, Jozsef Kadlecsik a =E9crit :
> On Thu, 31 Mar 2011, Jean-Philippe Menil wrote:
>
>> Le 30/03/2011 22:17, Jozsef Kadlecsik a ?crit :
>>> On Tue, 29 Mar 2011, Jean-Philippe Menil wrote:
>>>
>>>> basiclly, i'm working on a captive portal, who add some rules in
>>>> PRE/POSTROUTING mangle table when a user is fully authenticated.
>>>> $IPTABLES -t mangle -N OUT-AUTH
>>>> $IPTABLES -t mangle -A PREROUTING -j OUT-AUTH
>>>> $IPTABLES -t mangle -N IN-AUTH
>>>> $IPTABLES -t mangle -A POSTROUTING -j IN-AUTH
>>>>
>>>> and the following rules are append when an user is authenticate:
>>>> $IPTABLES -t mangle -A OUT-AUTH -s $IP -m mac --mac-source $IP -j =
MARK
>>>> --set-mark 10
>>>> $IPTABLES -t mangle -A IN-AUTH -d $IP -j ACCEPT
>>>>
>>>> I dicovered ipset, and begin to play with it.
>>>> If my understand of is correct, i can add:
>>>>
>>>> ipset -N TEST macipmap --network 192.168.100.0/24
>>>> $IPTABLES -t mangle -A IN-AUTH -m set --set TEST src,dst -j ACCEPT
>>>> $IPTABLES -t mangle -A OUT-AUTH -m set --set TEST src,dst -j MARK
>>>> --set-mark
>>>> 10
>>> The set match for the bitmap:ip,mac (macipmap) type can check the *=
source*
>>> MAC address only. It is documented in the manpage.
>>>
>> thanks to clarify this point.
>> I need to update my rules in consequence, and re-read the manpages.
>>
>> What about counters?
>>
>>> However, for some accountig reason, i used to check the iptables
>>> counters  (-nvxL) by ip.
>>> If i replace, my iptables rules by an ipset type, i cannot check
>>> counters anymore.
>
> I don't really understand what do you mean by "cannot check the count=
ers".
> Do you mean the counters are not updated? If there's no match due to =
the
> the src/dest MAC mixup, it won't.
>
> The set match is quite ordinary from iptables point of view.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>            H-1525 Budapest 114, POB. 49, Hungary

No, the rules are correct, and counters are updated correctly.

Let me explain, in iptables, i have this in a mangle chain:

Chain WD_BG_Outgoing (1 references)
  pkts bytes target     prot opt in     out     source=20
destination
  238K   18M MARK       all  --  *      *       192.168.10.255=20
0.0.0.0/0           MAC F0:7B:CB:8C:6C:6F MARK set 0x2
  196K   12M MARK       all  --  *      *       192.168.11.214=20
0.0.0.0/0           MAC 00:25:00:4E:E3:B7 MARK set 0x2
  9436 3210K MARK       all  --  *      *       192.168.10.195=20
0.0.0.0/0           MAC F0:7B:CB:52:3D:BE MARK set 0x2
  289K   68M MARK       all  --  *      *       192.168.11.211=20
0.0.0.0/0           MAC 00:22:69:3D:4C:13 MARK set 0x2
  710K   40M MARK       all  --  *      *       192.168.10.34=20
0.0.0.0/0           MAC C8:0A:A9:45:E5:3D MARK set 0x2
1605K   93M MARK       all  --  *      *       192.168.11.155=20
0.0.0.0/0           MAC 00:26:6C:5A:0C:0A MARK set 0x2
81534   14M MARK       all  --  *      *       192.168.11.136=20
0.0.0.0/0           MAC 00:0F:B0:D6:1D:19 MARK set 0x2
  420K   26M MARK       all  --  *      *       192.168.11.149=20
0.0.0.0/0           MAC 00:24:21:44:FB:40 MARK set 0x2
13128 3437K MARK       all  --  *      *       192.168.10.186=20
0.0.0.0/0           MAC 00:26:5E:27:8C:33 MARK set 0x2

--snip--

If i use ipset, with rules like these:
ipset -N WEBAUTHIP bitmap:ip,mac --network 192.168.10.0/24
iptables -t mangle -I WD_BG_Outgoing -m set --set WEBAUTHIP src -j ACCE=
PT

And add clients with ipset -A WEBAUTHIP ip,mac

If i list my mangle chain (WD_BG_Outgoing), i will see only the counter=
s=20
for the WEBAUTHIP match-set,
Chain WD_BG_Outgoing (0 references)
  pkts bytes target     prot opt in     out     source=20
destination
     111M     475M ACCEPT     all  --  *      *       0.0.0.0/0=20
    0.0.0.0/0           match-set WEBAUTHIP src

and i can't anymore check the counters by ip of my clients

Maybe i'm not so clear...

--=20
Jean-Philippe Menil - P=F4le r=E9seau Service IRTS
DSI Universit=E9 de Nantes
jean-philippe.menil@univ-nantes.fr
Tel : 02.53.48.49.27 - Fax : 02.53.48.49.09
