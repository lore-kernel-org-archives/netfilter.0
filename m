Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F3F86352
	for <netfilter@vger.kernel.org>; Mon,  6 Jan 2025 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736180869; cv=none; b=PNxFNesAcnHYhLZPV3zsvlEHWHi8C18H/XBdfrkb5Md8rtGXtZZJj3MPcmkA0s2nqm6VlVoDs83+x+6IUH+x5dFiOy7nKZzFmkXU+hXPNEJw8crq2HPLp0Ny15kK+8G0SVmU/dYB43ksgziRqH431ECZPG9+UyvDZnxwQMsiEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736180869; c=relaxed/simple;
	bh=RHMNX/4Nm1jC9Vrj4BhlxfHPlKwU6Tk9/zXQ0mSdF1k=;
	h=MIME-Version:Message-ID:From:To:Subject:Content-Type:Date; b=I7DSf4oleu/Hizj5wKi1xLM76b4Dz5iNnFbNX7sUzbLqA3NKrEnEPZbr8U3Oa4equN9JbtEkmaflacT0J4KcZ0jKtKGqAI4m4zg4EwvFkU07pQogCOxaC67GiduhUIGN9s9Ck807Ozmwmk0AONpfFMT/ZcdhPcKoTAUtAzjCxVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=potatojuggler@gmx.net header.b=pKW/QXUZ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=potatojuggler@gmx.net header.b="pKW/QXUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1736180865; x=1736785665; i=potatojuggler@gmx.net;
	bh=RHMNX/4Nm1jC9Vrj4BhlxfHPlKwU6Tk9/zXQ0mSdF1k=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Subject:
	 Content-Type:Date:cc:content-transfer-encoding:content-type:date:
	 from:message-id:mime-version:reply-to:subject:to;
	b=pKW/QXUZPFKL9EI1NhpFhqh4IvEXlB/ORlEhfJy3H+OqWDn3gD9UdICpjh0cO5K/
	 3MbGNjCBwuDmeta/rR7KUhM0ltm5umk7MqaMReC/rB2Xi4nucOJvQAewYl9mfxWS8
	 KIx5eUQsmL7OmPUeWunS5MU/AAhsgctk6rzncUfojW2Wfb8RnAP6yw0No1n7ZJwIV
	 OvkDy+BaZwQ5DDSmvG3/bYdYX7sdGE+RXwIUpSkCILBl7TpzHVoOa3ld1x7BVyf4Y
	 00i1W0LRTXLzy6CP85t6kJ1wMzS7Ta8KDdkCu2HnXKzyovT3lhexXbZG2McHLbip4
	 zA+qmxEGEG2wY3WLlg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [86.56.211.2] ([86.56.211.2]) by
 trinity-msg-rest-gmx-gmx-live-548599f845-9tnlq (via HTTP); Mon, 6 Jan 2025
 16:27:44 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-8c3627be-7f9f-4150-a74a-5a69dbd8781a-1736180864807@trinity-msg-rest-gmx-gmx-live-548599f845-9tnlq>
From: potatojuggler@gmx.net
To: netfilter@vger.kernel.org
Subject: aggressive firewalling via nftables
Content-Type: multipart/mixed;
 boundary=trekuen-e6ae0723-e21f-40b4-9481-2a5602b2c73f
