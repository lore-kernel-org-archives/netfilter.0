Received: from mail.thelounge.net (mail.thelounge.net [91.118.73.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A33B2C21FC
	for <netfilter@vger.kernel.org>; Thu, 18 Dec 2025 17:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.118.73.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080485; cv=none; b=LX1oAIRm0OrsMp6bsj62TVgaAvo+BUqDE17qDutVSNL3oI4s38QxOIzvB0EYsDq9E6QzlV2c+d7oONn7MGfUqEiu7Qsogm6Ms3OuEo/8+SDHpnpLsquYDJGSR2kh62WbKaFSJVA/FQ3M7gCBAOqGy+Crcm1UfvoheoaNWVehPTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080485; c=relaxed/simple;
	bh=PIG1eva9ywC8gMZ81Cq2Q0ZYjKdNc0oYWHBwIbw0FFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nql5fmYhwkBvs9oGfsgmXrO5boaTpvbRcEJrFRdnTLXAFDJCLm4XmAWCytApEtpi5kN3E68ukYbPzpAGS90DNScfONoHv1Wb4CcITo6ZyVbmPnSvjRoT1kJTlPcL2fx7Vh8buNOad7hzMkd8o31Xdtr8RfdmaSJ6nwD37lMP3A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thelounge.net; spf=pass smtp.mailfrom=thelounge.net; arc=none smtp.client-ip=91.118.73.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thelounge.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thelounge.net
Received: from [10.10.10.2] (rh.vpn.thelounge.net [10.10.10.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: h.reindl@thelounge.net)
	by mail.thelounge.net (THELOUNGE MTA) with ESMTPSA id 4dXJG02qgCzXl2;
	Thu, 18 Dec 2025 18:54:27 +0100 (CET)
Message-ID: <f4916f8b-d47e-4c15-a6dc-9b27016cc228@thelounge.net>
Date: Thu, 18 Dec 2025 18:54:27 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Advanced Persistent Threat (APT) hackers had hacked into my
 Virtualmin Linux Virtual Private Server (VPS) on 15 Dec 2025 Monday around
 noon time
Content-Language: en-US
To: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
References: <mj93-Tre0m23bWZQ5OtETinivhzhbtFx1Oudy65KRqg-SbVrjza6Nb9BaslRuCYLFWKOxdX8URUTyUlvB3RjNogv2AloPv5MKKWKCexO4Ww=@protonmail.com>
 <7fDR1NAoQ-tUsWCIipg9hI0XGvoPyFSc6ARBzMXdUA9vWm0evoY0QpsdKH1SqRd8Z6BCK5ZVFyBX7jGgXo0xqZUTXoaxrS_qM5H74g-NgLA=@protonmail.com>
From: Reindl Harald <h.reindl@thelounge.net>
Autocrypt: addr=h.reindl@thelounge.net; keydata=
 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
 K4rYsjPimkSIVdrNM//wVKdCTbO+
Organization: the lounge interactive design
In-Reply-To: <7fDR1NAoQ-tUsWCIipg9hI0XGvoPyFSc6ARBzMXdUA9vWm0evoY0QpsdKH1SqRd8Z6BCK5ZVFyBX7jGgXo0xqZUTXoaxrS_qM5H74g-NgLA=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

for the sake of god what is wrong with you?

for years now you bother dozens of mailing-lists with mails like this 
and what makes it maximal terrible is that you chose them randomly

what makes you think somebody at the netfilter-list cares about your 
postfix config?

Am 18.12.25 um 16:47 schrieb Turritopsis Dohrnii Teo En Ming:
> Hi guys,
> 
> It appears that my /etc/postfix/virtual configuration file was modified. I have no idea whether it was Advanced Persistent Threat (APT) hackers who modified it or something else on my Linux server modified it. But if it were Advanced Persistent Threat (APT) hackers, I am nowhere as smart and intelligent as them, for they are extremely good in hiding their tracks. I am clearly no match at all for Advanced Persistent Threat (APT) hackers. Apparently my /etc/postfix/virtual was modified to a breaking point after I had created a new email account "alerts@teo-en-ming-corp.com" on 15 Dec 2025 Monday at around 12.29 PM Singapore Time. I was helping my client to configure email alerts in their Lenovo ThinkSystem SR530 server XClarity Controller when Gmail and their corporate email don't work.
> 
> Now, here is what I have done on my Virtualmin Linux VPS to solve the problem (as advised by the community and generative AI).
> 
> Edit /etc/postfix/main.cf
> 
> I have removed the domains teo-en-ming.com and teo-en-ming-corp.com from the mydestination directive.
> 
> Now my FINAL mydestination looks like:
> 
> mydestination = $myhostname, localhost.$mydomain, localhost, ns1.turritopsis-dohrnii-teo-en-ming.com
> 
> Save the changes to /etc/postfix/main.cf
> 
> Since my present /etc/postfix/virtual is not working, I have renamed it.
> 
> # cd /etc/postfix
> 
> # mv virtual virtual.notworking
> 
> I have decided to restore virtual.rpmsave which has a timestamp of 14 Dec 2022 (3 years ago).
> 
> # cp virtual.rpmsave virtual
> 
> # postmap /etc/postfix/virtual
> 
> # systemctl restart postfix
> 
> Now I have managed to solve the problem with the help and assistance of the folks at Virtualmin community and elsewhere. Their help and assistance is deeply appreciated. Many thanks.
> Now all of my email accounts hosted in Virtualmin Linux VPS are able to receive emails.
> 
> Before solving the problem tonight / this evening, GMail used to send me Delivery Staus Notification (Failure).
> 
> [QUOTE]
> Message not delivered
> 
> Your message couldn't be delivered to ceo@teo-en-ming-corp.com because the remote server is misconfigured. See the technical details below for more information.
> 
> The response from the remote server was:
> 554 5.7.1 : Relay access denied
> [/QUOTE]
> 
> Thank you for all the help and advise guys! The cause of the problem is with /etc/postfix/virtual and not /etc/postfix/main.cf. But I still have no idea who or what modified /etc/postfix/virtual that caused my Linux mail server to go down. I am no forensic expert.
> 
> Regards,
> 
> Mr. Turritopsis Dohrnii Teo En Ming
> Extremely Democratic People's Republic of Singapore
> 18 Dec 2025 Thursday 11.02 pm Singapore Time
> 
> 
> 
> 
> 
> 
> On Thursday, December 18th, 2025 at 1:10 PM, Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com> wrote:
> 
>>
>>
>> Subject: Advanced Persistent Threat (APT) hackers had hacked into my Virtualmin Linux Virtual Private Server (VPS) on 15 Dec 2025 Monday around noon time
>>
>> Good day from Singapore,
>>
>> Today 17 Dec 2025 Wednesday around 12.30 PM, I was trying to use GMail (Google Mail) to send email to my email accounts hosted in Virtualmin Linux Virtual Private Server (VPS) (aka web hosting control panel). GMail reported the error "554 5.7.1 Relay access denied". Which means all of my email accounts hosted in Virtualmin Linux VPS could no longer receive emails.
>>
>> Advanced Persistent Threat (APT) hackers must have hacked into my Virtualmin Linux VPS and changed my server configuration.
>>
>> Webmin version: 2.520
>> Virtualmin version: 7.50.0 GPL
>> Operating system: AlmaLinux 9.6
>> Usermin version: 2.420
>> Authentic theme version: 25.20
>> Linux Kernel and CPU: Linux 5.14.0-570.51.1.el9_6.x86_64 on x86_64
>>
>> When I logged in to Roundcube Webmail, I noticed that I had stopped receiving emails with the email accounts hosted in Virtualmin Linux VPS since 15 Dec 2025 Monday around 12 noon Singapore Time.
>>
>> When I checked /var/log/maillog in Virtualmin Linux VPS, I observed that I had started getting "554 5.7.1 Relay access denied" errors since 15 Dec 2025 Monday around 12.28 PM (for my email accounts hosted in Virtualmin Linux VPS).
>>
>> Advanced Persistent Threat (APT) hackers must have hacked into my Virtualmin Linux VPS and changed my server configuration.
>>
>> When I checked /etc/postfix/main.cf on my Virtualmin Linux VPS, Advanced Persistent Threat (APT) hackers had changed the following line to:
>>
>> mydestination = $myhostname, localhost.$mydomain, localhost, ns1.turritopsis-dohrnii-teo-en-ming.com
>>
>> I had to change the above line back to:
>>
>> mydestination = $myhostname, localhost.$mydomain, localhost, ns1.turritopsis-dohrnii-teo-en-ming.com, teo-en-ming.com, teo-en-ming-corp.com
>>
>> And then restart Postfix daemon/service (systemctl restart postfix).
>>
>> For Virtual Server teo-en-ming-corp.com in Virtualmin Linux VPS:
>>
>> Advanced Persistent Threat (APT) hackers had changed my email account user's Login access to Database, FTP and SSH. I had to change it back to Database, Email, FTP and SSH.
>>
>> Advanced Persistent Threat (APT) hackers had also changed "Primary email address enabled" to No. I had to change it back to Yes.
>>
>> For Virtual Server teo-en-ming.com in Virtualmin Linux VPS:
>>
>> Advanced Persistent Threat (APT) hackers had changed my email account user's Login access to FTP and SSH. I had to change it back to Email, FTP and SSH.
>>
>> Advanced Persistent Threat (APT) hackers had also changed "Primary email address enabled" to No. I had to change it back to Yes.
>>
>> After making all of the above changes, I am able to start receiving emails with my email accounts hosted in Virtualmin Linux VPS since 1.15 PM today 17 Dec 2025 Wednesday.
>>
>> When I checked OpenSSH server logins and Virtualmin logins, only public IPv4 addresses belonging to me were present. There were no traces of Advanced Persistent Threat (APT) hackers gaining unauthorized entry into my Virtualmin Linux VPS at all. Of course, if they are Advanced Persistent Threat (APT) hackers, they must be very smart and intelligent (their intelligence quotient IQ sure way above me) to remove all traces of their unauthorized intrusions into my Virtualmin Linux VPS.
>>
>> How can I make a request to Advanced Persistent Threat (APT) hackers so that they will stop playing pranks on my Android (Linux) phones, home desktop computer, laptops, Virtualmin and Webmin Linux servers and other various numerous online accounts not secured with 2FA / MFA?
>>
>> Please advise.
>>
>> Thank you very much.
>>
>> Regards,
>>
>> Mr. Turritopsis Dohrnii Teo En Ming
>> Extremely Democratic People's Republic of Singapore
>> 17 Dec 2025 Wednesday 3.50 PM Singapore Time
