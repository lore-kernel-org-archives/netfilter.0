Received: from torres.zugschlus.de (torres.zugschlus.de [85.214.160.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86D715B964
	for <netfilter@vger.kernel.org>; Thu,  1 Feb 2024 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.160.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706787197; cv=none; b=hmzNI2JmR4fnPkXCw4QN73rT16mpuPr9jLqFDrhuyBaYoMYhT089wmMkRaLhk46Qm7Va27v1RTXFUb4n2oZS5V3br2QojP1LjNcv7T9ApclxvrDCtM2zel2aaBG9tnLTr9309nR07hO2regk3kYiushoGne5jQQHyLV+q9GfaiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706787197; c=relaxed/simple;
	bh=AvupvO2nbqxt9aB3GFWNjg6ViOpBCHFE4s5w3/YJoIY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Swxc7ITH5itk1EfgSHzDjwaXdRho3PniOxozT3fEvlGuHJuITKorGZA9lZmgyCCSfq89+Yy+Xq2l+/ECjAYIxFDggzYGaX3ScdFBaHFJLWRJK3zWn1qwbpgNjXvwMPMt8qwHc26CCY58/GjCgqnWCZgLmXal4zAVtKzLG1BRG2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de; spf=none smtp.mailfrom=zugschlus.de; arc=none smtp.client-ip=85.214.160.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zugschlus.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=zugschlus.de
Received: from mh by torres.zugschlus.de with local (Exim 4.96)
	(envelope-from <mh+netfilter@zugschlus.de>)
	id 1rVVJa-004NDQ-0l
	for netfilter@vger.kernel.org;
	Thu, 01 Feb 2024 12:33:06 +0100
Date: Thu, 1 Feb 2024 12:33:06 +0100
From: Marc Haber <mh+netfilter@zugschlus.de>
To: Netfilter list <netfilter@vger.kernel.org>
Subject: Re: Combine ipv4 and ipv6 in a set
Message-ID: <ZbuBcvaNQn0berWP@torres.zugschlus.de>
References: <be623941-d82e-4430-b6ea-5bdbc5b48da8@tootai.net>
 <e0e61628-b7b4-4df7-9665-0168fa741fe0@app.fastmail.com>
 <Zbj04V-90zpQwEzl@torres.zugschlus.de>
 <cd7cbfc0-b7d4-4713-9e2d-f92596fb4844@app.fastmail.com>
 <Zbom4bTPnkTMbLNE@torres.zugschlus.de>
 <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f76a328-4018-43c7-9f4a-86a1e2a4a94c@app.fastmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)

On Wed, Jan 31, 2024 at 01:02:57PM +0000, Kerin Millar wrote:
> On Wed, 31 Jan 2024, at 10:54 AM, Marc Haber wrote:
> > On Tue, Jan 30, 2024 at 03:17:32PM +0000, Kerin Millar wrote:
> >> On Tue, 30 Jan 2024, at 1:08 PM, Marc Haber wrote:
> >> > This is one of my pet peeves with nft, actually. For iptables, there was
> >> > tooling like ferm which made it possible to write dual-stack rule sets
> >> > very easily. This kind of tooling seems to be completely missing in the
> >> > nftables world. Am I missing something here?
> >> 
> >> Quite possibly. Currently, nftables supports:
> >> 
> >> - mixed rulesets (using tables bearing the "inet" family)
> >> - mixed rules (wherever it makes sense)
> >> - first-class sets of any kind (irrespective of the type of table enclosing them)
> >
> > That nicely shows another issue with nft: Docs. Neither the search
> > function on the nftables wiki nor the nft manual page have matches for
> > "mixed" or "first-class".
> >
> > How would I use a mixed ruleset? How would I use a mixed rule?
> 
> It wasn't intended as jargon, so the onus is upon me to clarify.
> 
> Firstly, I mentioned both tables and the "inet" family. If you search for inet in the man page, you should land in the ADDRESS FAMILY section, which indicates that the purpose of an address family is to define the type of packets that can be processed. It goes on to say that "all nftables objects exist in address family specific namespaces, therefore all identifiers include an address family".
> 
> Now, if we look at the defined grammar for creating tables in the TABLES section, it is - in part - presented as "{add | create} table [family] table". That shows that that the family can be specified at the time of creating a table. But wait, why is it in square brackets? It means that the argument specifying the family is optional. It goes on to say, "when no address family is specified, ip is used by default".
> 
> In summary, a table must always have an address family. If you do not explicitly specify the family at the time of creation, the family shall be "ip". If you specify "inet" as the family, the objects within the table (hooks, chains, rules etc) will be able to handle *both* IPv4 and IPv6 packets. That is what I meant by mixed.

Thanks for the clarification. This is what I am already using, but I am
not having formal create statements. I have definitions like:

table inet filter {
	chain input {
▸       ▸       type filter hook input priority 0; policy drop;↲
▸       ▸       ct state invalid drop comment "Drop invalid packets"↲
▸       ▸       ct state established,related accept comment "Accept established, related"↲
▸       ▸       iifname lo accept comment "Accept lo"↲
▸       ▸       icmpv6 type { nd-neighbor-solicit, nd-neighbor-advert, echo-request } accept↲
▸       ▸       icmp type { echo-request } accept↲
▸       ▸       ip  saddr $ssh_from4 tcp dport ssh accept↲
▸       ▸       ip6 saddr $ssh_from6 tcp dport ssh accept↲
	}
}

It is the two last rules defined that I gripe with: I need to define two
variables, and I need to define two rules. That's the problem.

> Secondly, by mixed rules, I meant that generalised rules within an inet table can handle both IPv4 and IPv6 packets. Consider a very simple rule such as "tcp dport 22 accept". It will match both IPv4 and IPv6 without issue. As you well know, iptables is incapable of doing this.

I must admit that I very rarely have rules that don't contain a list of
IP addresses.

> > In ferm, a tool that has been available for over 20 years, you can
> > (beginning ten years ago, I think) write things like:
> >
> > @def $h_cadencia=(192.168.251.9 2001:db8:42bc:a102::9:100);
> > @def $h_chasse=(192.168.181.161 2001:db8:42bc:a181::a1:100);
> > @def $g_dnsrec=($h_cadencia $h_chasse)
> >
> > domain (ip ip6) {
> >   table filter {
> >     chain FORWARD {
> >       iface internal0 daddr $g_dnsrec proto (tcp udp) dport 53 ACCEPT;
> >     }
> >   }
> > }
> 
> I would agree that fermi is a fine wrapper and that its author has put considerable thought into its syntax.

ferm (sic!) is an acronym for "for easy rule making". No connection to
Enrico ;-)   People mock it as being an "iptables macro assembler", and
that's exactly what I like in it. nft is still just an assembler, it
needs better macros, to stay in that imagery.

