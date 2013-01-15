From: Born Without <blackhole@airpost.net>
Subject: Re: state match is obsolete 1.4.17
Date: Tue, 15 Jan 2013 13:06:58 +0100
Message-ID: <50F54662.1030405@airpost.net>
References: <CAMD-=V+PhM3NLpWyxB0G4KUN6D+-XKL0PZCBAuyUXUw56gmuJw@mail.gmail.com> <alpine.LNX.2.01.1301150958390.16853@nerf07.vanv.qr> <50F5273F.5020205@inliniac.net> <alpine.DEB.2.00.1301151102490.11129@blackhole.kfki.hu>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	 s=mesmtp; bh=LWTTysKe2QbwWFrbpitUOdgtAPA=; b=sfTYS3PuCXbqP+zi24
	LsMeE9r2VZ4V326ngpGO+4qYFo1ZaZaGc7VOoHwtFuzXFWYUQwxlifgBnGWikUNp
	ziRaA694h7bCadf9StzYLenmAaohw8kC4SmDr0GjhjqHpekh6IaivXUkFFwQU1XM
	qwAe43cjbMElIVfDLr3uogjU4=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=LWTTysKe2QbwWFrbpitUOd
	gtAPA=; b=ARmxVlkgDMWHY+JB7H612gUcSewTrAqMCNx2XQhrCwQq3AelVZBvcr
	hQ7xRBV9M3pTrolSgh+kXmch8oOjhlnG0rAhNF/MoGfDGbQFeTcg9h2vX46liclf
	gxpeKJvkYuxU1kUAlQBxAGZHHZusWRF0yIlUX51wABWK/dTv1ZuZQ=
In-Reply-To: <alpine.DEB.2.00.1301151102490.11129@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Victor Julien <lists@inliniac.net>, Jan Engelhardt <jengelh@inai.de>, Nick Edwards <nick.z.edwards@gmail.com>, netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On 15.01.2013 11:06, Jozsef Kadlecsik wrote:
> On Tue, 15 Jan 2013, Victor Julien wrote:
>
>> On 01/15/2013 10:11 AM, Jan Engelhardt wrote:
>>>
>>> On Tuesday 2013-01-15 06:09, Nick Edwards wrote:
>>>
>>>> WARNING: The state match is obsolete. Use conntrack instead.
>>>>
>>>> Getting these errors since upgrading to 1.4.17
>>>
>>> It is a warning, not an error. (An error would not let use you
>>> the command at all.)
>>>
>>>> Am I right in assuming that :
>>>> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>>> must now become :
>>>> iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
>>>> or does that not do the same thing?
>>>
>>> state is a redundant subset of conntrack (the latter was introduced around
>>> Linux 2.5.32) and shall go away.
>>
>> I think removing it is a bad idea. For years and years all docs, books,
>> tutorials and frontends (like my own) have worked with "state". The
>> change seems so trivial "s/-m state --state/-m conntrack --ctstate/g"
>> that it would appear keeping "state" around as an alias or compatibility
>> layer would require minimal effort. Why not keep it around?
>
> Actually, I have to agree. Why don't we keep "state" as an alias and
> accept the old syntax in "conntrack"?
>
> What's the compelling reason to break countless scripts?
>

Yes please, bump +1

I never understood why 'state' wasn't simply extended.
Not doing a smooth transition, is just very unfriendly to users, for 
actually no good reason.