Date: Mon, 6 Jan 2025 16:27:44 +0000
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:iToQ90bT8pH8SASmYGAo8NMq6F4DKrtnMGGDxQ+LukFjef3RRyvwajLfeoF54o24cKiPP
 YlmaUlg5GlLXX9MfsatCxlDwkJ5v9Tcy19XRR8wHY8NNP8l0qmIH6YKwEjyA2/ukIZazeP7SMpqi
 a1/MPK/jcfIBIO1R/q5mWmax2P09eMLTnMN/85B0WMkAdpfhAqzitd6GYxI5l77okIPADXrQLPbQ
 H6ryWKTHZJPVK15+ub92QIbSBCOBOAcQj/oW6Vek8Ttn9L8jzcCENBpjmrrliCtRUOUrQrVninir
 9GFeuETj61hRzhj1uhcR2BvtRP7JdVhxtzxY4My+FKa6xiRvngEzfxb7fcNPGfs3S1SlrbTS1t5P
 CklGOcynJNq
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iiUIvrniia4=;vQuQ6x3rUMmzpBXNc5vi36HyiAs
 Q8u0ZFI9cqjGkgXQ9arLYEO+wpZAz0heAt4veFh3v2rKsFSlnH8AyVYPislfLwz6jUELSO/8c
 t0yMhEA4KQiEWxeJM9EIF40g47p8mEi0mR9fhnyBae5todmynPbpRzG6L4G1NA/fVvgGIENJA
 QZC6OleyN8NBxm3KQaXfYY1IdZ5LZz0P9eqF1EjJX9wBJ8axoItMi7Ht2Lnd1u+E0RiSuvzSj
 /8Ztx5tjddLC/2FV+HRjqSwzu+P5Qq638QQAnVl6WfWSpfMwS9iFm0uSKVhBYApf+XD57GhjM
 gjS+EybJPeFVvFuLjtNSBve5wW6Q9+BFK8IJkIq8L5m5t5EsU39I/v+VeQ9YcB6IJs5GhYmPh
 eIhpegMXq9TzH9q0lyHpwgW0GUz1Waus0mH6Uioj/HVUvsbO3uwLu23UBnFAH/4e4vS/7PosA
 ZGZ5rD9Vnc/rCUuY2bwHHq/Vf7I6sX7H8unarnP6gbZygFr4AR85phb+/m+DMcHaOEGP3O0u0
 w0g9ksU7B45viPOUJxDM/YdwWtb+fadaYJBZDDwNFqAdjtYwfaTv48n0KCub4QvA2KbXuEKzm
 sbl+ucyXxOej23swbufGBUL/zdYyRvreX3mXZ62PO4yGxzUXf3J1LOIfO1fMvwTjAyCn5mvgO
 kmXYlRg3kj8wtbpt1Z9kIbj0ET8xjq17eAyj8HBE/AcZmGG23+B/RbYEonIX8H/RdRgeC2phB
 m4qvgBvfWH7H4mLuBxYZbzqNt9eSd3zNrbnMABEzdYqRwKmV4zAzWJDTNrK7pjHkS8fgREnk6
 S+xRlz4c7uFqyR+qKKAx71hgCgPqBG+Ru4P1tyAsf/Lb4caWXGVxxATPOGaOY+sRISzM/D7DK
 tFBZEu8XC/EhZjwE0bLdXdU0yt31YA6LgXTk=

--trekuen-e6ae0723-e21f-40b4-9481-2a5602b2c73f
Content-Type: text/plain; charset=UTF-8

Hi folks,

some time ago I stumbled over a very interesting blog post about agressive firewalling via pf on OpenBSD.
TL;DR version: someone tries to connect to an unused port or probes around -> warm welcome to the temporary blacklist
https://blog.thechases.com/posts/bsd/aggressive-pf-config-for-ssh-protection/

Around fall of last year I took it as a guiding rail and wrote my own aggressive nftables firewall (on Debian), using it quite successfully ever since.
Here is my scope and the questions I have, before the wall of text rolls in.

In scope:
- support IPv4 & IPv6
- compact and modular configuration files
- up to transport layer
- inbound traffic
- temporarily blacklisting potential attackers (minimizing / avoiding false positives)
- rate limiting (concurrent connections / new connections per minute)
- DoS mitigation
- DDoS mitigation / softening (I know this will not be able to counter large scale attacks)
- Linux kernel parameters
- performance (runs on a VPS)

