From: gapsf@yandex.ru
Subject: nftables: introspection capabilities?
Date: Tue, 24 May 2011 15:21:36 +0700
Message-ID: <3210442595.20110524152136@yandex.ru>
Reply-To: gapsf@yandex.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1306225306; bh=amFvpU02cpQkQ09635ucYBu3BrZGi6+6uvsc9M3CkMc=;
	h=Date:From:Reply-To:Message-ID:To:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	b=GAIGOlWEYUU/ndZ74P8uZix7V4I1xqgINESANtByV+fH+Ajdp2SzLXqQTcyLOYvXr
	 OGcsPfudmHJT3kAcdxXMH/l/GbBhm/XHAZGHITd6SiXRmjyAL1Er7RdMnUQUPpRuDY
	 Xq/H/BpBC6g4OCpIoQTLpkUBk1hnAj1scPZCONLc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi!
There is a lot of frontends for iptables like shorewall, ufw, ferm and special firewall distros.
They all are trying to formalize, simplify, integrate the
configuration of Linux firewall and traffic control subsystems.
They also use a certain set of metadata for their own use.

One of the iptables disadvantages - the inability to effectively
find out the internal state of the iptables.
There is only one way - parse the "iptables -L" output, isn't it?

So there's no easy way to find out how many rules in the some table now,
or whether there is a rule with the given src and dst port in such a table,
for example.

So for these purposes the frontend should keep the internal state of iptables
in some way, instead of simply request this information from iptables.

There is no doubt that for nftables frontends will be written too, so the question is:
"Will nfatbles be able to find out various information
about their own current state: tables, chains, rules, etc?"

Thanks.

