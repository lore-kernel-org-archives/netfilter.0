From: Lu Brian <lyt0112@gmail.com>
Subject: Re: How can I get rules with all resolved IPs for FQDN?
Date: Mon, 25 Apr 2011 10:04:20 +0800
Message-ID: <BANLkTimP_nyTQVwxCvRcvtX00boM_1uVOQ@mail.gmail.com>
References: <ED3A8D81130D4C0CB0D9B98DA81D188F@brianlu>
	<20110422110021.GB2976@cardinal>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=QwF+GFNhzzgKgPxk11n2HBR8Hr+OxEOEnCs3rgVY9oo=;
        b=NwVIF3D+ijWwsYYDs+IRzqciNNsj6HlUStI+oeNQv2EfEpEQ35uTjrwXH6QWzzX4WX
         pF4gQNpjCVbcSySSTcMGm3fY2zAHHTRywwIP/QVDFgzROo3kd9g9xqugLeG0luGER6zB
         EgF0etryS6b5MvPX6zejgXoPzZE6HFu0+WHzE=
In-Reply-To: <20110422110021.GB2976@cardinal>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: rob0@gmx.co.uk

i see...thank you~

2011/4/22 /dev/rob0 <rob0@gmx.co.uk>:
> On Thu, Apr 21, 2011 at 05:04:01PM +0800, Brian Lu wrote:
>> Subject: How can I get rules with all resolved IPs for FQDN?
>
> Having read the thread with Jan (pssst, Jan, host(1) is section 1,
> not section 8 :) ) this looks a lot like an "XY problem". You want to
> do X, but you are asking how to do Y.
>
> "X" here appears to be to block or control access to Facebook Web
> servers. To accomplish X, you chose iptables, which is the wrong
> tool. So you ran into problems because you chose the wrong tool, and
> now you're asking "Y".
>
> The answer to Y ($SUBJECT) is that you can't. Your iptables(8)
> command resolves the name exactly one time. Rules are entered into
> the kernel based on the number of IP addresses returned.
>
> Lookups for www.facebook.com return exactly one IP address, with a
> two-minute TTL, every time you query Facebook's authoritative NS
> servers.
>
> =A0for X in {1..10} ; do \
> =A0 =A0dig +short www.facebook.com. @glb1.facebook.com. ; \
> =A0done
>
> I ran that and got 9 unique answers for 10 queries. Substituting
> @glb2 for @glb1, again I got 9 unique answers, with some (but not
> all) having been found in the first set.
>
> The fact is: outside of Facebook itself, no one has any way to know
> how many IP addresses they have set up to answer HTTP connections as
> www.facebook.com. They use a very short TTL, which implies that they
> might dynamically change the list of IP addresses as needed.
>
>> I am having a problem about not all FQDN can work for iptables
>> commands . If I run an iptable command for www.google.com , it can
>> work fine. I can find 6 rules from the rules table.
>
> BTW, Google and just about every other large site does variations of
> the same thing. You're wrong if you think that your 6 IP addresses
> found for www.google.com. are the ONLY 6 they use. They are the 6
> presented to you as a choice at that particular moment.
>
> As Jan tried to explain to you, this is how iptables works. Names
> given are resolved only once. Bottom line: you can't rely on using
> DNS names which you don't control.
>
> The answer to your real question, "X", might be to hijack the DNS for
> facebook.com. and other Internet domains as desired. Or perhaps more
> likely, to force use of an HTTP proxy like Squid to control access.
>
> I suspect that this all boils down to a clueless and ineffective
> manager's desire to solve a social problem using technical means. :)
> --
> =A0 =A0Offlist mail to this address is discarded unless
> =A0 =A0"/dev/rob0" or "not-spam" is in Subject: header
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