Questions:
- how to do new connection rate limiting, but spoofing-proof against valid addresses (at the very end of the mail)?
- any glaring issues with my rules, which I just didn't run into yet?
- do all rules tracking an address require me to set up a set?
- should i prevent syn flooding via nftables, or are activated SYN cookies in the kernel enough?
- should i have net.ipv4.conf.eth0.rp_filter set to strict or loose? (is deactivated ootb on my VPS)
- if you have good idea and valid concerns, let me hear about them, always eager to improve ;)

The firewall consists of /etc/nftables.conf and modules I store in /etc/nftables.d/.
Modules make adjusting behavior easier, since I just need to comment out an include.
This also allows me to automatically load different configurations without certain modules if there is nothing going on, or load them, if the server is currently experiencing DoS attacks (dynamically switching configuration is not in scope of this post, just wanted to mention my reasoning).
All of those files/folders are "chown root:root" and "chmod 770", since I do not see a reason to allow anyone besides root to read them.
The content of those files can be seen in the attached ZIP.
Since I do not know if attachments go through on the mailing list (first time poster), I also have them here on pastebin: https://pastebin.com/i2xe1Byz
Addresses and the SSH port in the files have been rewritten in this writeup for security/privacy reasons.
The numbers used for the amount of connections etc. are of course dependent on the expected server load - treat them as guidelines, not final values.

Before I go into detail about each file, here my findings after logging packets on a completely new server for 7 days (no tracking packets from my home and ones the lo interface).
IPv4: 61,300 | IPv6: 26
TCP: 60,662 | UDP: 382 | ICMP: 282
Port#22: 30,980 | Port#30333: 17,204 | Port#445: 2,605 | Port#23: 225 | Port#8443: 222
As you can see, around half of packets were sent to the default SSH port... the second most one seems to be something related to crypto.

/etc/nftables.conf
Instead of the default "flush ruleset" I run "add table inet filter {}" followed by "delete table inet filter" (Debian does not support destroy yet).
Add does not throw an error when the table already exists (daemon restart), but makes sure it does for the following delete, so it does not fail on system startup.
This allows other tables than filter to remain in place, only rebuilding the latter.
In theory this should allow Docker for example to still work (without restart), even when the nftables deamon is restarted or "nft -f /etc/nftables.conf" is called.
The policy is "accept", but I still call accept rules for performance reasons, since evaluation is concluded early.
There are only 3 rules in the main file, which are always valid: allow traffic on loopback interfaces, as well as established / related connections (server asks for Debian updates), but drop invalid packets.
Everything else is loaded from the modules.

/etc/nftables.d/protocol.nft
Right now I only run TCP services on my server, and ICMP is needed for correct network functionality (had issues with IPv6 otherwise).
Things like QUIC should work as well, since the TCP handshake goes through, and the UDP traffic afterwards should be allowed by "ct state established, related accept" in the main file (not tested).
Article about ICMP: http://shouldiblockicmp.com/

/etc/nftables.d/white.nft
Sets containing my address at home and my other servers.
Traffic from them is allowed in general - this only goes for TCP traffic since the address is verified via handshake (someone else could send UDP packets with one of my addresses).
Running these before the blacklist prevents blocking myself by accident.

/etc/nftables.d/black.nft
Sets containing the public ports in use by me as well as naugthy machines.
Blacklisting is done in 2 rules: one checks for connections to unused ports, blacklists and then drops the connection, the other one checks if the address is in the naughty set.
This temporarily blocks traffic on valid ports as well, once a bad connection attempt has been detected.
At the end there is another include which tries to reload the contents of the blacklist sets (the star in the filename prevents error if they do not exist).
The data for those is prepared via a cron job, which runs a Python3 script (see other files in the ZIP).
Losing the contents of the temporary blacklist is not the worst thing in the world, but I prefer to be able to rebuild after a service or whole server restart.

