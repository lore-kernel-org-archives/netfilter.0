From: =?ISO-8859-15?Q?J=F6rg_L=FCbbert?= <j.luebbert@login-lanstation.de>
Subject: Netfilter and performance
Date: Sat, 17 Nov 2007 14:24:20 +0100
Message-ID: <473EEB84.3@login-lanstation.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

In an effort to optimize my rule generating script, I came to a point=20
where I wonder about the internal workings of iptables and about which=20
is faster and what not. Maybe you guys can help me out with the 3=20
scenarios I wonder about:

=46irst:

What is faster. Matching "-m state --state NEW" or "-m mark --mark 1"=20
for every packet? Probably makes no or little difference, or?



Second in an extra chain of the mangle table:

many_matches -j MARK --set-mark i
-m mark --mark i -j RETURN
many_matches -j MARK --set-mark j
-m mark --mark j -j RETURN
more like these for an undefined number of times

or

many_matches -m mark ! --mark 0/0 -j MARK --set-mark i
many_matches -m mark ! --mark 0/0 -j MARK --set-mark j
more like these for an undefined number of times

So here we have one extra rule per match with the advantage to skip the=
=20
rest of the rules as soon as one packet is marked vs one extra rule per=
=20
match without the possibility to skip the rest of the matches.



And third, also in an extra chain of the mangle table:

many_matches -j CLASSIFY --set-class i:j
same_as_above_matches -j RETURN
many_matches -j CLASSIFY --set-class n:m
same_as_above_matches b match b -j RETURN
more like these for an undefined number of times

or

many_matches -j MARK --set-mark i
-m mark i -j RETURN
tc filter add ... handle i fw flowid n:m
many_matches -j MARK --set-mark j
-m mark j -j RETURN
tc filter add ... handle j fw flowid o:p
more like these for an undefined number of times



Thanks for your help

- J=F6rg L=FCbbert
