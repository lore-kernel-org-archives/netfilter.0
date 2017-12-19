From: Robert White <rwhite@pobox.com>
Subject: Re: Nftables atomic reload at reboot
Date: Tue, 19 Dec 2017 01:47:14 +0000
Message-ID: <ea323699-ab40-e022-963a-ede124e7aa99@pobox.com>
References: <69931d71-baa9-d2ae-9a43-242aeb6a709f@justdev.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <69931d71-baa9-d2ae-9a43-242aeb6a709f@justdev.ca>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff <jarvis@justdev.ca>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I missed you on my reply to the group and I don't know if you are a
subscribed member, so here is a repeat with some better explanation.

The way I handle these sorts of situations is to use interface group
numbers. It's not super obvious but it is super easy. The whole set of
all group numbers is available even when no interfaces are assigned to
the numbers.

so

"iif" and "oif" is the interface by unique number, and can not be
predicted by the kernel as it's driver initialization order dependent.
It also varies by the addition and removal of temporary endpoints like
VPNs and tunnels. The "nft" command simply looks up the number of the
interface when you use a name after the opcode. That means "iif ppp4"
can only be resolved if ppp4 exists when the nft command is run.

"iifname" and "oifname" simply preserve the string you provide and do a
string compare at runtime. You can add and remove the named interface
and the rule set just doesn't care. But it's slow because you are doing
string compares.

Both also suffer from scaling issues as if you have a hundred interfaces
(not likely, but not impossible) then you need to have rules for all 100.

Sets let you cut that down by a bunch.

But what _I_ do is use interface _group_ numbers.

Interfaces are instantiated in the "default" group, which is zero.

You assign a group number to an interface with the ip command. But the
syntax is poorly documented. The manual pages define "group DEVNUM" as a
_selector_, just like "dev DEVNAME". It's a selector in that if you do
something like "ip set group 5 down" all the interfaces in group 5 will
be shut down. (This is a feature). But when you use "ip set dev DEVNAME
group DEVNUM" then the "group" stanza is an assignment.

So I run a fairly simple site, where I picked one (1) as the group for
all my ingress/egress ports, and all the numbers greater than one
represent internal purposes. Group 2 is all my raw internal ports. Group
3 is my bridges. and so on (in my other post I swapped 2 and 3 by accident).

The important point is there is a fixed numeric break between the low
"untrusted" port group numbers, and the higher "trusted" port group numbers.

In a complex site, like if you offer PPP service, you might want the
break number to be higher. with 1 for PPP (the least trustworthy) and 2
for wired public interfaces, and your trusted domain starting at 3. That
way you can filter things like DCHP to be legal on 2 and above, but
preventing your PPP clients from trying to inject DCHP packets (or
whatever).

Anyway, you can now write a concise set of rules using just the group
numbers and, most importantly, load those rules before any interfaces
are active at all.

You can now load a fixed and static set of rules that are much simpler.

iifgroup 1 tcp port {http,ssh} counter accept
iifgroup gt 2 counter accept

etc.

You can also design the rules to explicitly or implicitly just
block/drop/reject any interface in group 0.

Then in your various interface up and down scripts you use the ip
command to put the interfaces into their groups at the point you
consider them "ready".

You can even migrate an interface between groups at will. Like maybe
pppX before and after some validation event. (It's also a good way to do
bad things like redirect a soft PPP link to a login page and then bump
it into full service after the login is validated.)

In general, if you pick the numbers wisely you can get a lot of very
good results with extremely high performance and none of the mess.

ASIDE: Group numbers work equally well in iptables, and I've been using
them there for years. I'm still migrating to nft.

It's also a great help to shutting down or stopping an intrusion and
such since "ip link set group 1 down" closes many doors all at once.

So proper use of interface groups can make things way more simple and
quite a lot faster for your task.

--Rob.
