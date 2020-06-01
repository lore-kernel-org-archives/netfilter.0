From: Mike Dillinger <miked@softtalker.com>
Subject: Re: nftables: Strange Error When Adding Element to Named Set
Date: Mon, 1 Jun 2020 09:07:45 -0700
Message-ID: <8f6e2bfa-3e79-7ba8-8561-4478fa28e24a@softtalker.com>
References: <d2711bf1-2a50-ff35-e632-a39ca0df33f4@softtalker.com>
 <20200508160132.GA2278@salvia>
 <10558cf4-649d-2075-857e-cf9abf580de8@softtalker.com>
 <20200601124124.GA12580@salvia>
 <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8d9aecd2-6ac4-9395-8bd8-79fb5896f22c@softtalker.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, sbrivio@redhat.com

Yes, I have found a way to reproduce it.

Add the set:
nft add set ip filter blacklist4-ip-1m {type ipv4_addr\; flags interval,tim=
eout \; timeout 1m \; gc-interval 1m\;}

We're not concerned about the IP's that are added to the set because there =
are no rules covering what to do with the set contents.

I wrote a bash script called nftables-bug-repro:
#!/bin/bash
nft list set ip filter blacklist4-ip-1m
for ((i=3D1;i<=3D10;i++)); do
 =A0=A0=A0 nft add element filter blacklist4-ip-1m {$i.$i.$i.$i}
 =A0=A0=A0 sleep 1
done
nft list set ip filter blacklist4-ip-1m

This script actually shows some other odd behavior.=A0 In addition to the i=
naccurate information of IP's already being in the list, the kernel seems t=
o create its own interval/ranges.=A0 Running the script every minute create=
s a different set of errors too.=A0 This definitely seems related to the ti=
meout setting; my other sets are working fine since reboot but I expect tha=
t to change later after IP's have expired.=A0 Below is a sample output run:

$ nftables-bug-repro
table ip filter {
 =A0=A0=A0=A0=A0=A0=A0 set blacklist4-ip-1m {
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type ipv4_addr
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 flags interval,timeout
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 timeout 1m
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gc-interval 1m
 =A0=A0=A0=A0=A0=A0=A0 }
}
Error: Could not process rule: File exists
add element filter blacklist4-ip-1m {1.1.1.1}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Error: Could not process rule: File exists
add element filter blacklist4-ip-1m {2.2.2.2}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Error: interval overlaps with an existing one
add element filter blacklist4-ip-1m {4.4.4.4}
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^^^^^^^
Error: Could not process rule: File exists
add element filter blacklist4-ip-1m {4.4.4.4}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Error: interval overlaps with an existing one
add element filter blacklist4-ip-1m {5.5.5.5}
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^^^^^^^
Error: Could not process rule: File exists
add element filter blacklist4-ip-1m {5.5.5.5}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Error: interval overlaps with an existing one
add element filter blacklist4-ip-1m {6.6.6.6}
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^^^^^^^
Error: Could not process rule: File exists
add element filter blacklist4-ip-1m {6.6.6.6}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Error: interval overlaps with an existing one
add element filter blacklist4-ip-1m {7.7.7.7}
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^^^^^^^
Error: Could not process rule: File exists
add element filter blacklist4-ip-1m {7.7.7.7}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Error: interval overlaps with an existing one
add element filter blacklist4-ip-1m {8.8.8.8}
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^^^^^^^
Error: Could not process rule: File exists
add element filter blacklist4-ip-1m {8.8.8.8}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Error: interval overlaps with an existing one
add element filter blacklist4-ip-1m {9.9.9.9}
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^^^^^^^
Error: Could not process rule: File exists
add element filter blacklist4-ip-1m {9.9.9.9}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Error: interval overlaps with an existing one
add element filter blacklist4-ip-1m {10.10.10.10}
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^^^^^^^^^^^
Error: Could not process rule: File exists
add element filter blacklist4-ip-1m {10.10.10.10}
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
table ip filter {
 =A0=A0=A0=A0=A0=A0=A0 set blacklist4-ip-1m {
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type ipv4_addr
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 flags interval,timeout
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 timeout 1m
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gc-interval 1m
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 elements =3D { 3.3.3.3-255.2=
55.255.255 }
 =A0=A0=A0=A0=A0=A0=A0 }
}

Notice the bizarre range declaration, as well as 1.1.1.1 and 2.2.2.2 missin=
g even though the kernel claimed they were already present.

Here are my kernel and nftables versions:
$ uname -a
Linux rockenfield 5.6.0-2-amd64 #1 SMP Debian 5.6.14-1 (2020-05-23) x86_64 =
GNU/Linux
$ nft -v
nftables v0.9.4 (Jive at Five)

Thanks!
-MikeD
