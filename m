From: Matt <matt-nft@mailtower.de>
Subject: Named sets with timeout
Date: Mon, 28 Oct 2019 21:25:17 +0100
Message-ID: <cd3973f01a86ebc50a7fae9da40f29ce@mailtower.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mailtower.de x9SKPHlI021824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailtower.de; s=mail;
        t=1572294317; bh=nJl+guCrUiJ6QWRi76T0IrW0kSd6/7WCMTFpGFgOSck=;
        h=Date:From:To:Subject:From;
        b=YJ2cNC13BPDBISOJAN8GK1+2FPaRrp6jE2j78vNHXVkUC3qqj0fnm2E5dygFY8di+
         AcNbHhiKDUXgboGiMNKWzXFLJhyOsY/89i7hR0Rrq57UKkYVw7iynCMNwvTGt+b9kw
         PAs+QkNRkN0vVBOpM3XtyGn4XLmpM1ut8Vs8udl4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org, netfilter-owner@vger.kernel.org

Dear nft Forum,
I=E2=80=99m a big friend of named sets, specially the timeout function is v=
ery=20
great.
But one thing is confusing me, assume the following named:

table ip filter_v4 {
   set my_drop {
     type ipv4_addr
     flags timeout
   }
  ...
  ...
}


Then i add the following sample element to it:
   /usr/sbin/nft add set ip filter_v4 my_drop \{type ipv4_addr \; flags=20
timeout \; elements=3D\{a.b.c.d timeout 600s  \} \;\}

All good so far, a.b.c.d is counting down as expected, begiing with=20
10min.
But when i wait - say 1 minute and repeat the 'nft add set ... 600s'=20
command from above then the timer remains unchanged (?)
It looks as the timer cannot get changed anymore once it has been=20
initialized

Is this behavior by purpose?
And if, am I right to delete the element and re-assign it if I want to=20
get the timer updated?

Many thanks
Matt








