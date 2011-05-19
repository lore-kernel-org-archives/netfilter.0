From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Blocking UDP Fragments
Date: Thu, 19 May 2011 15:43:51 +0700
Message-ID: <BANLkTinxquz70w+QXTDAk0FY5T5cwMNmWg@mail.gmail.com>
References: <216636937ABE004E8CD94DDB2AD8BAA501AE75C2BE63@lsnexchange.limestonenetworks.com>
	<BANLkTikdkdicDs-U23tJVUWp=JejDsLP4w@mail.gmail.com>
	<alpine.LNX.2.01.1105181421340.2862@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1105181421340.2862@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Wed, May 18, 2011 at 19:23, Jan Engelhardt <jengelh@medozas.de> wrot=
e:
>
> On Wednesday 2011-05-18 06:27, Pandu Poluan wrote:
>>
>>If you want to drop all fragmented packets, including the first packe=
t
>>of the fragment,
>>
>>iptables -t raw -A PREROUTING -m u32 ! --u32 0x4&0x3fff=3D0x0 -m comm=
ent
>>--comment \"Fragmented\" -j DROP
>
> Yeah but you forget
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0iptables -f -j DROP
>
> and that, when nf_defrag is loaded, autodefragmentation is happening =
and
> Xtables won't see any more fragments.
>

Why should I match against -f ? Doesn't " ! --u32 0x4&0x3fff=3D0x0 "
already match against the first and subsequent packets?

And when does nf_defrag actually do its magic? Doesn't it take place
during conntrack, and thus after '-t raw' ?


Rgds,
--=20
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
