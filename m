From: Robert White <rwhite@pobox.com>
Subject: Re: Full NAT forward and source routing - possible without packet
 marking?
Date: Sat, 1 Jul 2017 20:26:16 +0000
Message-ID: <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: oyvind@dynator.no, netfilter@vger.kernel.org

On 06/30/2017 01:55 PM, =D8yvind Kaurstad wrote:
> Hi,
> ... stuff deleted for brevity ...

What you describe is what virtually every router does, that being taking
in packets on one port and pushing them back out on another.

I think you are over-thinking, and so over-dressing your rules. One does
not typically rewrite the packets _leaving_ your router on your local
subnets.

So, for instance, once you DNAT the incoming packet you _don't_ want to
SNAT it.

(ASIDE: Note going forward that I use "ext0" or "ext1" etc for my
"external", e.g. public facing interfaces-so your ppp0-in my rules. I
call my internal bridges "int0" etc, and the physical interfaces "loc0"
etc for local.)

For example, here's my XBOX and VONAGE rules:


iptables --table nat --append PREROUTING --in-interface ext0 --proto udp
--match multiport --destination-ports ${VONAGEPORTS} --jump DNAT
--to-destination ${VONAGEIP}

iptables --table nat --append PREROUTING --in-interface ext0 --proto udp
--match multiport --destination-ports ${XBOXLIVEPORTS} --jump DNAT
--to-destination ${XBOXLIVEIP}

I don't know or care about the real source addresses, ever, because the
target devices (my xbox and my vonage router) will just reply to the
(default) gateway and the reply goes back where it came from, which is
the whole point of connection tracking.

So in all cases, any NAT flow (a flow being a TCP connection, or two-way
UDP exchange) has a basic structure:  I -- R -- E.

I =3D=3D Internal Device.
R =3D=3D Router.
E =3D=3D External Device (the internet).

In all cases, the external device (E) thinks it's talking to the router
(R), but the internal device (I) always knows it's talking to the
external device (E).

So R's job is to hide the existence of all devices I from all devices E;
but all devices I know and believe they are talking to E directly.

Also understand that you are really just dealing with the first packet
of any flow. Unless you do some very special work, the second and
subsequent packets of a flow wont really even traverse your ruleset as
the connection tracker will recognize the response as part of an
established flow and automatically and magically perform the reverse magic.

So you should _NEVER_ SNAT packets leaving the router onto a private
segment, e.g. to devices I.

Here's the guide:

If the flow starts with a external device E, then it should hit a DNAT
rule to translate the _destination_ address to some device I.

If the flow starts with an internal device I, then it should hit an SNAT
rule (either real SNAT or Masquerade, which is just automatic SNAT so
that you don't need to code the actual IP address of the public port).

You should always have an established and related rule to catch some of
the overhead conditions and let data flow as it should.

The second and subsequent packets in a flow are handled by system magic
and so don't touch any of your rules in detail.

So here's your error:

> Then I have a DNAT-rule to translate the destination address to a
device which is behind eth1 (so packet will just be forwarded). I also
have masquerading enabled, so the source address is also rewritten when
it exits eth1.

You should _NEVER_ SNAT or Masquerade the internal adapters. It's both
harmful and pointless.

So your SNAT/Masquerade rule should be limited to the ppp0 device.

iptables --table nat --append POSTROUTING --out-interface ext0 --jump
SNAT --to-source ${PUBLICIP}

... more to consider ...

In the original and "most correct" form, a DMZ, named after the
"demilitarized zone" concept, is a semi-public network segment _between_
_two_ _routers_.

I -- R1 -- D -- R2 -- E

All hosts D appear behind DNAT rules in both R1 and R2. All hosts I can
initiate connections to all hosts E _and_ all hosts D, but all hosts E
can only initiate connections to all hosts D, and all hosts I are
completely invisible to all hosts E.

It is now common for people to do a "dogleg DMZ" where the D hosts are
on one adapter (say eth1) and the I hosts are on another (say eth0).

In this case, the rules work the same but get a little redundant.

So let's pick some unambiguous names:
extN =3D=3D a public facing interface.
intN =3D=3D a private interface.
dmzN =3D=3D the dogleg with the common services.
$PIP =3D=3D The well-known IP address that users use to access a service
like the web server.
$DIP =3D=3D The actual IP address of the actual web server
$DSIP =3D=3D The IP address of the DMZ adapter.

First, that IP address goes on the external interface:
ip address add $PIP dev extN

And the DMZ adapter gets its IP address
ip address add $DSIP dev dmzN

Next, all incoming traffic from non-dmz hosts for the DMZ service gets
the DNAT treatment:
iptables --table nat --append PREROUTING ! --in-interface dmzN
--protocol tcp --destination $PIP --destination-port 80 --jump DNAT
--to-destination $DIP

Note that I exclude/prevent bounce-back on the dmzN port just for
completeness. Other than that, if it's my well-know public IP address
$PIP and port 80, it goes to the web server at $DIP and that's it.

Next, anything leaving via extN needs to appear to have come from the
single host $PIP, so we need one SNAT rule.
iptables --table nat --append POSTROUTING ! --in-interface extN
--out-interface extN --jump SNAT --to-source $PIP

See that I prevent bounce-back source-routed attack reflection by
refusing to SNAT anything that came in on the same interface it's
leaving via. This is a small protection (since you said you turned off
rp_filtering, which you really should never need to do).

And that's basically it.

All hosts, public and private, can find your web server at $PIP:80 and
your internal hosts on intN can all reach the internet.

(I skipped the ACCEPT rules and all that since this was a discussion of
address translation and not policy.)

If dmzN and intN interfaces are the same thing, then you just have to
connect to the IP address of the service by its true/private IP address
instead of your public one (as you don't ever really want to route
packets out the same interface they came in on anyway) and that's a
problem best addressed by DNS and or /etc/hosts files if you must.

A full two-router DMZ is very like the dogleg. The public-side router
knows all about the internal network, does SNAT and can only DNAT to the
DMZ hosts; and the private side router also DNATs to the DMZ hosts but
does no SNAT at all. Then the DMZ hosts need routing information to pick
the best host for each flow; this can be done with static tables, dhcp,
or redirect messages as you find most convenient.

Hope this helps.
