Received: from srv1.dorfdsl.de (srv1.dorfdsl.de [82.139.196.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478614C81
	for <netfilter@vger.kernel.org>; Tue, 29 Apr 2025 18:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.139.196.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952515; cv=none; b=Xo9+L9s9Gn6qXdmhgrkZ0r5FxPRH5i1dmwnhG3HIKaYPXOrfPHHk/r6+yL6jJSoWjK+rRHyxQPaXW0zDrzmayVuU8KpIcQCsmeJtcybdtIKD31knNwvg/oYzzXOREbjIcqSZlRPr7gBL1jToI56ju8D1eW+002wayK9pqgJq9ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952515; c=relaxed/simple;
	bh=v/Vre8XXkKPBHQvaiSSn2G/kOFQ2pnSFVYtKxQz1EHM=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JHgcQ7u9N0JTPusP/gEYN5vlPc5zNBwwnnEld/RVWiNosnTHjH8U1W/NwMDhCwu1VltIx/tR7rP/W//AiL+4bx14smwGktGZiMblRnZJAPqwtgfbQXUEtvYD6s2lY9f1I8U6nm972YJkEsXlmwa1EfuM6AmhQe+pXku77U4JpMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dorfdsl.de; spf=pass smtp.mailfrom=dorfdsl.de; dkim=pass (2048-bit key) header.d=dorfdsl.de header.i=@dorfdsl.de header.b=K6Qt2RO7; arc=none smtp.client-ip=82.139.196.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dorfdsl.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dorfdsl.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dorfdsl.de header.i=@dorfdsl.de header.b="K6Qt2RO7"
Authentication-Results: srv1.dorfdsl.de; none (SPF check N/A for local 
   connections -  client-ip=2a01:170:118f:2:c68b:7958:7335:bda8; 
   helo=[IPv6:2a01:170:118f:2:c68b:7958:7335:bda8]; 
   envelope-from=mm@dorfdsl.de; receiver=<UNKNOWN>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorfdsl.de;
	s=default; t=1745952366;
	bh=v/Vre8XXkKPBHQvaiSSn2G/kOFQ2pnSFVYtKxQz1EHM=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=K6Qt2RO7vfaUcQ316rWZ6EBFd280CTWxT620gNlI0ZGFniTMvqfpQaAHYdE17m50V
	 4wVwWsbrXhWlfrDWetIOQP2+0ILThNwyszOtbu4OhTTOzOCwCEXH2P7O6mIc1jjqQf
	 ZiGZ3vkl7+5IHnEZoW13MOJcnoYWMZOD44qQXpSSWqp0pzT89M8Y6oT/3CCcs+I3j5
	 PG21+3xWaqwnH26MrJAIedyCU2LFvQVUc6S/QJY13DJ8Kb1T8k6wz0GlfzfOK9KgwL
	 LDjrwixkS8SMxs0gX8hSShIYqdDTgZIIXd6WtwCuOfYK7zoWI+kgrSiZcRqYrYvckf
	 +I9oiBWrXVemA==
Received: from ryz.dorfdsl.de ([IPv6:2a01:170:118f:2:c68b:7958:7335:bda8])
	(authenticated bits=0)
	by srv1.dorfdsl.de (8.18.1/8.18.1/Debian-6~bpo12+1) with ESMTPSA id 53TIk6kN548338
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <netfilter@vger.kernel.org>; Tue, 29 Apr 2025 20:46:06 +0200
Date: Tue, 29 Apr 2025 20:46:06 +0200
From: Marco Moock <mm@dorfdsl.de>
To: netfilter@vger.kernel.org
Subject: Re: send all traffic to a specific address
Message-ID: <20250429204606.5f988720@ryz.dorfdsl.de>
In-Reply-To: <0f1f9636-ad4f-410c-ae4b-b628552dc98b@pahlevanzadeh.net>
References: <0f1f9636-ad4f-410c-ae4b-b628552dc98b@pahlevanzadeh.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 29.04.2025 um 22:10:30 Uhr schrieb Mohsen Pahlevanzadeh:

> I have a linux-box and run a program to send my traffic to another PC.

Which purpose does this have?

> Now I have 127.0.0.1:8080
>=20
> I want to send all of my traffic to this socket. I don't want to send=20
> even one packet without touch 127.0.0.1:8080 Then 127.0.0.1:8080 send
> my traffic to eth0.

I don't know how this is supposed to work, please give more details
about your goal.


--=20
Gru=C3=9F
Marco

Send unsolicited bulk mail to 1745957430muell@cartoonies.org
