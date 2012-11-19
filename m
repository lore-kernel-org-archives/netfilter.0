From: Vladimir Budnev <vladimir.budnev@gmail.com>
Subject: Re: Iptables rules with module string give strange counter results
Date: Mon, 19 Nov 2012 12:10:10 +0300
Message-ID: <CAAvRK96ZmHyqnKOfkr3P5J-cKpwLcrq1a-9rdyg0Gj7iDUDJYw@mail.gmail.com>
References: <CAAvRK95Pk8LakkvyV-F6CoLMhjDrMStC9OzHt6RvLxWaDA4TrA@mail.gmail.com>
	<20121116124526.GA11345@lia.ch>
	<CAAvRK97NbO2fdW4T=7_WFCiuhd=93nwL0WcOrtr8FCXezgp8zw@mail.gmail.com>
	<20121116163043.GA13245@lia.ch>
	<50A967F3.3060707@fastmail.fm>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=OmNoIl7V5/b0Og2GWoBZphmSGFjeLVfnqNAjWMg8be4=;
        b=RSdpoOi6kon5ztIGhu39q54fJ9hk6G9NZOhBb/LVG6mhlOSwI0NJVbEcrwQsPS1zKc
         hJgTWMVFdCyPA2STlnLTZOP0AbiPnwQfNpeBPafkYQ+2JDBfIWwAr8PrqUZRtksdTvIx
         DBvDgSzYqJaYDiJdaz/AuQE9ZXTToHc4TKTBmmKWEC9C7IYI9PTNPWa+GCa0xrG5OBDi
         TMSfNZZPaTiL/5d+rCFwKv70GWLHvn4aC/CN/syQAoGU6gRVbnsZ9KqolngEjzIfucpx
         eq9WOSNHYps5GHQGZkhhxTDhIkVLV8AouzeWwfIFJd63qgghvxZHssO/sBTw1ENcVDxP
         vNxg==
In-Reply-To: <50A967F3.3060707@fastmail.fm>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linbloke <linbloke@fastmail.fm>
Cc: debian-firewall@lists.debian.org

2012/11/19 linbloke <linbloke@fastmail.fm>:
>
>
> Perhaps your log daemon is squashing duplicate entries?
>
To be honest i dont care much about log messages, I do care about rule
counters:) The thing that scares me is my missunderstanding of "what
is going on?"

But I found when counters get incremented. Bulmer test with nc hinted
me to play a bit with  tcp packet payload.

First run:
echo -n "GET /index.php HTTP/1.1\r\nHost: www.gentoo.org\r\n\r\n" | nc
89.16.167.134 80

gives no counters change. I get the page, but counters still unchanged. Okey...

Doing request like:
echo -n "GET BUBA-BUBA /index.php HTTP/1.1\r\nHost:
www.gentoo.org\r\n\r\n" | nc 89.16.167.134 80

I get "400 Bad request" and counters still unchaged. Okey....

!!! BUT !!!!
if I do something like
echo -n "GET BUBA-BUBA-BUBA-BUBAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
/index.php HTTP/1.1\r\nHost: www.gentoo.org\r\n\r\n| nc 89.16.167.134
80

I get the same "400 Bad request", BUT now counters got incremented.

Seems like module start matching from the wrong position thus even
--from 0 (ommiting --from 0 for default does not change result) simply
does not work.

Ehm...
