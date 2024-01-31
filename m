Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3082D7992E
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.160.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706698470; cv=none; b=o6OOCeSbBoCTs4c8DYKXxua+k0nTtBiBDQ0963fC7gz/6+E4ID11PWezIu0Ovfu68sKdGum4t7JhQvqbzGmJ5sFrRiRD0Z4TyLuo8aHoQBkzoCE0x7RWbJP4OrY5nQ6WuM95+KNVnfgICxc+jBRiO8J9g3UNyS5IWBDbfeV0zIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706698470; c=relaxed/simple;
	bh=J/KcKMvrvVpGKQ1vTHIIlezNMMJToCAVXprM6c5QpdI=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Noql7Fgqg0965DyCrQA/ItOL2bFvPjxew5HxctoxV6az+4JzUoI4tIFFZ8THB0CsUDPxCRY1weSGtEviNkenZee9RRqK55eFgTyIWV2+/ZxCz3uAADKBJsD3WSoPfcxm15RFUZv6ROMwMRd5mlNEynzEtd9nqZUPf4PjNTAvM5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de; spf=none smtp.mailfrom=zugschlus.de; arc=none smtp.client-ip=85.214.160.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=zugschlus.de
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+netfilter@zugschlus.de>)
	id 1rV8Eb-003nPJ-0R
	for netfilter@vger.kernel.org;
	Wed, 31 Jan 2024 11:54:25 +0100
Date: Wed, 31 Jan 2024 11:54:25 +0100
From: Marc Haber <mh+netfilter@zugschlus.de>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Tue, Jan 30, 2024 at 03:17:32PM +0000, Kerin Millar wrote:
> On Tue, 30 Jan 2024, at 1:08 PM, Marc Haber wrote:
> > This is one of my pet peeves with nft, actually. For iptables, there was
> > tooling like ferm which made it possible to write dual-stack rule sets
> > very easily. This kind of tooling seems to be completely missing in the
> > nftables world. Am I missing something here?
> 
> Quite possibly. Currently, nftables supports:
> 
> - mixed rulesets (using tables bearing the "inet" family)
> - mixed rules (wherever it makes sense)
> - first-class sets of any kind (irrespective of the type of table enclosing them)

That nicely shows another issue with nft: Docs. Neither the search
function on the nftables wiki nor the nft manual page have matches for
"mixed" or "first-class".

How would I use a mixed ruleset? How would I use a mixed rule?

> Granted, one cannot create a set that is typed in such a way that an
> element can be either an IPv4 or IPv6 address/interval. Conversely,
> iptables does not natively support sets at all, though it can
> integrate with sets that are managed by ipset(8). Now, can an ipset
> contain addresses of mixed types? No, it cannot.

In ferm, a tool that has been available for over 20 years, you can
(beginning ten years ago, I think) write things like:

@def $h_cadencia=(192.168.251.9 2001:db8:42bc:a102::9:100);
@def $h_chasse=(192.168.181.161 2001:db8:42bc:a181::a1:100);
@def $g_dnsrec=($h_cadencia $h_chasse)

domain (ip ip6) {
  table filter {
    chain FORWARD {
      iface internal0 daddr $g_dnsrec proto (tcp udp) dport 53 ACCEPT;
    }
  }
}

which creates (if I calculated correctly) four IPv4 rules and four IPv6
rules automatically. Ferm solves this trivially by dropping any
generated rules where address type and domain doesn't match.

This approach of course makes the sheer number of rules explode, but it
makes writing rules easier. My time is precious, CPU time is generously
available. In the situation where CPU time is precious as well, I might
be willing to spend some more time writing _efficient_ rules but that's
like 2 percent of all the cases and I am not willing to make my life
harder in the other 98 percent.

> As far as the present topic is concerned, the only tangible advantage
> that ipset has is the ability to create a set whose sole purpose is to
> act as a superset of other - potentially mixed - sets. This advantage
> is rather diminished by the fact that one also has to two manage two
> entirely separate rulesets with iptables and ip6tables,
> notwithstanding that wrappers such as fermi exist.

Of course one could have an nft preprocessor solving those issues, but
given that nft is already open source, reads a text file and configures
the nftables kernel backend, the natural approach would be to modify nft
to not only translate input 1:1 to kernel entries, but also add some
bells and whistles that makes life easier for those people writing
firewall rules.

With iptables, where people are encouraged to put their firewall rules
into shell scripts, things were entirely different, and this approach
was very inconvenient (proven by the fact that many iptables frontends
didnt write iptables scripts but files that could be read by
iptables-restore.

> At any rate, the follow nftables ruleset is valid.
> 
> table inet filter {
>         set block4 {
>                 type ipv4_addr
>         }
>         set block6 {
>                 type ipv6_addr
>         }
>         chain INPUT {
>                 type filter hook input priority filter; policy accept
>                 ip saddr @block4 drop
>                 ip6 saddr @block6 drop
>         }
> }

Isnt that clumsy! Wouldn't it be so much nicer to be able to write:

table inet filter {
        set block46 {
                type ipv46_addr
        }
        chain INPUT {
                type filter hook input priority filter; policy accept
                ip46 saddr @block46 drop
        }
}

Having to write distinct rules makes things more complex and
error-prone.

> >> However, the value of an ipv6_addr element is permitted to be an IPv4-mapped IPv6 address.
> >
> > Does nft have a function to convert an IPv4 address to an IPv4-mapped
> > address? Will the rule set do the intended thing? Is an ipv6 rule with
> > an IPv4 mapped address fully equivalent with a proper IPv4 rule?
> 

> I do not know, as I have not yet attempted to use them in an ipv6_addr
> set (it would waste memory).

I surely hope that are beyond the discussion of having to waste memory.
The vast majority of machines have way than enough memory to hold a few
128 bit entries, and if that is really a premium, a given mixed set can
be pulled apart automatically in preprocessing.

First make it work, then make it efficient. Don't trade human time
against machine time unless in very rare corner cases (I currently
happen to work in one of those corner cases, but I still say it's the
wrong way).

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
