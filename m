From: zrm <zrm@trustiosity.com>
Subject: Re: Hairpin NAT - possible without packet marking?
Date: Sat, 8 Jul 2017 15:54:00 -0400
Message-ID: <50f20723-a7c5-3130-9319-cb5ebec7f7c3@trustiosity.com>
References: <1363a246-966e-59fc-7d5a-efaf12aa6b51@dynator.no>
 <4c60ba2e-3e52-f55d-96e1-699c7821940d@pobox.com>
 <ea023673-d0c6-f8d8-0399-203a71e7fa62@trustiosity.com>
 <6773e78c-f0e6-508d-0a72-d5880705756d@pobox.com>
 <a3219c0b-2e2e-74d3-ae9b-88ec6ff35810@trustiosity.com>
 <1402388a-fb32-d7af-bc3a-6f25b8a2f47a@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mx.trustiosity.com;
        s=mx; t=1499543630; bh=kjPEWQTNy5KAfCUTDMt24KXSfgA/O4TWDZEdQY7UfmM=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=UqDPNsKDzOQIhseJB03uL9Qb3NuYTmBk1KXFKike+nWNsNCUz6bYGimb1cTSaOmpT
         ogG1no+zqT4yD5LzuWPDJC4IL8kA/+wnynbFtFak1efsJSb2sAOTzkii4CsNgDSk/H
         1PbOV0KjLhzXzhtkqYEpl69dpiEbWLRk8z3pDU/Q=
In-Reply-To: <1402388a-fb32-d7af-bc3a-6f25b8a2f47a@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Robert White <rwhite@pobox.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 07/03/2017 09:14 PM, Robert White wrote:
> I have no Good Information=99, but I suspect you could do a _stateless_
> NAT using ip rule and ip route commands that didn't need any packet
> marking. I'm not sure if that's a "netfilter" topic, per se, since
> stateless nat basically avoids the connection tracer and all that, but
> it looks a little brittle from what I've read. (I've never actually
> tried it as it doesn't seem to be the best choice.)

I looked into that at one point for other reasons, but it won't=20
translate ports, and according to the man page ip-route nat seems to=20
have been removed anyway.

> I've honestly go no clue why you cant use --in-interface in a
> POSTROUTING chain. I mean obviously --out-interface isn't going to be
> available in PREROUTING, but I don't see how the packet could have
> "lost" it's in-interface information at that point. The restriction
> seems arbitrary (absent some obscure technical detail I don't know that
> explains it) so I asked the question outright in a separate thread.
>
> nft allows the syntax for iif but I'm not sure if it works or not.

I'll have to test nft at some point. I expect to switch entirely to=20
libnftnl once distributions that don't have it have well died out but=20
until then it's simpler to use iptables everywhere.

>> I feel like isolating public services has always been backwards
>> anyway. An internal network with hard shell with soft middle means
>> that one compromised internal device becomes a big fire.
>
> That bit reads as self-contracictory to me. I don't understand what you
> are saying. The second sentence is exactly why one does the first.

What I'm saying is that it's better to isolate sensitive or vulnerable=20
systems from everything possible than trying to isolate everything=20
possible from potentially compromised systems.

Any system could be compromised. A public web server is not=20
significantly more likely to be than a user's laptop.

> So you should have a wall between the outside world and your public
> services, and then more wall between your public services and your
> private services and private users.
>
> The goal of isolating public services exists because the public can
> easily find and so more easily compromise a public service.
>
> So yea, real security happens in layers.
>
> If I crack your web server, you don't want that to put me in the same
> data flow as, say, your legal documents and company property and future
> salles leads and customer credit card info and whatever else you might
> not want to share with the world.

My argument is that public is not particularly rare or special.

It can make sense to e.g. isolate finance from advertising. And if there=20
isn't any _reason_ for the web server to talk to the finance systems=20
then by all means isolate them from each other too.

You're probably right that a public server is more likely to be=20
compromised than an equally well maintained internal server, but it=20
doesn't fare so well compared to _user devices_.

A random laptop is already exposed to browser vulnerabilities, email=20
attachments, third party wifi, etc. If it becomes "public" due to a port=20
mapped for VoIP or similar, that is not going to change the security=20
posture significantly. A non-zero number of the devices are likely to be=20
infected regardless and the same precautions should be taken either way.

So if the traditional model was to separate public servers from internal=20
servers and user devices and then lock down the public servers, I would=20
argue a better model is to separate public servers and user devices from=20
internal servers and then lock down the internal servers.

> So you set up your firewall around your web service and you screw it
> down tight. If the public can only use http and https then clearly
> that's all you allow from the public net. And if the web server will
> only send back answers on those sessions, then you don't let the web
> server initiate _any_ connections from itself to the internet.

Once the attacker has control over the server, none of that really=20
matters. Making the attacker have to export the data back through that=20
self-same tcp session is just an inconvenience when they can do just that.

Network-imposed default deny, especially for outgoing, also tends to=20
produce false positives, and that has security implications too. For=20
example, if you prohibit all outgoing connections, can the server get=20
updates? Send alert messages?

But opening only the HTTP[S] ports for updates (or any other reason)=20
falls into the ecological damage trap.

If a critical mass of networks block everything but HTTP then everything=20
will just use HTTP, which only makes everything slower, more complicated=20
and less secure than it should be. And defeats its own purpose because=20
default deny with HTTP open becomes equivalent to opening everything --=20
including things you might have wanted to explicitly reject.

Better to reject things you know you want to reject and just log things=20
you don't expect. Because rejecting things you don't expect only forces=20
everything to look like the things you do expect, which in the end makes=20
it impossible to distinguish anything when you do want to explicitly=20
reject something.

> Sure individual offices have locks on their doors, and individual desks
> have locks on their drawers, but if you say the big locks on the front
> doors and the individual security gates throughout the campus are just
> for "weak legacy desks" you've utterly missed the point.
>
> The key phrase you should ponder is "Defence in Depth".
>
> The little locks just slow people down once they are inside the
> building. It's the big locks on the well designed outer doors that do
> the most good.

In practice poor exterior security is common; anyone can show up at 9AM=20
and walk through the door behind 50 other people. Businesses with=20
walk-in customers generally don't even lock the exterior doors.

Moreover, sensitive information like HR and finance records is kept=20
double-locked and access-restricted even inside the building.

And the main deterrent to physical intrusion isn't locks, it's the law.=20
That doesn't work for network security because the attacker is outside=20
your jurisdiction and behind seven proxies.

Security as a self-DoS is a thing but that's the point. It's more=20
practical to store your sensitive business records in a safe and keep=20
unauthorized people out of the safe than to store them in the driveway=20
and have to keep everyone out of the campus.
