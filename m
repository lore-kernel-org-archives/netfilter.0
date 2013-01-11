From: Peter McAlpine <peter@aoeu.ca>
Subject: Re: Basic bridge routing via ebtables and iproute2
Date: Fri, 11 Jan 2013 09:43:32 -0500
Message-ID: <CAEDV4yqst5u+L7OcLi09x2O3TegYWiDS7drMXL08vLuxGuNpfA@mail.gmail.com>
References: <CAEDV4yqDKuEvafDsh=FpRGD4-AyXzcyU8-Z0aWdQ=_LV9A6C_g@mail.gmail.com>
	<CAJygYd1CC_FFmXNYRfZmX6UKBWM7PJJ5e1ym897CuJBeoebHsA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aoeu.ca; h=mime-version
	:in-reply-to:references:date:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding; s=aoeu.ca; bh=4NeiqknOu
	x/S/q4yUpwK3uQkXK4=; b=bSeKRzd2PZ7XafxtZb+riQAyHYRZb025Cxp4dYRRK
	+WwrX+WH+PRcyBf5Anm1udPK2VTgJvyT8TVZszia9gnQpUKRHKUyqyjo1KD7Suzh
	csLgumS/HiIX1gnaMPdOY5oms76ZxFwqjkkKQFVusVQ512dkL7PzNVHWsxHHNg94
	UM=
In-Reply-To: <CAJygYd1CC_FFmXNYRfZmX6UKBWM7PJJ5e1ym897CuJBeoebHsA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

Hi,

Thanks for your reply.

The end-goal is to be able to selectively route some traffic down a
tapX interface. Step #1 was to be able to route something without the
tapX interface.

My goal is similar to this:
http://ebtables.sourceforge.net/examples/real.html#example3
=2E.. but that didn't work for me. (note: I'm using OpenVPN instead of =
=46reeswan)

Since my email yesterday I have been able to broute traffic thanks to
this: http://ebtables.sourceforge.net/examples/basic.html#ex_brouter
However, I don't want my bridged interfaces to have addresses. I only
want the bridge to have a single address which is accessible from
either side of the bridge.

-Peter

On Thu, Jan 10, 2013 at 5:52 PM, =E5=8F=B6=E9=9B=A8=E9=A3=9E <sunyucong=
@gmail.com> wrote:
> maybe you can add some log in your iptables INPUT/OUTPUT/FORWARD chai=
n
> to see where the packet goes.
>
> But I'm confused about what you are trying to do here, is it for doin=
g
> transparent filtering?
>
> On Thu, Jan 10, 2013 at 11:28 AM, Peter McAlpine <peter@aoeu.ca> wrot=
e:
>> Hello,
>>
>> I am attempting to route bridged ipv4 traffic via ebtables & iproute=
2,
>> but am experiencing problems.
>>
>> [client 10.8.7.101] ---- eth2 (no addr)[brouter (br0: 10.8.7.10)] et=
h3
>> (no addr)---- [gateway 10.8.7.99]
>>
>> I have flushed all iptables and ebtables rules. All policies are "AC=
CEPT".
>>
>> At this point, pinging 'gateway' from 'client' is successful.
>>
>> Then I add an ebtables rule on 'brouter' to route traffic destined t=
o
>> 'gateway' via the routing table:
>> ebtables -t broute -A BROUTING -p ipv4 --ip-dst 10.8.7.99 --log-ip -=
j
>> redirect --redirect-target DROP
>> For good measure I also enable ip_forward:
>> echo '1' > /proc/sys/net/ipv4/ip_forward
>>
>> What I expect to happen:
>> 1) The packet comes in on eth2 on 'brouter'
>> 2) The ebtables rule matches the traffic and sends it to the routing
>> table (via the DROP target)
>> 3) The packet (destined for 10.8.7.99) matches the default route and
>> is sent to 'gateway'
>> 4) The packet is sent out eth3 to 'gateway'
>>
>> What is actually happening:
>> 1) The packet comes in on eth2 on 'brouter' - CONFIRMED via 'tcpdump=
 -i eth2'
>> 2) The ebtables rule matches the traffic - CONFIRMED via syslog
>> message due to '--log-ip' option in ebtables rule
>> 3) ... The packet vanishes.
>>
>> Can anyone help me figure out why this is happening?
>>
>> -Peter
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter"=
 in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
