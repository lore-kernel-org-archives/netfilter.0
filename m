From: Mike Dillinger <miked@softtalker.com>
Subject: nftables: Strange Error When Adding Element to Named Set
Date: Fri, 8 May 2020 07:06:56 -0700
Message-ID: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

This has been a problem since my kernel was upgraded to 5.6. Everything was=
 fine prior to that where I was running the 5.5 kernel.

I'm running Debian testing and here is some information regarding my system:
$ uname -a
Linux rockenfield 5.6.0-1-amd64 #1 SMP Debian 5.6.7-1 (2020-04-29) x86_64 G=
NU/Linux
$ nft -v
nftables v0.9.4 (Jive at Five)

I have a script that blocks IP's by adding them to a named set, and the nam=
ed set has a 12 hour expiration.=A0 After about a day of uptime, I start ge=
tting the following error.=A0 I'm obfuscating the IP address with "a.b.c.d".

$ nft add element ip filter blacklist4-ip-12h { a.b.c.d }
Error: Could not process rule: File exists
add element ip filter blacklist4-ip-12h { a.b.c.d }
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

I can check the named set and no such IP address exists, and double checked=
 using grep.=A0 Here's the kicker: if I reboot, it works fine. The blacklis=
t4-ip-12h set has 191 IP's so it shouldn't be a matter of too many IP's.=A0=
 I've had up to 300 in the set before with no problems.=A0 If I had too man=
y IP's, I'd expect the same behavior after a reboot which is not the case.=
=A0 It's not an issue with any particular IP address; rather it disallows a=
nything being added to the named set entirely.=A0 Here are the properties o=
f the set in case something is wrong there:

 =A0=A0=A0 set blacklist4-ip-12h {
 =A0=A0=A0=A0=A0=A0=A0 type ipv4_addr
 =A0=A0=A0=A0=A0=A0=A0 flags interval,timeout
 =A0=A0=A0=A0=A0=A0=A0 timeout 12h
 =A0=A0=A0=A0=A0=A0=A0 gc-interval 1m
 =A0=A0=A0 }

If the set properties look OK, then I'm fairly confident this is a bug.=A0 =
I wanted to know if it's a kernel issue or an nftables issue, and also wher=
e to go to file a bug, and I can take it from there. I'm not sure when nfta=
bles was upgraded if we're suspecting nftables.=A0 I'd need to do some digg=
ing.

Any help is greatly appreciated.=A0 Having to reboot daily to work around t=
his issue is not desirable.

Thank you!
-MikeD

