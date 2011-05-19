From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Blocking UDP Fragments
Date: Thu, 19 May 2011 15:51:51 +0700
Message-ID: <BANLkTik-700_otnBE6dstNCU8OopT-_XVw@mail.gmail.com>
References: <216636937ABE004E8CD94DDB2AD8BAA501AE75C2BE63@lsnexchange.limestonenetworks.com>
	<BANLkTikdkdicDs-U23tJVUWp=JejDsLP4w@mail.gmail.com>
	<alpine.LNX.2.01.1105181421340.2862@frira.zrqbmnf.qr>
	<BANLkTinxquz70w+QXTDAk0FY5T5cwMNmWg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BANLkTinxquz70w+QXTDAk0FY5T5cwMNmWg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Thu, May 19, 2011 at 15:43, Pandu Poluan <pandu@poluan.info> wrote:
> On Wed, May 18, 2011 at 19:23, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>>
>> On Wednesday 2011-05-18 06:27, Pandu Poluan wrote:
>>>
>>>If you want to drop all fragmented packets, including the first pack=
et
>>>of the fragment,
>>>
>>>iptables -t raw -A PREROUTING -m u32 ! --u32 0x4&0x3fff=3D0x0 -m com=
ment
>>>--comment \"Fragmented\" -j DROP
>>
>> Yeah but you forget
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0iptables -f -j DROP
>>
>> and that, when nf_defrag is loaded, autodefragmentation is happening=
 and
>> Xtables won't see any more fragments.
>>
>
> Why should I match against -f ? Doesn't " ! --u32 0x4&0x3fff=3D0x0 "
> already match against the first and subsequent packets?
>

Um, maybe I need to explain it clearer:

0x3fff matches bits 18~31 of the 32 bits taken from octet 4.

Bit #19~31 indicates the fragment offset. Non-zero for subsequent
fragments, zero for first fragment.

Bit #18 is the "More Fragment" bit.

So, if the packet is fragmented, Bits #18~31 can't all be '0'; bit #18
will be '1' for all packets *except* the last fragmented packet, and
bits #19~31 will be non-zero for all packets *except* the first
fragmented packet.

Reference:
  * http://www.wtcs.org/snmp4tpc/images/IP-Header.jpg
  * http://www.stearns.org/doc/iptables-u32.current.html (near the end
of the page)

> And when does nf_defrag actually do its magic? Doesn't it take place
> during conntrack, and thus after '-t raw' ?
>


--=20
Pandu E Poluan
~ IT Optimizer ~
Visit my Blog: http://pepoluan.posterous.com
Google Talk:=C2=A0=C2=A0=C2=A0 pepoluan
Y! messenger: pepoluan
MSN / Live:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pepoluan@hotmail.com (do not =
send email here)
Skype:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pepoluan
More on me:=C2=A0=C2=A0My LinkedIn Account=C2=A0 My Facebook Account