/etc/nftables.d/ct-count.nft
Contains a set to limit the number of concurrent connections per IP address.
It works according to my tests, but I don't quite understand how the set entries are released.
Garbage collection seems to be involved for set cleaning, according to the man pages.
The entries seem to automatically be deleted, once all established connections are terminated.
To be honest it is a bit confusing how set cleanup happens in some instances (timeout is not even valid in those sets it seems).

/etc/nftables.d/limit-rate.nft
Contains a set to limit the number of new connections per IP per minute.
On the surface level it works - but there is an issue in my opinion: someone can send tons of forged packets with spoofed valid IP addresses, causing innocent machines no longer be able to connect.
Right now the rule uses "ct state new" for matching, but this is during a time, when the TCP handshake has not been fully performed yet, so anyone could trigger these rules.
What I probably need is a rule, which only matches the first ACK package sent as response to the SYN ACK from the server (further ACK packages are sent as keep-alive packets on HTTPS for example).
Maybe I need to filter for a specific sequence / ackseq, but I was not successful so far and I am really exhausted after trying unsuccessfully for days.
Could also be that I need to write a rule with a lower priority - the ACK packet for concluding the handshake is already seen as an established connection it seems.
Perhaps someone else has an even better idea.
The key takeaway is, that I need to track each new connection per IP address, but only once and only when it is verified.
Once the new connections are tracked via rate limit, I can drop new connections already at the SYN step.

Best regards and thanks for your time!

--trekuen-e6ae0723-e21f-40b4-9481-2a5602b2c73f
Content-Type: application/x-zip-compressed
Content-Disposition: attachment; filename=aggressive_nftables.zip
Content-Transfer-Encoding: base64
X-UI-Content-Hash: 8e60514f2dcc36c00d7f117552e3e9c847027d62b09290fc5fee8bcd2f5a23ec

