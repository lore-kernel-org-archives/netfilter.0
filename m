Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9AF2036E9
	for <netfilter@vger.kernel.org>; Thu, 18 Dec 2025 05:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766034635; cv=none; b=GJErAv1UpYjirMRYz7/YolpHI3701PJJbgclcnaptzy6YCMBF7xJYzou0y53REiZ+NoQpjKvnj2i/uA1yxNA/64MlR3wR//M6z8z2yTtm9qwli/7kxeA3NT5GsUkznnzLfgwCp7IYq0MKtfjZcS5elO2s5NuYs61GgNafN0iHKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766034635; c=relaxed/simple;
	bh=QvxlFRwO1KIHzUk2uGdbBVUqHnxfYVK2vrVz2h27E30=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FLcsjKKHD4yhqCGdbneuqMDqBuMfpH6OZWTTicWgRlAYxjUMPtauAvrHcRPCWMcWNa0ckITvR2xMXcHKU5lauaLkSichruNqCnQ7Hf9VD7BE3QqsX4F4RlAFSBlfJ4sX+ptbJsJPf8IusaPM9ydsK59FE8Zwr21LqEvYg8e9J2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=FCqajGqo; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="FCqajGqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1766034630; x=1766293830;
	bh=QvxlFRwO1KIHzUk2uGdbBVUqHnxfYVK2vrVz2h27E30=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FCqajGqocwMvNOSi6fw/jqxs4LbebAm93jua4XTNkapQPTmNNdcoA4AdW4hD180zX
	 QoIBXBhDM/GVp8y9+/Fxagq8zxJKqBY0n0wIDzwfgrDyxwG3adWeMMCpQvH8XfrUEF
	 NgF/qbfjNiRbLBkAhLlwmMpozkzNIdDgbF5NAPp2ufSWD1WA8NcZX0NCQjlTjQg1Et
	 wNOvgghK0ae3NEsow3+q97wl2EDYG2w7WGL93o92CgIhoQa3pIIIjcUzJHkl23lJI4
	 A7jRExpWDK973snYYvMyJzBui1EZCAJsgKutDgmf+H2lbdEZgqIOuoUMqmAyBf/NMk
	 mNJpFCRALdinQ==
Date: Thu, 18 Dec 2025 05:10:24 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Advanced Persistent Threat (APT) hackers had hacked into my Virtualmin Linux Virtual Private Server (VPS) on 15 Dec 2025 Monday around noon time
Message-ID: <mj93-Tre0m23bWZQ5OtETinivhzhbtFx1Oudy65KRqg-SbVrjza6Nb9BaslRuCYLFWKOxdX8URUTyUlvB3RjNogv2AloPv5MKKWKCexO4Ww=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 4b5e1063de6e86068bc13de6271756c9ea635c01
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Advanced Persistent Threat (APT) hackers had hacked into my Virtua=
lmin Linux Virtual Private Server (VPS) on 15 Dec 2025 Monday around noon t=
ime

Good day from Singapore,

Today 17 Dec 2025 Wednesday around 12.30 PM, I was trying to use GMail (Goo=
gle Mail) to send email to my email accounts hosted in Virtualmin Linux Vir=
tual Private Server (VPS) (aka web hosting control panel). GMail reported t=
he error "554 5.7.1 Relay access denied". Which means all of my email accou=
nts hosted in Virtualmin Linux VPS could no longer receive emails.

Advanced Persistent Threat (APT) hackers must have hacked into my Virtualmi=
n Linux VPS and changed my server configuration.

Webmin version: 2.520
Virtualmin version: 7.50.0 GPL
Operating system: AlmaLinux 9.6
Usermin version: 2.420
Authentic theme version: 25.20
Linux Kernel and CPU: Linux 5.14.0-570.51.1.el9_6.x86_64 on x86_64

When I logged in to Roundcube Webmail, I noticed that I had stopped receivi=
ng emails with the email accounts hosted in Virtualmin Linux VPS since 15 D=
ec 2025 Monday around 12 noon Singapore Time.

When I checked /var/log/maillog in Virtualmin Linux VPS, I observed that I =
had started getting "554 5.7.1 Relay access denied" errors since 15 Dec 202=
5 Monday around 12.28 PM (for my email accounts hosted in Virtualmin Linux =
VPS).

Advanced Persistent Threat (APT) hackers must have hacked into my Virtualmi=
n Linux VPS and changed my server configuration.

When I checked /etc/postfix/main.cf on my Virtualmin Linux VPS, Advanced Pe=
rsistent Threat (APT) hackers had changed the following line to:

mydestination =3D $myhostname, localhost.$mydomain, localhost, ns1.turritop=
sis-dohrnii-teo-en-ming.com

I had to change the above line back to:

mydestination =3D $myhostname, localhost.$mydomain, localhost, ns1.turritop=
sis-dohrnii-teo-en-ming.com, teo-en-ming.com, teo-en-ming-corp.com

And then restart Postfix daemon/service (systemctl restart postfix).

For Virtual Server teo-en-ming-corp.com in Virtualmin Linux VPS:

Advanced Persistent Threat (APT) hackers had changed my email account user'=
s Login access to Database, FTP and SSH. I had to change it back to Databas=
e, Email, FTP and SSH.

Advanced Persistent Threat (APT) hackers had also changed "Primary email ad=
dress enabled" to No. I had to change it back to Yes.

For Virtual Server teo-en-ming.com in Virtualmin Linux VPS:

Advanced Persistent Threat (APT) hackers had changed my email account user'=
s Login access to FTP and SSH. I had to change it back to Email, FTP and SS=
H.

Advanced Persistent Threat (APT) hackers had also changed "Primary email ad=
dress enabled" to No. I had to change it back to Yes.

After making all of the above changes, I am able to start receiving emails =
with my email accounts hosted in Virtualmin Linux VPS since 1.15 PM today 1=
7 Dec 2025 Wednesday.

When I checked OpenSSH server logins and Virtualmin logins, only public IPv=
4 addresses belonging to me were present. There were no traces of Advanced =
Persistent Threat (APT) hackers gaining unauthorized entry into my Virtualm=
in Linux VPS at all. Of course, if they are Advanced Persistent Threat (APT=
) hackers, they must be very smart and intelligent (their intelligence quot=
ient IQ sure way above me) to remove all traces of their unauthorized intru=
sions into my Virtualmin Linux VPS.

How can I make a request to Advanced Persistent Threat (APT) hackers so tha=
t they will stop playing pranks on my Android (Linux) phones, home desktop =
computer, laptops, Virtualmin and Webmin Linux servers and other various nu=
merous online accounts not secured with 2FA / MFA?

Please advise.

Thank you very much.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Extremely Democratic People's Republic of Singapore
17 Dec 2025 Wednesday 3.50 PM Singapore Time


