Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E07D1D4142
	for <netfilter@vger.kernel.org>; Tue, 19 Nov 2024 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732039226; cv=none; b=HS5wpN+DxIep/X0YPNPpTenXhXn7YJwbZp/AwYuuq8UkQh0A65n6Hi+/6jZNZ2HUvAvd1sZ+P1AOQuepfS/DzmE3iFzcMxO6bEtA4I07FLbEgjJzG8zZqC1awC5+709kxO93yn6z21w3vhkfR3/iLEJB95SskPz9TVoZf9RuqjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732039226; c=relaxed/simple;
	bh=IBJyWOPFUwPWKh0Id4SIuTwo/Z3aP5/DNEYCFpgCzY0=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pwpS/8MysvnJNH+Pq9LwotKUBDFGZD9XeQ1rjaKEpBZ8yIAIenlcBnxKGZUSOBgHJxbfpNFGzzZcxhhdeB+kf314OO25ysref4bV1OQObwq0l9h+YzmyJ8oTnVabJUqzJb5zAzmAyCk2oYjIPGe0LSr9U9xKhlBMkNJnIuOP8XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=HmMO7Maj; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=D8Jjr0RX; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="HmMO7Maj";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="D8Jjr0RX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=IBJyWOPFUwPWKh0Id4SIuTwo/Z3aP5/DNEYCFpgCzY0=; t=1732039223; x=1733248823; 
	b=HmMO7MajinOXdkXBFDo24qhj57cEuqpg/mkxzPgWEDyd+sTWDkMUsqyer22ICKUdPBPHS1oLw0z
	3VuXLJWYQ5OdbcbHPxF5OCl8t5cAh1Cl9zmZQ78nSxwIkrhsTxEBMbc7Qb+4HDRdwKfSh+2bdrU5V
	IUfDNMvnyaB8k8NG9DA=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=IBJyWOPFUwPWKh0Id4SIuTwo/Z3aP5/DNEYCFpgCzY0=; t=1732039223; x=1733248823; 
	b=D8Jjr0RXjxosTBnhMcEaRVKm54ejR00RNDk+SGV/5q4J6z+K72yR4XS+2k0PZctQ/JtQQkUqwTN
	I8NIa8r5mBg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tDSWS-000n75-1s
	for netfilter@vger.kernel.org;
	Tue, 19 Nov 2024 19:00:20 +0100
Date: Tue, 19 Nov 2024 18:00:16 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: set with limit
In-Reply-To: <20241119160617.GA21970@breakpoint.cc>
References: <756a9507-5ecf-4ba4-a8d3-d364f13dbfd5@slavino.sk> <20241119160617.GA21970@breakpoint.cc>
Message-ID: <A49323C1-3811-4863-B527-57738F247231@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 19=2E novembra 2024 16:06:17 UTC, Florian Westphal <fw@strlen=2Ede> wrot=
e:

>Looks like 5=2E10 is too old, listing should show limit expression was
>attached, i=2Ee=2E:

Thanks, i will try with meter tomorrow=2E=2E=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
