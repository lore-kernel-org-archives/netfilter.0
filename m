From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Best way to kill a live TCP connection?
Date: Wed, 19 Jan 2011 14:32:51 +0100
Message-ID: <4D36E803.4060703@tana.it>
References: <4D2C4E92.6040902@tana.it> <alpine.LNX.2.01.1101111537180.8612@obet.zrqbmnf.qr> <4D2C8374.70408@tana.it> <4D2C95ED.70805@plouf.fr.eu.org> <4D2CC740.9090007@riverviewtech.net> <4D35D2D2.3020201@tana.it> <4D35DFC8.7000302@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tana.it; s=test;
	t=1295443971; bh=II3t82NButY3CvAIh5BNPcGtM93zuESxq8dzbRdWfBM=;
	l=1811;
	h=Message-ID:Date:From:MIME-Version:To:References:In-Reply-To:
	 Content-Transfer-Encoding;
	b=ac0HJNOl3c9jqjT5tfrpLoXkFIQgOa9mYnPWtTfW8ydLzRK3O2+U/6OsXOrY66G2k
	 uUkgkZ3FygZbadWcbDGXVnldkQUxGzFuDZd78RKmXqkkUQWlggD7ZcnpUyAW0PhGbp
	 eBOlPWCLJM4yfYCPsIg3OxXDE2TbDSucZ4HZ5Eno=
In-Reply-To: <4D35DFC8.7000302@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 18/Jan/11 19:45, G=C3=A1sp=C3=A1r Lajos wrote:
> Do you know the conntrack tool?
>=20
> conntrack -D...

Yes, I'm sorry I didn't leave more context in place.  The thread was
about deleting connections as above and have iptables kill them as a
side effect.

>> I tried using connmark, as in
>>
>>     iptables -A INPUT -m conntrack --ctstate NEW -p tcp ! --syn\
>>        -j CONNMARK --or-mark 8
>> and
>>     iptables -A OUTPUT -m connmark --mark 8/8 -p tcp ! --syn\
>>        -j REJECT --reject-with tcp-reset
>>
>> However, the latter rule never matched.  Is it the wrong table?
>
> Do you have more connmark rules? Maybe something interferencing whit
> these rules...

Not connmark --which I'm unfamiliar with-- but there was a sanity
check that I overlooked.  Your question has put me on the right track.
 Thanks!

Now, having fixed that, terminating connections this way apparently
works perfectly: issuing "conntrack -D -s x.x.x.x", the local end of
each connection to x.x.x.x is reset, thereby saving server's
resources, while malicious clients are left idling alone.

This seems about the best I can get.  However, this method still has
two minor defects:

=46irst, after I have determined that the client is malicious I have to
let in one more packet.  This could be avoided using the
tcp-reset-destination iptables enhancement that I proposed.

Second, if such further packet never arrives, the server has to wait
until timeout.  I think I'd need the seq/ack numbers of the last
packet in order to avoid this.  They must be somewhere in the system,
don't they?  (Or would it help to send spoofed packets to remote
clients at the time their maliciousess is determined, as other
methods* do?)

=46urther thoughts?

--=20
[*] see killcx or cutter, mentioned upthread.
