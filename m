From: Pandu Poluan <pandu@poluan.info>
Subject: Re: [SOLVED] Routing locally generated traffic on fwmark
Date: Thu, 29 Sep 2011 15:29:02 +0700
Message-ID: <CAA2qdGXAVVu5FwxGDmEztWTNq5=9q+oauo09nx2nH7nQyj3riw@mail.gmail.com>
References: <1317248412.26402.39.camel@andybev-desktop>
	<1317279076.26402.52.camel@andybev-desktop>
	<CAA2qdGUrc31FekJM6r1_s2COoFi5g5iwfpJeozeLED2pYsy3Fw@mail.gmail.com>
	<1317282807.26402.58.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1317282807.26402.58.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Thu, Sep 29, 2011 at 14:53, Andrew Beverley <andy@andybev.com> wrote=
:
> On Thu, 2011-09-29 at 14:32 +0700, Pandu Poluan wrote:
>> On Thu, Sep 29, 2011 at 13:51, Andrew Beverley <andy@andybev.com> wr=
ote:
>> > On Wed, 2011-09-28 at 23:20 +0100, Andrew Beverley wrote:
>> >> Hi,
>> >>
>> >> I'd like to route locally generated traffic via a particular inte=
rface
>> >> based on its mark value.
>> >>
>> >> From what I have researched, this is theoretically possible and l=
ots of
>> >> people have tried it, but nobody has got it working.
>> >>
>> >> Here's my rules:
>> >>
>> >> # Mark the packets
>> >> iptables -A OUTPUT -t mangle -d 89.16.176.81 -j MARK --set-mark 0=
x800
>> >>
>> >> # Route the marked packets via routing table T2:
>> >> ip rule add fwmark 0x800/0xffff table T2
>> >>
>> >> # Force T2 packets out of the interface ppp1
>> >> ip route add table T2 default dev ppp1 via 94.30.127.76
>> >>
>> >> # Flush the cache, just in case
>> >> ip route flush cache
>> >>
>> >> However, the packets still go out of the default route (ppp0).
>> >
>> > I've also added the following, which makes no difference:
>> >
>> > iptables -t nat -A POSTROUTING -o ppp1 \
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0-j SNAT --to-source 109.224.134.110
>> >
>> >
>>
>> Can you post the complete table, i.e., the output of iptables-save ?
>>
>
> Thanks for that. After I added the SNAT rule, I forgot to remove an
> existing earlier rule that was stopping the packets being marked. You=
r
> email reminded me!
>
> So, the reason it wasn't working for me was the missing SNAT rule aft=
er
> all. It now works correctly.
>
> Thanks,
>

You're welcome.

That's why I now no longer write iptables commands directly on the
shell. I keep my firewall rules in a file /etc/opt/firewall, and if I
need to add new rules, I just do: `vi /etc/opt/firewall &&
iptables-restore < /etc/opt/firewall`

(Of course, to seed the file I'd do `iptables-save > /etc/opt/firewall`=
 )

This has the added benefit of allowing me to document all firewall
changes by doing `hg commit` followed by `hg push` to a local
Mercurial repository.

(The reason why I put the rules in /etc/opt instead of /etc is so that
I don't have to create an .hgignore file)

Rgds,
--=20
=46dS Pandu E Poluan
~ IT Optimizer ~

=C2=A0=E2=80=A2 LOPSA Member #15248
=C2=A0=E2=80=A2 Blog : http://pepoluan.tumblr.com
=C2=A0=E2=80=A2 Linked-In : http://id.linkedin.com/in/pepoluan
