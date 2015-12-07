From: Oliver Graute <oliver.graute@gmail.com>
Subject: Re: Marking frames with ebtables for iptables
Date: Mon, 7 Dec 2015 09:43:54 +0100
Message-ID: <CA+KjHfaK=qGZAvwCEZ1XNGcLBSQ6VE9z69E0XSxX_mfkHQ8TgA@mail.gmail.com>
References: <loom.20151202T145721-935@post.gmane.org>
	<5662CACC.9010809@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=LidF8hSYd5vwqvKXx8gQfeaYZXyzjnI926FXauin8Oo=;
        b=PbqjcJHwMb761eXFA+ipSMyOWLasi1Z2MYQxQ+My5jHvqEGq7pAVmXgWIdQLfR80PH
         dQViNLjTkn6bFqxC9AP5560cBUdxRi+UfK1hX6GwQHOkOc09R+uizu17GBJi66kjEqQF
         RY4tsoIiA/O8R+0hzzmaULHzxxB6aSLmsUHRSe2+VwCH90ixbwVLQvnY9f4aer32a5q+
         /2skuNUGzd8hQF/U5de+nN57XvM67dVPec7eMl4DcwPeSmLvnlZLDosLVcZg9Rl3+PVH
         egqkltn76hSwOMjlD1EPIIX6kFuAS7GWYj/tiTiJE8sRCIXeQfPYD4eAwrg9EBI8FQJ4
         0a8Q==
In-Reply-To: <5662CACC.9010809@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Sat, Dec 5, 2015 at 12:30 PM, Pascal Hambourg <pascal@plouf.fr.eu.or=
g> wrote:
>
> Hello,
>
> Oliver Graute a =C3=A9crit :
> >
> > I try to mark some frames with ebtables on MAC Layer to pass these =
mark to
> > iptables network layer.
> >
> > I build up a bridge interface br0, cleared all ebtables and iptable=
s tables
> > as preparation. Then I try something like this:
> >
> > ebtables -t filter -A INPUT -p IPv4 -s 00:11:22:33:44:55 -i eth0 -j=
 mark --
> > mark-set 0xffff --mark-target ACCEPT
> > ebtables -t filter -A INPUT --log-level info --log-ip --log-prefix =
EBFW
> > iptables -t mangle -A PREROUTING -m mark --mark 0xffff
>
> What's the use of this rule with no target ?


the target should be LOG or ACCEPT. Right now I only need to mark speci=
al tagged
frames coming from mac layer.

>
>
> > iptables -t mangle -A PREROUTING -m mark --mark 0xffff -j LOG --log=
-level
> > info --log-prefix MARKED
> >
> > i would expect that iptables log show me the marked packages from e=
btables.
> > But i see no mark 0xffff
>
> Check the packet flow diagram at
> <https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet=
-flow.svg>


thx that helps a lot for my understanding.

>
>
> You can see that if the packet is received on a bridge (blue
> background), ebtables/INPUT (blue header) comes after
> iptables/PREROUTING (green header). To avoid the iptables/ebtables mi=
x,
> you must disable iptables call by bridge-nf :
>
> echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables


>
> What is your goal ? If you just need to match the source MAC address,
> you don't need ebtables. Iptables has the "mac" match.


I just tried a "simple" example with "mac" match to understand the
ebtables/iptables mix.
But the real goal is to mark frames coming from a tagged port with a
3-bit PCP Field.
(IEEE 802.1p/ 802.1Q). Later on I want to proceed these marked frames
on IP-Layer to
set some ToS Bits. How is that done?


Best Regards,

Oliver

On Sat, Dec 5, 2015 at 12:30 PM, Pascal Hambourg <pascal@plouf.fr.eu.or=
g> wrote:
> Hello,
>
> Oliver Graute a =C3=A9crit :
>>
>> I try to mark some frames with ebtables on MAC Layer to pass these m=
ark to
>> iptables network layer.
>>
>> I build up a bridge interface br0, cleared all ebtables and iptables=
 tables
>> as preparation. Then I try something like this:
>>
>> ebtables -t filter -A INPUT -p IPv4 -s 00:11:22:33:44:55 -i eth0 -j =
mark --
>> mark-set 0xffff --mark-target ACCEPT
>> ebtables -t filter -A INPUT --log-level info --log-ip --log-prefix E=
BFW
>> iptables -t mangle -A PREROUTING -m mark --mark 0xffff
>
> What's the use of this rule with no target ?
>
>> iptables -t mangle -A PREROUTING -m mark --mark 0xffff -j LOG --log-=
level
>> info --log-prefix MARKED
>>
>> i would expect that iptables log show me the marked packages from eb=
tables.
>> But i see no mark 0xffff
>
> Check the packet flow diagram at
> <https://upload.wikimedia.org/wikipedia/commons/3/37/Netfilter-packet=
-flow.svg>
>
> You can see that if the packet is received on a bridge (blue
> background), ebtables/INPUT (blue header) comes after
> iptables/PREROUTING (green header). To avoid the iptables/ebtables mi=
x,
> you must disable iptables call by bridge-nf :
>
> echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables
>
> What is your goal ? If you just need to match the source MAC address,
> you don't need ebtables. Iptables has the "mac" match.
