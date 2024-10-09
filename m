Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1A7184527
	for <netfilter@vger.kernel.org>; Wed,  9 Oct 2024 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728461479; cv=none; b=eN2tMJVZaWlscGOa/kraaXy6+y+cQhie4n4pRpkA9vfan825O1+jV0C9sYEamN/WLOJLrPXCbQz3AQrXLyZfFEsw8z1Ms44WPMhNy89UiGKSCJpBXdMaXZ1CbZZy/+G2WrVydwthyVvyCMGI2qgVDDLVLgXvK6J6XKoHCXmwXpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728461479; c=relaxed/simple;
	bh=cu3mRmk3jaJXhNA/Ev98jUmS5sgSBB2XkGXYU6y2rTw=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kjh4mEri2jpOGV7ZMJjkKjxCf+TaKXiPzlKPg6OUXEvFLy9X/R+CiublRbQ/th1NPj3JvdO4A3ZwxES7qCSpsqR6mwfFCgACJgVTUtFqG2A+22vbA/MKcu0Z9BU02vPBFC8B1M5lR4linGD8fc+OXiRBgPFTIoH3Gy+xT8ObP6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xecycle.info; spf=none smtp.mailfrom=xecycle.info; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xecycle.info
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=xecycle.info
X-QQ-mid: bizesmtpsz2t1728461465tneqe9z
X-QQ-Originating-IP: 92XxsYCgUOhW30i9PFP2FV0QDV/5+Ao1oiamLSlNfI0=
Received: from xcws1 ( [116.234.71.230])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <netfilter@vger.kernel.org>; Wed, 09 Oct 2024 16:11:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14016199219838561212
Date: Wed, 9 Oct 2024 16:11:03 +0800
From: Carl Lei <me@xecycle.info>
To: netfilter@vger.kernel.org
Subject: Re: Problem with ipv6
Message-ID: <686AF66561802BD5+20241009161103.3330b146@xcws1>
In-Reply-To: <504b1c67-8335-4839-83fa-ea4e39d745c6@tootai.net>
References: <c3e11308-7b43-456b-af93-a03a6040f223@mtasv.net>
	<bbde0691-8b84-48f6-abff-7215bc634cd3@app.fastmail.com>
	<504b1c67-8335-4839-83fa-ea4e39d745c6@tootai.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:xecycle.info:qybglogicsvrgz:qybglogicsvrgz8a-0
X-QQ-XMAILINFO: M5xIOTYiLyj9JUxSrKpZx1XN60vP4t2B1jS7d7u3Nb619pTjoX7JDvAT
	H55z41TDgz0+ACyLDOKNDMI/TTY0V4e6+jhDrZ6xnHLgwGjMF0QyQKvph+wsJxS73+QtSDR
	2OUECqZbaFmUYR2i70PtemjcIFJd5Jr+NFTJUcsCynX2SyfNInMRiTfcpkaBNdzY6YW2xek
	AbxV/asboJ/UIZtALHjred+aq2GlAORLUuD9R+Gdp96Qb77+n1MVwbmJMpeDQeRQ0zdUVWu
	N4EScVGR28Vr0m0vfeRyFyaWF/CFh2MUBFS+neCSiQeeL2FCRA+9BylygeBc85vTGlKOEG9
	b8NkPIRZAj5ixRlZTbp4ho9Jf+N//81Bh7RzjJkA1tI3a1r9SB5vLNUpfeWdpFP4Gp9tZ4M
	tiyNHoh4SPk0KZAyDyBJ7i89eSh/rlPrz/q0ZZvaEv68Y0QNjoyjdTaGIDGpJKyv4xWOE1x
	4SfshvuBvh8jrC8w70y+Z+6SQtn6FaOC1TlXLRcX7z2FC1Kh/AnCv6FLRkufIjmiHsE0v1Y
	+bi8T96lPrhmsbxvIslJxakJqM4F+YAJgRJE+5EOZnxxVIP0W4mH1JoQ54TIzUDw0/IkvAH
	J5+EdUH/Gy45zmjHpEDAYf6uIQ2SAjsYbR0Y/Q0kMoSmv5NN0fpn4LS4cxfCtcSt8jO4GyP
	HHrmetgm2zhvopP7QYv42U88zDiGkFMDXi7J9a1wjjPghiePV2o0DnWuBaeMwcygXE7q/oh
	+okZKzki5KWx9fhMFNQl70ZyznIfQqJdHTh1WiMn8lEErfyx0RDkPAKqmYuPLlUDoh/VR+T
	bggR1kDhAHySKC4w5i6pmylUgwLw0CDrtTYa7S3L7JX5BTaW6j11JaIlaLOWFr+ZDrFGT/l
	At7xrlf3KL3ThO1f8S0J+fgDlsVbtPWX
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

On Wed, 9 Oct 2024 09:50:22 +0200
Daniel <tech@tootai.net> wrote:

>=20
> Le 08/10/2024 =C3=A0 22:28, Kevin P. Fleming a =C3=A9crit=C2=A0:
> > On Tue, Oct 8, 2024, at 16:08, Martin Brampton wrote:
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain output {
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 type filter hook output priority filter; policy
> >> drop; ct state { established, related } accept
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo-request accept
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo-request ip daddr
> >> 127.0.0.1 accept
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 icmpv6 type echo-request accept
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol { tcp, udp } th dport 53 accept
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 123 accept
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport { 80, 443 } accept
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport { 25, 465, 587, 993, 995, 4190 } accept
> >>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > What happens if you change this policy to 'accept', and make no
> > other changes?
>=20
> Or simply add new in state
>=20
> ct state { established, related, new } accept

IIRC many NDP packets have ct state =3D untracked, so you are proposing
to accept all TCP+UDP connections and still having broken IPv6.

