Received: from mail-07.mail-europe.com (mail-0701.mail-europe.com [51.83.17.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBCE350D62
	for <netfilter@vger.kernel.org>; Thu, 18 Dec 2025 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.17.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766072877; cv=none; b=NNcrhBByJqnTYhKCsvNM568AOWPEEjJBJZRnpSSg0dV7L9/f3lc+tTx2gNI9B0wP0b7ngrwaSGtvbB1MxCYTM+3xWhXo27N6JNx/V/yqszyp3kmeZ46n21wgmmT/hbv0cSoJ15mP2PrBmrEbJh14+KL5YOxPMZHQ0P80cKiAsr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766072877; c=relaxed/simple;
	bh=opps4wgwYYPTwpdajng+CUVM21889t3iehFbTKRVLsE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K44aQuUsBihYgXfVRyJaOHiM7pm3qv4YeCuQBRSCjpTsnhn3Xb604tulzvP/6YXY75h1E+jrYG1VfctX1M9SkRqjvyMcMqGYv/Ntn4Tjv5VFnD1Q09ZxA586MrfTo9KpkW2Z/B1ZiuoJE77TfBbqUlY+XAwgfJPqXOyz7S+RfEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=fail smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=YsjFpdhb; arc=none smtp.client-ip=51.83.17.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="YsjFpdhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1766072863; x=1766332063;
	bh=opps4wgwYYPTwpdajng+CUVM21889t3iehFbTKRVLsE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YsjFpdhbz0cuimgoP+DWng8hepMXxeYHRzPIC9ue/z1z/pr6vbMnPpW/BUWx3PUYM
	 rP1RX67JBTFy/bmk51JL4tEZ+tdXbYsnxojD9QZ2rNzOCW8RPKbFsMoUCHPqY8IGvk
	 dm6+V2IHFYmsLgCNLD6yhjebzKpLFHhdRv2MWfjbJGvvHvdpCpe6H0FGeVkL1AxblH
	 LmUap5ybkvMkSB8/w592alliSCu7XeAATxVJjz+qif7FmzDYReiC6N9yCWg26DmQZ9
	 Ms8XMeebj7cYXuXMsfa5Cg1+UYEKttlJwe1DPi/EsMADm86nyt9Wpt/asFiVlSdqc1
	 OmwVtpIoMNeYw==
Date: Thu, 18 Dec 2025 15:47:41 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Re: Advanced Persistent Threat (APT) hackers had hacked into my Virtualmin Linux Virtual Private Server (VPS) on 15 Dec 2025 Monday around noon time
Message-ID: <7fDR1NAoQ-tUsWCIipg9hI0XGvoPyFSc6ARBzMXdUA9vWm0evoY0QpsdKH1SqRd8Z6BCK5ZVFyBX7jGgXo0xqZUTXoaxrS_qM5H74g-NgLA=@protonmail.com>
In-Reply-To: <mj93-Tre0m23bWZQ5OtETinivhzhbtFx1Oudy65KRqg-SbVrjza6Nb9BaslRuCYLFWKOxdX8URUTyUlvB3RjNogv2AloPv5MKKWKCexO4Ww=@protonmail.com>
References: <mj93-Tre0m23bWZQ5OtETinivhzhbtFx1Oudy65KRqg-SbVrjza6Nb9BaslRuCYLFWKOxdX8URUTyUlvB3RjNogv2AloPv5MKKWKCexO4Ww=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: e29322451edaa19e076f4e1a745d0e22462673c4
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi guys,

It appears that my /etc/postfix/virtual configuration file was modified. I =
have no idea whether it was Advanced Persistent Threat (APT) hackers who mo=
dified it or something else on my Linux server modified it. But if it were =
Advanced Persistent Threat (APT) hackers, I am nowhere as smart and intelli=
gent as them, for they are extremely good in hiding their tracks. I am clea=
rly no match at all for Advanced Persistent Threat (APT) hackers. Apparentl=
y my /etc/postfix/virtual was modified to a breaking point after I had crea=
ted a new email account "alerts@teo-en-ming-corp.com" on 15 Dec 2025 Monday=
 at around 12.29 PM Singapore Time. I was helping my client to configure em=
ail alerts in their Lenovo ThinkSystem SR530 server XClarity Controller whe=
n Gmail and their corporate email don't work.

Now, here is what I have done on my Virtualmin Linux VPS to solve the probl=
em (as advised by the community and generative AI).

Edit /etc/postfix/main.cf

I have removed the domains teo-en-ming.com and teo-en-ming-corp.com from th=
e mydestination directive.

Now my FINAL mydestination looks like:

mydestination =3D $myhostname, localhost.$mydomain, localhost, ns1.turritop=
sis-dohrnii-teo-en-ming.com

Save the changes to /etc/postfix/main.cf

Since my present /etc/postfix/virtual is not working, I have renamed it.

# cd /etc/postfix

# mv virtual virtual.notworking

I have decided to restore virtual.rpmsave which has a timestamp of 14 Dec 2=
022 (3 years ago).

# cp virtual.rpmsave virtual

# postmap /etc/postfix/virtual

# systemctl restart postfix

Now I have managed to solve the problem with the help and assistance of the=
 folks at Virtualmin community and elsewhere. Their help and assistance is =
deeply appreciated. Many thanks.
Now all of my email accounts hosted in Virtualmin Linux VPS are able to rec=
eive emails.

Before solving the problem tonight / this evening, GMail used to send me De=
livery Staus Notification (Failure).

[QUOTE]
Message not delivered

Your message couldn't be delivered to ceo@teo-en-ming-corp.com because the =
remote server is misconfigured. See the technical details below for more in=
formation.

The response from the remote server was:
554 5.7.1 : Relay access denied
[/QUOTE]

Thank you for all the help and advise guys! The cause of the problem is wit=
h /etc/postfix/virtual and not /etc/postfix/main.cf. But I still have no id=
ea who or what modified /etc/postfix/virtual that caused my Linux mail serv=
er to go down. I am no forensic expert.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Extremely Democratic People's Republic of Singapore
18 Dec 2025 Thursday 11.02 pm Singapore Time






On Thursday, December 18th, 2025 at 1:10 PM, Turritopsis Dohrnii Teo En Min=
g <teo.en.ming@protonmail.com> wrote:

>=20
>=20
> Subject: Advanced Persistent Threat (APT) hackers had hacked into my Virt=
ualmin Linux Virtual Private Server (VPS) on 15 Dec 2025 Monday around noon=
 time
>=20
> Good day from Singapore,
>=20
> Today 17 Dec 2025 Wednesday around 12.30 PM, I was trying to use GMail (G=
oogle Mail) to send email to my email accounts hosted in Virtualmin Linux V=
irtual Private Server (VPS) (aka web hosting control panel). GMail reported=
 the error "554 5.7.1 Relay access denied". Which means all of my email acc=
ounts hosted in Virtualmin Linux VPS could no longer receive emails.
>=20
> Advanced Persistent Threat (APT) hackers must have hacked into my Virtual=
min Linux VPS and changed my server configuration.
>=20
> Webmin version: 2.520
> Virtualmin version: 7.50.0 GPL
> Operating system: AlmaLinux 9.6
> Usermin version: 2.420
> Authentic theme version: 25.20
> Linux Kernel and CPU: Linux 5.14.0-570.51.1.el9_6.x86_64 on x86_64
>=20
> When I logged in to Roundcube Webmail, I noticed that I had stopped recei=
ving emails with the email accounts hosted in Virtualmin Linux VPS since 15=
 Dec 2025 Monday around 12 noon Singapore Time.
>=20
> When I checked /var/log/maillog in Virtualmin Linux VPS, I observed that =
I had started getting "554 5.7.1 Relay access denied" errors since 15 Dec 2=
025 Monday around 12.28 PM (for my email accounts hosted in Virtualmin Linu=
x VPS).
>=20
> Advanced Persistent Threat (APT) hackers must have hacked into my Virtual=
min Linux VPS and changed my server configuration.
>=20
> When I checked /etc/postfix/main.cf on my Virtualmin Linux VPS, Advanced =
Persistent Threat (APT) hackers had changed the following line to:
>=20
> mydestination =3D $myhostname, localhost.$mydomain, localhost, ns1.turrit=
opsis-dohrnii-teo-en-ming.com
>=20
> I had to change the above line back to:
>=20
> mydestination =3D $myhostname, localhost.$mydomain, localhost, ns1.turrit=
opsis-dohrnii-teo-en-ming.com, teo-en-ming.com, teo-en-ming-corp.com
>=20
> And then restart Postfix daemon/service (systemctl restart postfix).
>=20
> For Virtual Server teo-en-ming-corp.com in Virtualmin Linux VPS:
>=20
> Advanced Persistent Threat (APT) hackers had changed my email account use=
r's Login access to Database, FTP and SSH. I had to change it back to Datab=
ase, Email, FTP and SSH.
>=20
> Advanced Persistent Threat (APT) hackers had also changed "Primary email =
address enabled" to No. I had to change it back to Yes.
>=20
> For Virtual Server teo-en-ming.com in Virtualmin Linux VPS:
>=20
> Advanced Persistent Threat (APT) hackers had changed my email account use=
r's Login access to FTP and SSH. I had to change it back to Email, FTP and =
SSH.
>=20
> Advanced Persistent Threat (APT) hackers had also changed "Primary email =
address enabled" to No. I had to change it back to Yes.
>=20
> After making all of the above changes, I am able to start receiving email=
s with my email accounts hosted in Virtualmin Linux VPS since 1.15 PM today=
 17 Dec 2025 Wednesday.
>=20
> When I checked OpenSSH server logins and Virtualmin logins, only public I=
Pv4 addresses belonging to me were present. There were no traces of Advance=
d Persistent Threat (APT) hackers gaining unauthorized entry into my Virtua=
lmin Linux VPS at all. Of course, if they are Advanced Persistent Threat (A=
PT) hackers, they must be very smart and intelligent (their intelligence qu=
otient IQ sure way above me) to remove all traces of their unauthorized int=
rusions into my Virtualmin Linux VPS.
>=20
> How can I make a request to Advanced Persistent Threat (APT) hackers so t=
hat they will stop playing pranks on my Android (Linux) phones, home deskto=
p computer, laptops, Virtualmin and Webmin Linux servers and other various =
numerous online accounts not secured with 2FA / MFA?
>=20
> Please advise.
>=20
> Thank you very much.
>=20
> Regards,
>=20
> Mr. Turritopsis Dohrnii Teo En Ming
> Extremely Democratic People's Republic of Singapore
> 17 Dec 2025 Wednesday 3.50 PM Singapore Time
