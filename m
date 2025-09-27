Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C981BC58
	for <netfilter@vger.kernel.org>; Sat, 27 Sep 2025 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758994423; cv=none; b=G0TWHzDt4nvejUDczQvkeyIyey88/9lR6EMoJ84aSBDibQeyoz6MQB6h51Sg6aaibmKQ9XqbYJ72mKUod8f1bhxImiu/+MlKqHBmUFFm9+AzNRjfMznYKDamJZybf6mbZHrwOp1lAmSdbrSK0Ktu5zQCPDkIDQ31JyHvjA1yigg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758994423; c=relaxed/simple;
	bh=gwSYKLBoL2xvndME5auHggMTXbRz9Bu1PKVm34RwNC4=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YeXJt8T1JMsWK9YSpmOdhedXSyoNQm2/AyT4hhr4F96a/OXOBTShoR0TZcOp331Z615blHk2l/sTpjVMItmuYi5UfggNgPnvxtS1GoK7sBdfl7nrfczoRARo+/XpYbncxp1RaOPLLhnxm+u3UHwa23yM24t5lGCBbK9UVXJQzws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=nhTIykb0; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=dyr9ONbq; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="nhTIykb0";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="dyr9ONbq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:From:To:Cc:Reply-To:Subject:Date:
	Sender:Content-ID; bh=dJtCAYIoI7gukLr1itTygyoeddGGCdJb/XQ5dx2+Gyk=;
	t=1758994418; x=1760204018; b=nhTIykb0tJQpEaesYcXR5Tn+m1ZMcbhT3jvezbP+ZGMs/Tq
	RY+Wexqs+VMVxuuYenYefEQl6ipRnWjV9pQGn/8qcmZcqQG8cs9Ujmz/ZNEPRZLWksDZnhu+ZG/Fj
	i98EuUr6hOIHGtr1oV6QgXUo163f9hmae9Pf38bFqgjmJeI=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:References:In-Reply-To:Subject:To:From:Date:From:To:Cc:Reply-To:
	Subject:Date:Sender:Content-ID;
	bh=dJtCAYIoI7gukLr1itTygyoeddGGCdJb/XQ5dx2+Gyk=; t=1758994418; x=1760204018; 
	b=dyr9ONbqpKasjHNCAlcjwBRPfRCeZLil09hSbEPQHgy85zRgAhrPqT3nMEyGkdtRNY6D7yjyK7H
	+gTOsK5AaBA==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1v2YfH-000Mnq-1g
	for netfilter@vger.kernel.org;
	Sat, 27 Sep 2025 19:24:55 +0200
Date: Sat, 27 Sep 2025 17:24:52 +0000
From: Slavko <linux@slavino.sk>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: list elements of set
In-Reply-To: <5f21dad4-bdad-4b03-bbfd-c767768058e8@app.fastmail.com>
References: <3a8cc7e8-febf-4b28-ac22-ad03f936e879@app.fastmail.com> <8902E14F-5A51-4455-B40A-AA8B4F97BED3@getmailspring.com> <5f21dad4-bdad-4b03-bbfd-c767768058e8@app.fastmail.com>
Message-ID: <589E8454-6788-40BA-A2F5-B60ACEADD97B@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 27=2E septembra 2025 10:59:54 UTC pou=C5=BE=C3=ADvate=C4=BE Kerin =
Millar <kfm@plushkava=2Enet> nap=C3=ADsal:

>You could parse JSON with the popular jq utility, or some other JSON pars=
er of your choosing=2E

Yes, one can parse JSON with jq, but it is not simple task for shell, as
output of list sets is, hmm, i don't know how to describe it:

1=2E the nftables is list of objects, thus one must first filter the "meta=
data"
   object, it is first list item, but who know if it is guaranted
2=2E then one must distinguish, is set object has elem key (empty sets mis=
s it
3=2E then one  must determine elem key's type, as it can be list of values
   (scalar) or list of objects
4=2E then one must decide if value of elem object is in elem or prefix key
5=2E then one must again distinguish, if value of elem=2Eelem key is scala=
r
   or object
6=2E and finally decide key(s) of that object to get real value (val, pref=
ix,
   concat)

Thus yes, it is valid JSON, which is parseable by standard JSON's tools,
but with jq one need either to construct horrible script, or create set of
simple sctpts on per set base=2E=2E=2E

I currently play with it in python, and with my real set of sets, i am
still on step 5 (of above)=2E

Please, why is JSON output as non user friendly and differs by set's
settings?

regards

--=20
Slavko
https://www=2Eslavino=2Esk/
