From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Help with packet marking
Date: Wed, 28 Mar 2012 13:30:32 -0400
Message-ID: <CACuyg241KoghfmnoxbLvbzhG4fpfBTE6vP07iunz2iP9119cCw@mail.gmail.com>
References: <4F7326B9.2040705@kickstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=qtJHyBmQy4pVyL8IumoKva/BmRiBjJ60NLlm20ZIJ2w=;
        b=TLh1lFE0OmfcDTqWx5Z9fO9sk8uzyHgsukR59YRU+umHN5nJHz0uNfl+u8Nm3XZ3ge
         wPeruzvCsvqPmEUINMwwWzr1mIz6KeU9WNR9GNZfYuU741qIDVCqO9YYDalOB81f36Li
         /Z+YCjAGE/fEh5FInTMHs4rl5q/8WiQXXlgbqL+52C3gkJ8YuroHImtr+65fjzPmPYmg
         xE8Wt6DSypGY2cCqXpbvoBcYavpgpC/QJPGN1YBot0ItmsGLPYX4lUVVnrbxFu6b2tr6
         L46L/GfphIEKeHI/DV3qHpSmTabSHFdHJYFIQCQvVm3XaS4IDBH4M9leEK4PZG1Wrmrw
         Q0Qw==
In-Reply-To: <4F7326B9.2040705@kickstone.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: John Lister <john.lister@kickstone.co.uk>
Cc: netfilter@vger.kernel.org

Hi, i think that exist another way to do this (best).
The linux kernel will select the routing tables according to the RPDB r=
ules.

You "cant" define a default gw into main table (for best routing treatm=
ent).
But, you can change your RPDB to select a default gw out of main table =
(forced).

=46or example:

ip route del default

ip rule flush
ip rule add prio 10 table main
ip rule add prio 50 fwmark 101 table 101
ip rule add prio 51 fwmark 103 table 103
ip rule add prio 100 table 101

ip route flush cache

Another thing is... the mangle table is processed per packet.
So, i think you shouldnt use the NEW state to validate the netfilter ma=
rks.
Your netfilter MARKs shall be made =E2=80=8B=E2=80=8Bwith --set-mark 0x=
101 or 0x103



2012/3/28 John Lister <john.lister@kickstone.co.uk>:
> Hi, I've got a multi homed system which was all working fine until it=
 was
> accidentally rebooted a couple of days ago and this is probably more =
LARTC
> but that list seems dead?
>
> Anyway I'm now seeing bizarre behaviour running ubuntu 10.04 kernel
> 2.6.32-40. Previously I would mark the packets in prerouting and then=
 have
> fwmark based rules in the routing table to send them out via a separa=
te
> custom routing table. =C2=A0I have the main routing table set up with=
 a default
> route via one of the interfaces
>
> Now I can see when debugging iptables, that the interface is set corr=
ectly
> and the packet is marked, but sticking a sniffer onto the interfaces =
shows
> me that the packets are coming out of the default interface. If i dis=
able
> the default route I get "unreachable host". Another wierd thing is th=
at
> conntrack is showing separate new connections as established, for exa=
mple if
> I ping 1 packet and repeat the command the second ping is labelled as
> established which I wouldn't expect... (I've posted this issue earlie=
r as
> restore-mark is working for what I'd expect to be new connections)
>
> Anyway my setup
> interfaces
> eth0 : 192.168.2.7
> eth1 : x.37.63.74 =C2=A0 =C2=A0 =C2=A0 =C2=A0gw=3Dx.37.63.73
> eth3 : x.45.115.81 =C2=A0 =C2=A0 =C2=A0gw=3Dx.45.115.86
>
> # add extra routing tables
> ip route add x.37.63.72/29 dev eth1 table 101
> ip route add 192.168.2.0/24 dev eth0 table 101
> ip route add default via x.37.63.73 dev eth1 table 101
>
> ip route add x.45.115.80/29 dev eth3 table 103
> ip route add 192.168.2.0/24 dev eth0 table 103
> ip route add default via x.45.115.86 dev eth3 table 103
>
> # add rules
> ip rule add fwmark 101 table 101
> ip rule add fwmark 103 table 103
>
> # route a specific ip out for testing sent from 192.168.2.x and forwa=
rded
> through this box.
> iptables -t mangle -A PREROUTING -d 98.207.221.49/32 -m state --state=
 NEW -j
> MATCH1
> iptables -t mangle -A MATCH1 -j MARK --set-mark 0x1
> iptables -t mangle -A MATCH1 -j CONNMARK --save-mark
>
> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to x.37.63.74
>
>
> The above is a simplified subset but covers the basics I think. Anywa=
y doing
> ping 98.207.221.49
> from an internal machine using this as its gateway fails. I can see i=
t marks
> the rule, does the routing which sets the outgoing interface correctl=
y but
> then the packet comes out of the default interface and is then lost. =
The
> following logs are generated (cropped for readability) from which you=
 can
> see it getting marked and the interface set correctly
>
> PREROUTING (NEW) IN=3Deth0 OUT=3D =C2=A0SRC=3D192.168.2.133 DST=3D98.=
207.221.49 LEN=3D60
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D9452 PROTO=3DICMP TYPE=3D8 CODE=
=3D0 ID=3D1 SEQ=3D1354
> PREROUTING (MARK1) IN=3Deth0 OUT=3D =C2=A0SRC=3D192.168.2.133 DST=3D9=
8.207.221.49 LEN=3D60
> TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D9452 PROTO=3DICMP TYPE=3D8 CODE=
=3D0 ID=3D1 SEQ=3D1354
> FORWARD IN=3Deth0 OUT=3Deth1 SRC=3D192.168.2.133 DST=3D98.207.221.49 =
LEN=3D60 TOS=3D0x00
> PREC=3D0x00 TTL=3D127 ID=3D9452 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D1=
 SEQ=3D1354 MARK=3D0x1
> POSTROUTING IN=3D OUT=3Deth1 SRC=3D192.168.2.133 DST=3D98.207.221.49 =
LEN=3D60 TOS=3D0x00
> PREC=3D0x00 TTL=3D127 ID=3D9452 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D1=
 SEQ=3D1354 MARK=3D0x1
> SNATTING IN=3D OUT=3Deth1 SRC=3D192.168.2.133 DST=3D98.207.221.49 LEN=
=3D60 TOS=3D0x00
> PREC=3D0x00 TTL=3D127 ID=3D9452 PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D1=
 SEQ=3D1354 MARK=3D0x1
>
> anyone got an idea what is going on?
>
> Thanks
>
> John
