Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4717F4C6F
	for <netfilter@vger.kernel.org>; Sat, 16 Mar 2024 22:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710627724; cv=none; b=mOiuwrTTzWCsOScwZ8bhEDJdZyi9n7yHwigpbgbIrA+VJS/aaTNGCRuiZoubIotfqFagetqYBTdSGkg91WEzJx8ZWdgzxwxawKBefCcGQNNM/lIaexX93FEb0louPbrV+nQPo/g+IVH9ZGL4zH/8iE491o10gDDZSvFnAwdV2EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710627724; c=relaxed/simple;
	bh=zwNlQzCc+ncv3R1JaxUo1YGwkIPxtuvYnKxR+djav4k=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=rbiA+N/QMmFBjrQzOosGg/DdNmXE5EHYpCSMeg3YJ/lyhxegV2c73RvzPLcoCBT/tlBOvqreyJB7A+pW/Hc7DeST86XlybA0V2FWP6rWOhvnUQA/MJsfuecK7EQa67E69iX7raR0IGPQB5qJV+ytyKdMQAuf+zgpGmc6pJgHLIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=WJ2rdYHT; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="WJ2rdYHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Content-Type:From:Mime-Version:Subject:Date:
	Message-Id; bh=QW6PrwTmBHWpHc7h7lFPDI6c+Uq/+H8J1RVURW1worU=; b=W
	J2rdYHTTOEDJ/tsUdoUC2aeNMhO7Id+C6D8FnOJuC4KN1/ByToCTQnqgPnSVc1pl
	+QUoH6R/vlBu/PEYjdMkpm6Z0+JD2333gXFIKUm6yaAMG7bSg/s08D8lC9HttGH1
	YW/s/glASprWe3XmFgqW9Fn8X2JS1ZNfVhDqKDQRoc=
Received: from smtpclient.apple (unknown [113.84.40.220])
	by gzga-smtp-mta-g1-1 (Coremail) with SMTP id _____wD3H7Z2G_Zlcl15AA--.46903S2;
	Sun, 17 Mar 2024 06:21:42 +0800 (CST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Meiyong Yu <meiyong.yu@126.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: Cannot get the correct IP version from packet
Date: Sun, 17 Mar 2024 06:21:31 +0800
Message-Id: <4B8994A0-C977-4A79-8D90-7D20B44A04E3@126.com>
References: <c7e596ef-ab4a-42be-9e84-642f598e764a@tana.it>
Cc: netfilter <netfilter@vger.kernel.org>
In-Reply-To: <c7e596ef-ab4a-42be-9e84-642f598e764a@tana.it>
To: Alessandro Vesely <vesely@tana.it>
X-Mailer: iPhone Mail (21E219)
X-CM-TRANSID:_____wD3H7Z2G_Zlcl15AA--.46903S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUSRpBUUUUU
X-CM-SenderInfo: 5phl501qjo53a6rslhhfrp/1tbijhujhmVLZq7OZAAAs8



> =E5=9C=A8 2024=E5=B9=B43=E6=9C=8817=E6=97=A5=EF=BC=8C02:51=EF=BC=8CAlessan=
dro Vesely <vesely@tana.it> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> =EF=BB=BFOn Sat 16/Mar/2024 19:11:58 +0100 Alessandro Vesely wrote:
>>     char *payload =3D mnl_attr_get_payload(attr[NFQA_PAYLOAD]);
>>     if (payload)
>>     {
>>         int const af =3D (payload[0] & 0xf);
>=20
> Heck, should be af =3D (payload[0] &0xf0)>>4 =3D 0x6
>=20
> third time I change it...
>=20
>=20
> Best
> Ale
>=20

char *payload =3D mnl_attr_get_payload(attr[NFQA_PAYLOAD]);

 before this line, you must check if attr[NFQA_PAYLOAD] is NULL pointer=EF=BC=
=8Cmay be it is NULL pointer