UEsDBBQAAAAIAOR6JlqLORFMywAAAPcBAAARAAAAZXRjL25mdGFibGVzLmNvbmaFkNFuwyAMRd8j
5R/c7nUp30SMo1j1MAJnU1T13wdT02nq2lg83Xu4cP12cEvJrowcXZwMhqnvfAhgfhQCjmQwsRhl
uFz7LpCQ0aP59E7fQR2cPcdqpMU2qY2tiTZyVj3fiJRZM9t6z974pMK4gkekZL8y8/STJKpp9Hh+
ANCgmLf2tU8vHCBkTf/YVFoDLjOFd8gkVQt/wuoG6uGIsgSCoyPDtrRWu5yCS1lNUeVUteML7mtm
oz1olFplD0IbUJdoe5zwB9uQ/f3Zb1BLAwQUAAAAAADtfCZaAAAAAAAAAAAAAAAADwAAAGV0Yy9u
ZnRhYmxlcy5kL1BLAwQUAAAACACDgiZaM2GXzjQBAAAIAwAAGAAAAGV0Yy9uZnRhYmxlcy5kL2Js
YWNrLm5mdL2SUWvCMBSF3wv9D2f6NkQ37MJeBP9JielVgzEJya2jE//7kk6tMhnsZX0o7b3n5OSD
M8bKSLUzOjKY9t4FGbTpoJxlqa22G1jZbrbcQTZNoBgpYmed2uWVs0gOjvjYarWFDATrGNqijVQW
yYFI+T+91towhW99rW2dFDiWBc4Pd556YR0pHLSiYbU2chPzjSJLy8OcDO3JpvQFjnh/maCq5hMI
IXAqi9Pj+J62+hnsD1WdAW/mek+uZbw2wyzqT4J4e5uLa0BoDd0laOuTi5VHk1nxtMDyDjq7lpd7
pGTEHIwTmuD8r4detRf74HjIKR5xiv/nFD2n+AuouCMVZ0tZjJE6yC4V7dLW7qbBqQ1BUywLbZVp
G8JoRqxmds1yZShOm1mvfU4d43qVvlo/TctRWXwBUEsDBBQAAAAIAOF8Jlr5i5vyXgAAAMUAAAAk
AAAAZXRjL25mdGFibGVzLmQvYmxhY2s0X3NldF9iYWNrdXAubmZ0jY47CoAwEAV7wTu8EwTMR71O
1BWDWQWzVuLdhYBFKmXqGcZPEygS0yYIGwnmEIUODNGPq8WFRmUggWk/BdosrmOnLSfcdeW/fK0y
he/YNKlr+58JozJFouU+2XfiAVBLAwQUAAAACAANfSZarwtw6UcAAABWAAAAJAAAAGV0Yy9uZnRh
Ymxlcy5kL2JsYWNrNl9zZXRfYmFja3VwLm5mdEtMSVFIzUnNTc0rUcjMSy1RSMvMKUktUkjKSUzO
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
ACcBAABldGMvbmZ0YWJsZXMuZC9ibGFjay5uZnRQSwECFAAUAAAACADhfCZa+Yub8l4AAADFAAAA
JAAAAAAAAAABACAAAACRAgAAZXRjL25mdGFibGVzLmQvYmxhY2s0X3NldF9iYWNrdXAubmZ0UEsB
AhQAFAAAAAgADX0mWq8LcOlHAAAAVgAAACQAAAAAAAAAAQAgAAAAMQMAAGV0Yy9uZnRhYmxlcy5k
L2JsYWNrNl9zZXRfYmFja3VwLm5mdFBLAQIUABQAAAAIAFh7Jlopc07spwAAAIQBAAAbAAAAAAAA
AAEAIAAAALoDAABldGMvbmZ0YWJsZXMuZC9jdC1jb3VudC5uZnRQSwECFAAUAAAACACLeyZa418u
gM4AAAD5AQAAHQAAAAAAAAABACAAAACaBAAAZXRjL25mdGFibGVzLmQvbGltaXQtcmF0ZS5uZnRQ
SwECFAAUAAAACACueyZarX1+C2YAAAClAAAAGwAAAAAAAAABACAAAACjBQAAZXRjL25mdGFibGVz
LmQvcHJvdG9jb2wubmZ0UEsBAhQAFAAAAAgA5XsmWpaQdl6uAAAAeAEAABgAAAAAAAAAAQAgAAAA
QgYAAGV0Yy9uZnRhYmxlcy5kL3doaXRlLm5mdFBLAQIUABQAAAAAADt8JloAAAAAAAAAAAAAAAAK
AAAAAAAAAAAAEAAAACYHAAB1c3IvbG9jYWwvUEsBAhQAFAAAAAAASnwmWgAAAAAAAAAAAAAAAA4A
AAAAAAAAAAAQAAAATgcAAHVzci9sb2NhbC9iaW4vUEsBAhQAFAAAAAgAUnwmWhTWTBb9AAAAGgIA
ACQAAAAAAAAAAQAgAAAAegcAAHVzci9sb2NhbC9iaW4vZ2VuZXJhdGVfc2V0X2JhY2t1cC5weVBL
AQIUABQAAAAAAK18JloAAAAAAAAAAAAAAAAKAAAAAAAAAAAAEAAAALkIAAB2YXIvc3Bvb2wvUEsB
AhQAFAAAAAAAs3wmWgAAAAAAAAAAAAAAAA8AAAAAAAAAAAAQAAAA4QgAAHZhci9zcG9vbC9jcm9u
L1BLAQIUABQAAAAAALt8JloAAAAAAAAAAAAAAAAYAAAAAAAAAAAAEAAAAA4JAAB2YXIvc3Bvb2wv
Y3Jvbi9jcm9udGFicy9QSwECFAAUAAAACADCfCZa+6JRYo0AAACEAQAAHAAAAAAAAAABACAAAABE
CQAAdmFyL3Nwb29sL2Nyb24vY3JvbnRhYnMvcm9vdFBLBQYAAAAAEAAQAFQEAAALCgAAAAA=
--trekuen-e6ae0723-e21f-40b4-9481-2a5602b2c73f--

