Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7BA28371
	for <netfilter@vger.kernel.org>; Sat, 27 Sep 2025 19:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759002864; cv=none; b=d2HtrfsUznviH0rR2T/0KaRMzpH5YS+GoBzKLRhrCNwGyINE3eNt6DmDzwbZUuLHxlzKjbHCo9zGJW+D4wGvDbM01QHjy6gCVWJ+Rfvm+Uoq9DVdHfkvL9DC6vHQ3zKio1mkkXhfpdk9q8YXY+ouIUICz3F5bfGy2qlJGadIXbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759002864; c=relaxed/simple;
	bh=KjBlPCfQximDlVHpdWiFGCPiSK8L8TxiTlsYVikdQqA=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Bdo+sWhMvGNHNz79AYcBjJ4/ErXzB9JSHfBvV+tBEbpoHTE10SQE4PXPDWcofyhTZDoXWy8IxJa2ZgJb+/TAWeN5il1DqIT2zvy8rsVir1E2UhbbAcwr+hA4nq5IWuLOTAALQjY/XE12qNgqEq0L1lLaEXfVq1XsyQXwuuiIrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=tlwHxlQ3; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=9lriKmbe; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="tlwHxlQ3";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="9lriKmbe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	References:In-Reply-To:Subject:To:From:Date:From:To:Cc:Reply-To:Subject:Date:
	Sender:Content-ID; bh=6u432JJXaKmAuIL1N6ivbWDmIS6nKaeX+HPgf6WFqCs=;
	t=1759002860; x=1760212460; b=tlwHxlQ3NJckpBB3FPFV4ZcMHukq06Qe318Ab70JN4dHXMJ
	2YWUwTlj/tQ+WPULa9+IQM/gsqzd3F6ViSHjX+qLf9bGSvwCZVGs05th6RO1fzfgLXEgPWwsu8C7g
	LnZbJGxd03Hn5fW4B+B1I7RIPtTLl1MuOtThRKytD3fIcZ0=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-ID:References:In-Reply-To:Subject:To:From:Date:From:To:Cc:Reply-To:
	Subject:Date:Sender:Content-ID;
	bh=6u432JJXaKmAuIL1N6ivbWDmIS6nKaeX+HPgf6WFqCs=; t=1759002860; x=1760212460; 
	b=9lriKmbelhYT/1lcQKayPradYX49A31T6AP01PrhfUNcMIGJSch4LUTFaGgPQ55MK9hv8loFBjg
	ZwRtBztbmDw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1v2azp-000NH5-14;
	Sat, 27 Sep 2025 21:54:17 +0200
Date: Sat, 27 Sep 2025 19:54:14 +0000
From: Slavko <linux@slavino.sk>
To: Kerin Millar <kfm@plushkava.net>,
 "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: Re: list elements of set
In-Reply-To: <8f4996a6-2b16-477a-b753-515d2af8a84c@app.fastmail.com>
References: <3a8cc7e8-febf-4b28-ac22-ad03f936e879@app.fastmail.com> <8902E14F-5A51-4455-B40A-AA8B4F97BED3@getmailspring.com> <5f21dad4-bdad-4b03-bbfd-c767768058e8@app.fastmail.com> <589E8454-6788-40BA-A2F5-B60ACEADD97B@slavino.sk> <8f4996a6-2b16-477a-b753-515d2af8a84c@app.fastmail.com>
Message-ID: <826D2B00-B189-4992-9535-67B314C2678F@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 27=2E septembra 2025 19:19:42 UTC pou=C5=BE=C3=ADvate=C4=BE Kerin =
Millar <kfm@plushkava=2Enet> nap=C3=ADsal:
>On Sat, 27 Sep 2025, at 6:24 PM, Slavko wrote:
>> D=C5=88a 27=2E septembra 2025 10:59:54 UTC pou=C5=BE=C3=ADvate=C4=BE Ke=
rin Millar=20

>> 1=2E the nftables is list of objects, thus one must first filter the "m=
etadata"
>>    object, it is first list item, but who know if it is guaranted
>
>I don't think this particular criticism carries much weight=2E

I understand how are metadata useful, and i do not ask to omit it, but
my idea is/was that "nftables" can be object (instead of list):

    {"nftables": {
        "metadata": {=2E=2E=2E},
        "sets": [
            {=2E=2E=2E},
            =2E=2E=2E
        ]
    }}

Thus one can just use:

    jq "=2Enftables=2Esets[]"

Instead of ugly:

    jq ''=2Enftables[1:][]=2Eset'

Or too long:

    jq '=2Enftables[] | select(=2Eset !=3D null)=2Eset'

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
