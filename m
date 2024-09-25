Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D149D1D5ADD
	for <netfilter@vger.kernel.org>; Wed, 25 Sep 2024 18:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727288820; cv=none; b=kFANNOPrwRaSa2Dmh+/x4qthjQm5vKLJAg7PbGYeyfnQ87JL+34CHHAf45XMWwPOGdje6W5sPwztBfLYDZO0R9DP1ID1IoXHG79ddudHOLPt4aaJyiDNJyCFG4h8g0ony7uvneY0lctQYsxyKnAmLjoiKmHgWR1X+DBdKLZmFl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727288820; c=relaxed/simple;
	bh=wAJsrqik9F17S21TMjxBVI/H8Zo0AQlBpn8Hcbgwwr4=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mt6QCGYR7lF9SfI11dzu+QEhsibkYeOBGshT1OR009Ei1BpPv76Lnzg+HOJxTSXmP336UhlPbYYyglKI9HeImxkhhFkmBHsnsi6vGkSIVDwLzfHos2+yJIdE1EPeQD+IuVmYtOkboulyyvmf0Jg7UWT1QHcPMLPTx+N6D8TWlCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=JdBAypjy; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=/QIf9fKH; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="JdBAypjy";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="/QIf9fKH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=wAJsrqik9F17S21TMjxBVI/H8Zo0AQlBpn8Hcbgwwr4=; t=1727288815; x=1728498415; 
	b=JdBAypjylU92oobgBmPV0AvAWPS2yFQvWyJTtPY+3fR0eAz/H24nrvIr4UsFIy61Yz+Qg0LWuC2
	aRmBxwcw2vfCeQsfkFMjbuGP0y6wu4PWGfHkGVm4UXFVloGW1Vm5uLfV7dhCOTeI9665SqIAygLqp
	aFlelYYhjdJ5UNTaPaQ=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=wAJsrqik9F17S21TMjxBVI/H8Zo0AQlBpn8Hcbgwwr4=; t=1727288815; x=1728498415; 
	b=/QIf9fKHjzJyY4vf3BXyOWBIgtko3G6G0lbyp6hkIrHambWYh/LOITV3bgJXJuVGu06m7I7N2bv
	3lk/j9s6dAw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1stWaj-000i3J-0n
	for netfilter@vger.kernel.org;
	Wed, 25 Sep 2024 20:18:21 +0200
Date: Wed, 25 Sep 2024 18:18:18 +0000
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: Re: Allowing closed connections time to drain before logging packets
In-Reply-To: <97d9d783d0ff4ac494b909176f2a99df2d1190e5.camel@interlinx.bc.ca>
References: <97d9d783d0ff4ac494b909176f2a99df2d1190e5.camel@interlinx.bc.ca>
Message-ID: <5538AEED-B141-4584-A081-4B37559F35FE@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 25=2E septembra 2024 17:09:38 UTC pou=C5=BE=C3=ADvate=C4=BE "Brian=
 J=2E Murrell" <brian@interlinx=2Ebc=2Eca> nap=C3=ADsal:

You can consider to extend netfilter connection timeouts=2E

>IN=3Dens3 OUT=3D MAC=3D[redacted] SRC=3D[redacted] DST=3D10=2E75=2E26=2E3=
 LEN=3D74 TOS=3D0x00 PREC=3D0x00 TTL=3D43 ID=3D3769 DF PROTO=3DTCP SPT=3D33=
944 DPT=3D22 WINDOW=3D229 RES=3D0x00 ACK PSH URGP=3D0

You have two options with TCP:

+ setup kernel knob to consider NEW packet without SYN
as invalid and drop INVALID packets
+ drop NEW TCP packets without SYN by exact FW rule

Both drops do before log rule=2E=2E=2E

>IN=3Deth0=2E2 OUT=3D MAC=3D[redacted] SRC=3D[reacted, remote IP] DST=3D[r=
edacted, my local IP] LEN=3D99 TOS=3D0x00 PREC=3D0x00 TTL=3D59 ID=3D0 DF PR=
OTO=3DUDP SPT=3D443 DPT=3D37242 LEN=3D79 MARK=3D0x3f00

A little complicated with UDP, but the same logic, drop NEW
UDP packets by exact rule after accept of ESTABLISHED and
open ports rules, but before log rule=2E=2E=2E

For both (TCP/UDP) consider to add more conditions, as sport,
ephemeral dports, etc=2E=2E=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
