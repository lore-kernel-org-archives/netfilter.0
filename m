From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Blocking UDP Fragments
Date: Wed, 18 May 2011 11:27:39 +0700
Message-ID: <BANLkTikdkdicDs-U23tJVUWp=JejDsLP4w@mail.gmail.com>
References: <216636937ABE004E8CD94DDB2AD8BAA501AE75C2BE63@lsnexchange.limestonenetworks.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <216636937ABE004E8CD94DDB2AD8BAA501AE75C2BE63@lsnexchange.limestonenetworks.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ryan Gelobter <r.gelobter@limestonenetworks.com>
Cc: netfilter@vger.kernel.org

On Tue, May 17, 2011 at 03:42, Ryan Gelobter
<r.gelobter@limestonenetworks.com> wrote:
> Can anyone provide me with some help in creating an iptables rule to =
drop packets such as the ones below? I've modified the amount of XXX in=
 the packet contents since they are normally much larger however they d=
o vary in size. I've come to realize the -f flag does not work for this=
 type of packet and am confused by examples that explain matching by us=
ing the u32 module/"more fragments" flag.
>
> U 0.0.0.0 -> 0.0.0.0 +39221@5920:1480
> =C2=A0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXXXXXXXX
> =C2=A0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXXXXXXXX
> =C2=A0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXXXXXXXX
> #
> U 0.0.0.0-> 0.0.0.0 +39221@7400:800
> =C2=A0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXXXXXXXX
> =C2=A0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXXXXXXXX
>
> U 0.0.0.0-> 0.0.0.0 +39221@2960:1480
> XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXX
> XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXX
> XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
XXXXXXXXXXX
>

If you want to drop all fragmented packets, including the first packet
of the fragment,

iptables -t raw -A PREROUTING -m u32 ! --u32 0x4&0x3fff=3D0x0 -m commen=
t
--comment \"Fragmented\" -j DROP

Explanation:

-m u32 : use the u32 match
--u32 : the parameter for the u32 match

0x4 : get 32 bits starting byte #4 (very first byte is #0)
&0x3fff : do a bitwise AND against those 32 bits

=3D0x0 : UN-fragmented packets will have those 14 bits =3D 0

! : negation, i.e., we want to match packets whose fragmentation bits !=
=3D 0

Rgds
--=20
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
