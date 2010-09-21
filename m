From: Eric Paris <eparis@parisplace.org>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Tue, 21 Sep 2010 17:00:17 -0400
Message-ID: <AANLkTi=qDZW0DMugh__Z76_qYj3_Oq-uEMt8rB0-svz-@mail.gmail.com>
References: <4C9696E5.4030803@googlemail.com>
	<alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr>
	<4C973A6A.9010809@googlemail.com>
	<alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr>
	<4C9756AB.5040304@googlemail.com>
	<4C97D6D6.9040805@shorewall.net>
	<alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr>
	<4C988214.6050600@googlemail.com>
	<4C9911CE.6090209@googlemail.com>
	<AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTiny3JCZnWOwHs9OY1vWqTsWAfxFqkiRW5RrRxX+@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Tue, Sep 21, 2010 at 4:26 PM, Eric Paris <eparis@parisplace.org> wro=
te:
> On Tue, Sep 21, 2010 at 4:13 PM, Mr Dash Four
> <mr.dash.four@googlemail.com> wrote:
>>
>>>> http://www.spinics.net/lists/netfilter/msg49106.html
>>>>
>>>> I don't think that approach is right. =A0Exporting a number at ALL=
 is
>>>> broken. =A0It should only ever say the name.
>>>>
>>>
>>> I am aware of that and the proposed patch works as I did test it af=
ter Tom
>>> released it yesterday.
>>>
>>> As for your comment above - it is better than NOTHING.
>>>
>>> If you think that the current scenario, when I see meaningless numb=
er in
>>> the secmark field, helps me track the actual security context of th=
e listed
>>> connection, then think again, because there is NO way I could know =
what
>>> number maps to which context.
>>>
>>> Tom's patch at least gives me that mapping when I list the mangle t=
able,
>>> so it is a start and it works. Again, - the patch, if applied, is b=
etter
>>> than what currently exists in iptables. Also, 'exporting a number a=
t all' is
>>> NOT broken - look at Tom's patch again - it does not break anything=
=2E
>
> No disagreement that Tom's patch is better than what we have today, I
> just claim that what we have today is completely wrong, so this is
> only slightly better =A0 :)
>
> sids, secids, secmarks, or whatever you want to call that u32 is just
> a dynamically generated number which should only exist inside the
> kernel and should never be shown to userspace. =A0Loading secmark rul=
es
> uses a full context string and then uses that string to generate a u3=
2
> which the kernel can efficiently use. =A0When we display things back =
to
> userspace we should always be converting that u32 back to a string.
> I'm working on a patch to do this (actually it's compiling while I
> type)

My current patch looks like so:

cat /proc/net/nfs_conntrack

ipv4     2 udp      17 8 src=3D10.11.231.82 dst=3D10.11.255.156
sport=3D34095 dport=3D53 src=3D10.11.255.156 dst=3D10.11.231.82 sport=3D=
53
dport=3D34095 mark=3D0 secmark=3Dsystem_u:object_r:unlabeled_t:s0 use=3D=
2

ipv4     2 tcp      6 114 TIME_WAIT src=3D10.11.231.82 dst=3D10.5.30.68
sport=3D49241 dport=3D80 src=3D10.5.30.68 dst=3D10.11.231.82 sport=3D80
dport=3D49241 [ASSURED] mark=3D0
secmark=3Dsystem_u:object_r:compartment_packet_t:s0:c100 use=3D2

Does anyone feel like this is going to break some userspace
compatibility to send the string?  The number is useless and obviously
noone could have been doing anything with it (as Mr Dash Four
realized).  It shouldn't have ever been sent to start with but it has
been there a long time (7c9728c3).  Anyone have thoughts?

It appears that we send this information up some netlink socket in
nf_conntrack_netlink.c.  I'm not sure what is consuming this data so
I'm not sure how to test.  Anyone have any pointers?  I'm also worried
what such a change will do to users of this interface....

-Eric
