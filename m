Received: from mta204-ab1.mtasv.net (mta204-ab1.mtasv.net [50.31.205.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182D1208997
	for <netfilter@vger.kernel.org>; Fri, 11 Oct 2024 06:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.31.205.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629455; cv=none; b=V4ealtOWxrXOagoj4wy7ljGln9vOyLR013d6Viv1FamjCPvJVJDwM6PAZMzXpeVdV1ea0Ruv0/Re2TZJenbajKoIvCHAht6A/0cg007t1a54op6fn2gAMUsMLhovu5uVgpWuVQ2DEO/OSUa/OYNQtobXZpwh9maxnzXqa8hf7eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629455; c=relaxed/simple;
	bh=geiUSSy65h/1VIA4XUOE15mYQok7P1WD7EYq6RMjYLA=;
	h=From:Date:Subject:Message-Id:To:References:In-Reply-To:
	 MIME-Version:Content-Type; b=vD3WupkRuXE3wbi9r6SkTQbTe8yy1beQqioMHAw/8ZrW2OYOdgI7PvAXEPIHJkniYwfjq2wqs1S4adf0KPxT8LGrQZ7cuLUim5OZF3EtpAn+pO9buHZbVscIG9bO10F3qYtc4iM8wt9rCdSS0FWc76CDcB1Msmyv3jWxoAHm+40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com; dkim=pass (2048-bit key) header.d=ab.mtasv.net header.i=@ab.mtasv.net header.b=qf6u2a7B; dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b=LJ9OseTJ; arc=none smtp.client-ip=50.31.205.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ab.mtasv.net header.i=@ab.mtasv.net header.b="qf6u2a7B";
	dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b="LJ9OseTJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=ab20241004; d=ab.mtasv.net;
 h=From:Date:Subject:Message-Id:Reply-To:To:References:In-Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:Message-ID:
 Reply-To:Sender:Subject:To:CC; t=1728629453; x=1728715853;
 bh=bEKbkbNrGrmBHf1j7XlDtyAsxYJNFUJVzO6bj5FAITc=;
 b=qf6u2a7BI71qBf/xeAztY/A5SbvS1saMWhfRoXi4I4ovqh4pIgjKtT8Nd0H9qADiVhR9Ez4BKZGe
   FseWcB+fPU+8OLzQ/RubaguXMCDnu586k4TAbCYjHmPFpKD5QGlqB9n7aCc7gCoF+YSWVevgvpa+
   5nf9mok5wyUgZpvvN5xIDRQxoMh7EBA/VBESIXILdRc61Tph1lugjkYT1kv5kb1Lglai4Vgz+HWv
   UkzGjCtfA5nHP8ecgQZl8ylLWwosImMaA465/olIvLrwupYTfJJh7N3Uk/q9Lpu94CMSbaHaxig4
   bDCh5C5RFptoXTyuNiliVUT+/D0AA1O9mLGM8A==
Received: by mta204-ab1.mtasv.net id h135co3864oj for <netfilter@vger.kernel.org>; Fri, 11 Oct 2024 02:40:46 -0400 (envelope-from <pm_bounces@pm-bounces.black-sheep-research.com>)
X-PM-IP: 50.31.205.204
X-IADB-IP: 50.31.205.204
X-IADB-IP-REVERSE: 204.205.31.50
DKIM-Signature: v=1; a=rsa-sha256; d=black-sheep-research.com;
	s=20220127112152pm; c=relaxed/relaxed; i=martin@black-sheep-research.com;
	t=1728628846; x=1728801646;
	h=date:date:from:from:message-id:reply-to:reply-to:sender:subject:subject:to:
	to:cc:references:in-reply-to:feedback-id:mime-version:content-type:
	content-transfer-encoding;
	bh=bEKbkbNrGrmBHf1j7XlDtyAsxYJNFUJVzO6bj5FAITc=;
	b=LJ9OseTJt4Q3swMzWPWjcvSrqyBC0aWrT0nTvZ/M166YS/bNRXAXC6R4ZB/Qw6qRagWHykqXaen
	nOtU4HGltx4pdruqCZqV1uwq2MhDOuNPaOq4gS1CRulDC8ssM/rnju79+dMSub/u3y9I+oJI9e/0/
	1VJhyOeI83RrTozbSCM=
From: Martin Brampton <martin@black-sheep-research.com>
Date: Fri, 11 Oct 2024 06:40:46 +0000
Subject: Re: VPN nftables
Message-Id: <a6bd13dd-5536-4aed-93e3-51b14012bb57@mtasv.net>
Reply-To: martin@black-sheep-research.com
To: Kerin Millar <kfm@plushkava.net>, netfilter@vger.kernel.org
User-Agent: Mozilla Thunderbird
References: <b80835b3-5e07-4631-92b3-3c04b58a43d0@mtasv.net> <59586f06-cb9e-4810-b7ad-e397ea111485@tootai.net> <f1f09316-a0f3-43e8-854a-a7d6a7138aaa@mtasv.net> <798fe091-1614-4db7-8692-66c2d03a9f54@app.fastmail.com>
In-Reply-To: <798fe091-1614-4db7-8692-66c2d03a9f54@app.fastmail.com>
Feedback-ID: s8569101-_:s8569101:a226829:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: a6bd13dd-5536-4aed-93e3-51b14012bb57
X-PM-RCPT: |bTF8MjI2ODI5fDg1NjkxMDF8bmV0ZmlsdGVyQHZnZXIua2VybmVsLm9yZw==|
X-PM-Message-Options: v1;1.sgJlJopajLVONRsOj3-TDg.TWvcYyxErB5gUI8jqQe-rhWPJlLLq5MEAO3su3CdbH-ZXAh597S1gSgn2cdmx0xyZ5cLPEfEjFkr7VNXA18KWlfK5oPdHbKs2qCjfHxv4GOfmW5s-QECjoUjp_p-6TGqJFcANPhC4Ea4SddOeFd6DSJXpbAZakp83908oD_DnNNoiSTf-4NfskXG52FnsH0i
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-PM-MTA-Pool: transactional-3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks, I'm sure that makes sense. But I'm on the point of abandoning=20
the use of nftables with openvpn. I've already spent several days on=20
this. Other servers (about 15 in all) are running with nftables, and I=20
would prefer total consistency, but not at any price.

When I say can't access any services, I mean literally that. I can=20
create a new server, install openvpn, connect to it and use services=20
like ssh, mosh, https, imaps... And I can do that with an iptables firewall=
.

But as soon as I add nftables (removing iptables) and connect to the=20
server as a VPN, mosh sessions stop, web access ceases, mail access=20
ceases. Given that the ruleset opens all output ports, on the face of=20
it, that should not happen.

And from that point I cannot find any way back to a working VPN server,=20
which makes testing harder, and is disastrous for a live VPN server.


On 10/10/2024 20:56, Kerin Millar wrote:
>=20
> In your initial post, you describe your problem as not being able to acce=
ss any services. That does not amount to a concrete description of a test c=
ase. Upon your peer being connected, what exactly have you tried where the =
outcome is not as expected? What were the diagnostic messages reported, if =
any? If you were to focus on - and detail - a particular scenario, it could=
 make it easier for other readers to help you diagnose the underlying probl=
em.
>=20
> Additionally, you may find it beneficial to define a rule that enables th=
e nftrace mode for packets of interest. That is, those that you suspect are=
 being erroneously dropped. I usually do so in a prerouting hook. For examp=
le:
>=20
> chain prerouting {
>      type filter hook prerouting priority raw; policy accept;
>=20
>      # Trace any TCP packet arriving that is destined for port 22 at any =
host
>      tcp dport 22 meta nftrace set 1
> }
>=20
> You may then run "nft monitor trace" and observe the trajectory of the pa=
cket(s) through your ruleset in real time.
>=20


