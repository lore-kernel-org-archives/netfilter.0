From: Pandu Poluan <pandu@poluan.info>
Subject: Re: Routing locally generated traffic on fwmark
Date: Thu, 29 Sep 2011 14:32:57 +0700
Message-ID: <CAA2qdGUrc31FekJM6r1_s2COoFi5g5iwfpJeozeLED2pYsy3Fw@mail.gmail.com>
References: <1317248412.26402.39.camel@andybev-desktop>
	<1317279076.26402.52.camel@andybev-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1317279076.26402.52.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Thu, Sep 29, 2011 at 13:51, Andrew Beverley <andy@andybev.com> wrote=
:
> On Wed, 2011-09-28 at 23:20 +0100, Andrew Beverley wrote:
>> Hi,
>>
>> I'd like to route locally generated traffic via a particular interfa=
ce
>> based on its mark value.
>>
>> From what I have researched, this is theoretically possible and lots=
 of
>> people have tried it, but nobody has got it working.
>>
>> Here's my rules:
>>
>> # Mark the packets
>> iptables -A OUTPUT -t mangle -d 89.16.176.81 -j MARK --set-mark 0x80=
0
>>
>> # Route the marked packets via routing table T2:
>> ip rule add fwmark 0x800/0xffff table T2
>>
>> # Force T2 packets out of the interface ppp1
>> ip route add table T2 default dev ppp1 via 94.30.127.76
>>
>> # Flush the cache, just in case
>> ip route flush cache
>>
>> However, the packets still go out of the default route (ppp0).
>
> I've also added the following, which makes no difference:
>
> iptables -t nat -A POSTROUTING -o ppp1 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0-j SNAT --to-source 109.224.134.110
>
> And I've done a test with:
>
> ip rule add to 89.16.176.81 table T2
>
> which *does* work.
>
> So, I assume the problem is that the packet is marked too late to aff=
ect
> the routing. Looking at the packet flow diagram[1] though, there shou=
ld
> be a re-route check after the mangle table, which should re-route if =
a
> packet's mark has changed. Does this feature need enabling?
>
> Andy
>
> [1] http://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-pack=
et-flow.svg
>

Can you post the complete table, i.e., the output of iptables-save ?

Rgds,
--=20
=46dS Pandu E Poluan
~ IT Optimizer ~

=C2=A0=E2=80=A2 LOPSA Member #15248
=C2=A0=E2=80=A2 Blog : http://pepoluan.tumblr.com
=C2=A0=E2=80=A2 Linked-In : http://id.linkedin.com/in/pepoluan
