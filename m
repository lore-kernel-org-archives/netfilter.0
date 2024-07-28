Received: from mail.thelounge.net (mail.thelounge.net [91.118.73.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8E661674
	for <netfilter@vger.kernel.org>; Sun, 28 Jul 2024 17:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.118.73.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722186900; cv=none; b=ZYdrSh1UT8lIQrtvF/4vXBrSiHJZ4OaL20wGkVMii6pUtGeLM+2bhk10nNS9bHHArSDtN3HgAUqeZn689Fk37ypJmgUdABCyVWVIS/LhPQ5PQ8X8hviyo5xerRHU1HoYLRoisHFB6VfGILMV4oxPVd9aPbr6aqTSuCpoXopbMNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722186900; c=relaxed/simple;
	bh=ZOWOFk1BEl0Fbbe9hHinOh3zTRdKtjH/fPRMeJ+M9R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajj+amT340Zz5vqIeViN3CLCOk4pV/fTXJS16UhsJvV+vyjOuhsMfmHW9xB7PsXzxhkBiTVJUKA9rdcBXfmeLyaucy7OclPStKnMSFGkmraziapytcMv4ImuU/zs9gWNmfeKC7Q3O4PejfnSYmOrHOVLSW/VRgAXsE+zCpt/HvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thelounge.net; spf=pass smtp.mailfrom=thelounge.net; arc=none smtp.client-ip=91.118.73.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thelounge.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thelounge.net
Received: from [10.10.10.2] (rh.vpn.thelounge.net [10.10.10.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: h.reindl@thelounge.net)
	by mail.thelounge.net (THELOUNGE MTA) with ESMTPSA id 4WX7461tGyzXLL;
	Sun, 28 Jul 2024 18:58:46 +0200 (CEST)
Message-ID: <614ba217-0f24-434f-9cd1-a98061f951f6@thelounge.net>
Date: Sun, 28 Jul 2024 18:58:45 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Unknown option "--to-ports"
Content-Language: en-US
To: Tom Isaacson <thomas.isaacson@motorolasolutions.com>,
 Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org
References: <CAMp_5HbpSmy4G0-Aty9dD4FnwvvNU-iQfTtzYhysQSiL6jbA1g@mail.gmail.com>
 <CAMp_5Ha4HGLqkWAA=syC3+U0M3xxq3OuN9b_WvYNc9dV=CvzDg@mail.gmail.com>
 <20240725021904.GA13051@breakpoint.cc>
 <CAMp_5HZL85o7frtb+JSw6sq+uLT8V3St0Asz+Z5zqW529UaCMg@mail.gmail.com>
From: Reindl Harald <h.reindl@thelounge.net>
Autocrypt: addr=h.reindl@thelounge.net; keydata=
 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
 K4rYsjPimkSIVdrNM//wVKdCTbO+
Organization: the lounge interactive design
In-Reply-To: <CAMp_5HZL85o7frtb+JSw6sq+uLT8V3St0Asz+Z5zqW529UaCMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



Am 25.07.24 um 04:29 schrieb Tom Isaacson:
> I don't have strace on the device, it's pretty minimal. But
> libxt_owner.so is present here:
> /usr/lib/xtables/libxt_owner.so
> along with all the other files.
> 
> The installation is from Yocto:
> https://layers.openembedded.org/layerindex/recipe/300425/

so why don't you ask them what they have done to cripple down the 
binary? upstream is innocent

> On Thu, 25 Jul 2024 at 14:19, Florian Westphal <fw@strlen.de> wrote:
>>
>> Tom Isaacson <thomas.isaacson@motorolasolutions.com> wrote:
>>>>      Sharing Internet using method: nat
>>>>      iptables v1.8.7 (legacy): unknown option "--to-ports"
>>>>      Try `iptables -h' or 'iptables --help' for more information.
>>>>      Doing cleanup.. done
>>
>> Broken iptables installation.
>>
>>>> The offending iptables commands are:
>>>>              iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 -d
>>>> ${GATEWAY} \
>>>>                  -p tcp -m tcp --dport 53 -j REDIRECT --to-ports $DNS_PORT
>>>>              iptables -w -t nat -D PREROUTING -s ${GATEWAY%.*}.0/24 -d
>>>> ${GATEWAY} \
>>>>                  -p udp -m udp --dport 53 -j REDIRECT --to-ports $DNS_PORT
>>>>
>>>> I searched around for a solution and found
>>>> https://urldefense.proofpoint.com/v2/url?u=https-3A__community.unix.com_t_iptables-2Dv1-2D8-2D7-2Dnf-2Dtables-2Dunknown-2Doption-2Dto-2Dports_385377_3&d=DwIBAg&c=q3cDpHe1hF8lXU5EFjNM_C93KOmcBXCBnhee2v6PYlc&r=MO7EWU3DamJNNM8h6vHmeK6CEry2ufcorA3OreLf9oSJJvfzyukEHrKjEuU65HDv&m=3pEifEeIBaWYzhy_9MSuLYFwj7s1hDnpv2ftIP8xg0VZA5QWqX6RKTC79F1ylozp&s=sBy-V0FVFtnFXyvzNpVWO6IaPMyAYTyauL9S5RRjQrk&e=
>>
>> This has all diagnostic commands that you'll need to figure out whats
>> happening.
>>
>>>> but this command also fails:
>>>>      # iptables -A OUTPUT -m owner --uid 0
>>>>      iptables v1.8.7 (legacy): Couldn't load match `owner':No such file
>>>> or directory
>>>>
>>>> iptables links to xtables-legacy-multi but it seems to have all of the
>>>> necessary files present.
>>
>> iptables says it can't load match 'owner' (libxt_owner.so).
>>
>> So its either missing or iptables is searching the wrong location.
>>
>> strace should tell which directory iptables is searching to fetch
>> extensions.
>>
>> Some embedded distros split packages into subpackages to save space,
>> so it might be missing package too.
