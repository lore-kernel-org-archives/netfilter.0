From: Robert Sander <r.sander@heinlein-support.de>
Subject: Re: exclude named sets
Date: Mon, 30 May 2022 10:10:11 +0200
Message-ID: <d297fef6-4e53-4f1c-cd9f-6955a19d9abd@heinlein-support.de>
References: <CAMsxNkQ7rGoEuqgEFtmyGab6+HyPr0MO33DDbWZD-rtfgjTEcw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
In-Reply-To: <CAMsxNkQ7rGoEuqgEFtmyGab6+HyPr0MO33DDbWZD-rtfgjTEcw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Am 20.05.22 um 13:04 schrieb Andrew Clark:

> But, probably not like this
> nft add rule ip filter output ip daddr != {@akamai, @stromwall} accept

In such a scenario I would suggest a new chain from which you return 
with multiple rules in case the IPs match against the sets. The last 
rule of the chain then redirects to the Tor network.

Regards
-- 
Robert Sander
Heinlein Consulting GmbH
Schwedter Str. 8/9b, 10119 Berlin

http://www.heinlein-support.de

Tel: 030 / 405051-43
Fax: 030 / 405051-19

Zwangsangaben lt. §35a GmbHG:
HRB 220009 B / Amtsgericht Berlin-Charlottenburg,
Geschäftsführer: Peer Heinlein -- Sitz: Berlin