ferm's syntax is quite similiar to what nft uses. It just seems natural
to extend nft to become a better tool.

> >> At any rate, the follow nftables ruleset is valid.
> >> 
> >> table inet filter {
> >>         set block4 {
> >>                 type ipv4_addr
> >>         }
> >>         set block6 {
> >>                 type ipv6_addr
> >>         }
> >>         chain INPUT {
> >>                 type filter hook input priority filter; policy accept
> >>                 ip saddr @block4 drop
> >>                 ip6 saddr @block6 drop
> >>         }
> >> }
> >
> > Isnt that clumsy! Wouldn't it be so much nicer to be able to write:
> 
> I don't find it particularly clumsy; it is rather low on my list of nftables-related grievances. I don't know whether you are a programmer yourself but, sometimes, I wonder whether there is a culture clash of sorts between programming admins and non-programming admins. Though I am no Netfilter hacker, it is intuitive to me that sets are strongly typed and that the protocols are different. That being said ...

It is my particular grievance because it means manually duplicating work
for the people writing the rules. They're prone to make mistakes. The
error class of IPv4 and IPv6 firewall rules bot being in sync is quite
hard to debug, I'd rather have both protocols break together (and to be
fixed together).

I don't have a formal development background, I have always been more
Ops than Dev, and you probably don't want to read my code. I see
development as providing tools to users. And nft is not doing a
particularly good job for the users, the people actually writing rules.

Sadly, my limited development background and my limited time prevent me
from writing my own nft processor (which would probably not generate nft
input but write the rules directly to the kernel just as nft does).

> ... I can certainly appreciate this perspective and why it might ease the cognitive burden for maintaining some rulesets. 

Thanks for listening. This discussion surely not only helps the two of
us to learn about the other side, but it might also be inspiration for
the audience of the mailing list.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Leimen, Germany    |  lose things."    Winona Ryder | Fon: *49 6224 1600402
Nordisch by Nature |  How to make an American Quilt | Fax: *49 6224 1600421
