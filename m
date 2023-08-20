From: =?UTF-8?Q?Anselm_Sch=C3=BCler?= <mail@anselmschueler.com>
Subject: Why does the cgroup iptables extension not work generally with the
 INPUT chain?
Date: Sun, 20 Aug 2023 23:44:37 +0200
Message-ID: <4632b041-7f66-454e-be35-d0a00e5700ba@anselmschueler.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Note: This question concerns the kernel component part of the iptables 
system. I am not sure if this is the appropriate place for discussion on 
this or if it's only for the userland utilities. If this message is not 
in the right place, please inform me.

I recently wanted to use the cgroup iptables extension to allow incoming 
traffic for ports with a certain cgroup listening on them. Unfortunately 
I discovered the disclaimer in iptables-extensions(8), which states that 
the extension "will only match on packets that are processed for local 
sockets through early socket demuxing" on the INPUT chain. I must 
confess I do not know precisely what early socket demuxing is, but brief 
testing seemed to reveal that my packets weren't doing it. This leads me 
to ask: Why is this the case? Is there a workaround? Could this be fixed?

A cursory glance through the kernel git tree revealed to the novice's 
eye no obvious hacky logic or similar that might lead to this. Is there 
some general iptables-extensions-specific configuration logic that 
requires some conditions, not in the logic, but in the infrastructure 
code (extension registration or what have you) for this to work?

I considered attempting to fix the problem myself but I realized I can't 
without even knowing what the issue is.

Preempting X/Y problem accusations, here is the motivation: I use 
iptables to operate a generic home user firewall for my system but I 
want to allow GNOME file sharing (which doesn't use a designated port, 
but is assigned to a cgroup by systemd) through the firewall.

I am currently not subscribed to the netfilter mailing list. If 
subscribing is necessary to participate please let me know.

