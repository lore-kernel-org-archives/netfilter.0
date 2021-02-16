From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: traffic shaping with tc on Linux 5.4.x
Date: Tue, 16 Feb 2021 06:32:15 -0500
Message-ID: <34cc2cd5-eb50-51b6-86bd-47fd41338fd1@fhmtech.com>
References: <672177ad-c6b3-ccd7-d9d5-f5c2291e1628@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=pC9r3DCqgaB8fU1yCvy09fq2Pwg+oQIddVEt2bEDjOY=;
        b=aDlH1KZlUbCjKxllWit/6meksaz+CwgUhc6MFxiPgLrMz2QWLOtepdColC3BQLVd5151BtuN4qyFeVV6EQBNbfC+L4QxmWsAz8awaSvf0oKmKdXfONFyvflaMJkojWfovNLdnD8dI6ssH+O+SeTHA6WpGOCCpdT6LdblrdxMqAw=;
In-Reply-To: <672177ad-c6b3-ccd7-d9d5-f5c2291e1628@gmx.com>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>, netfilter@vger.kernel.org

On 2021/02/15 14:22, Lars Nood=C3=A9n wrote:
> If this is the right list to ask about tc, then I have a beginner
> question about traffic shaping.  If not please point me to the correct
> venue.

Hi Lars,

Probably you should ask your question on the LARTC mailing list:
https://lartc.org/#mailinglist

You could also try
https://serverfault.com/


> My questions is, given the rules below, how would I further subdivide
> the SSH queue so that interactive sessions are prioritized over bulk
> transfers?

Just some general comments:

Your question boils down to how to distinguish between interactive and=20
bulk transfer SSH sessions. Some different cases:

* If interactive and bulk sessions typically originate from different=20
hosts, then you could mark packets based on ip saddr and assign the=20
marks to different routing classes.

* If the same hosts initiate both interactive and bulk transfers, then=20
you could run sshd on two different ports, one for interactive, one for=20
bulk transfers, and mark packets based on tcp dport. That would require=20
you/your users to remember to use the correct ssh port depending on=20
their intention.

* If you don't want to depend on clients connecting to a particular sshd=20
port, you could try using SFQ to at least give interactive sessions a=20
chance during bulk transfers. This *might* be enough, but is probably=20
not the optimal way to achieve your goal.
https://lartc.org/howto/lartc.qdisc.classless.html#LARTC.SFQ

* Your general problem of achieving reasonable latency for interactive=20
sessions while simultaneously providing high bandwidth for bulk=20
transfers is exactly what HFSC is intended to solve:
https://en.wikipedia.org/wiki/Hierarchical_fair-service_curve

Worth a look!

* If none of the above ends up suitable for your purpose, you could use=20
a meter with key ip saddr . tcp sport to mark ssh connections consuming=20
more than a critical bandwidth for assignment to a bulk transfer class=20
that gets lower priority. I'd use a set rather than a map because maps=20
don't support timeouts, and you probably want the elements to expire=20
automatically. I think a simple PRIO queue (within your ssh class) would=20
work well with this config.

https://wiki.nftables.org/wiki-nftables/index.php/Meters
https://wiki.nftables.org/wiki-nftables/index.php/Rate_limiting_matchings
https://lartc.org/howto/lartc.qdisc.classful.html#AEN902

~

Would be interested in what you end up using... it would be great if you=20
could follow up with a summary later. Good luck!

Best regards,
Frank
