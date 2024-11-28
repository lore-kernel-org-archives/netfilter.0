Received: from srv1.dorfdsl.de (srv1.dorfdsl.de [82.139.196.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774519882B
	for <netfilter@vger.kernel.org>; Thu, 28 Nov 2024 19:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.139.196.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732821969; cv=none; b=Ozjh3nysb9kMhgBYpiWlWhHWdqKJBUnNO3Y3C+rB5CjXPxro0ZLH39rmp4c0KH49l3XSXavTxH4YSvD4vJQipdaKBp5vy1UCLBGr+v61yzqPZaFV4TF5RGNvaukw9sLzjUugQzRtifQHO5Jr4DbldJrPWm/mgNOsI7XXmd+n0TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732821969; c=relaxed/simple;
	bh=eXg0FfCIxT08jfzBF0xeWlwi+ncIUoFwJ7A8aR1xeLY=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hziTQZwHWAifmVVTOeXSCf2KsLkxZE5lp4ZIdVi9PEEatrHchZLb1lTBcb31LxlgBegKwvUItE4ElccrIf2FEXvTTeWSMLcA6ScwLUc8WllBGSeTA3Kxg6aDtQ9usjRJS3u6AljICn+Wz3nbOg2CQKF6eINK6/WaJLQZv9ZOsnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dorfdsl.de; spf=pass smtp.mailfrom=dorfdsl.de; dkim=pass (2048-bit key) header.d=dorfdsl.de header.i=@dorfdsl.de header.b=GgsDPaos; arc=none smtp.client-ip=82.139.196.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dorfdsl.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dorfdsl.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dorfdsl.de header.i=@dorfdsl.de header.b="GgsDPaos"
Authentication-Results: srv1; none (SPF check N/A for local connections 
   -  client-ip=2a01:170:118f:2:95f9:adad:ef4f:4dfc; 
   helo=[IPv6:2a01:170:118f:2:95f9:adad:ef4f:4dfc]; 
   envelope-from=mm@dorfdsl.de; receiver=<UNKNOWN>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorfdsl.de;
	s=default; t=1732821384;
	bh=eXg0FfCIxT08jfzBF0xeWlwi+ncIUoFwJ7A8aR1xeLY=;
	h=Date:From:To:Subject:In-Reply-To:References:From;
	b=GgsDPaosV/T4PW3uCMLgzP4CczU4IgIvWFev9Fwpf9s+M2QJ1BRWHEPG9f9VVc1aJ
	 4/5CG8CE34xtnhTBHFlJ6VB3pqIUTOibwZ3YoAlntUGtoq/RiUwVd1KS4lbiHEuB9K
	 HglL2A0OwA8dja7LHr1FdxcT49qIYOx5DCnMUvpwrFbGBeHWPUfpA72JcW7V/PCGhe
	 YcJb9kYMQWfnyE8/D/ckz32yb6LOVQ/0xzeoktgK7duahgKzZQc0zw3gK1PUCRmLZo
	 XzerxOgHHAsaVqWDQz2YULXQGQaQZObN3mIC04eXYPVq2xZ9DW2ergLUjTAZ4Cc4V0
	 7Gg6Q/TJkRoBw==
Received: from ryz.dorfdsl.de ([IPv6:2a01:170:118f:2:95f9:adad:ef4f:4dfc])
	(authenticated bits=0)
	by srv1.dorfdsl.de (8.18.1/8.18.1/Debian-6~bpo12+1) with ESMTPSA id 4ASJGLWm106042
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <netfilter@vger.kernel.org>; Thu, 28 Nov 2024 20:16:24 +0100
Date: Thu, 28 Nov 2024 20:16:20 +0100
From: Marco Moock <mm@dorfdsl.de>
To: "netfilter@vger.kernel.org"  <netfilter@vger.kernel.org>
Subject: Re: logging to a different place than kernel ring buffer
Message-ID: <20241128201620.48a08ba5@ryz.dorfdsl.de>
In-Reply-To: <PH0PR05MB8159440DE55AAF8E8C6CFB9CB1212@PH0PR05MB8159.namprd05.prod.outlook.com>
References: <20241120210636.6df71d81@ryz.dorfdsl.de>
	<PH0PR05MB8159440DE55AAF8E8C6CFB9CB1212@PH0PR05MB8159.namprd05.prod.outlook.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am 20.11.2024 um 21:14:07 Uhr schrieb Jordan Dohms:

> Change the kernel.printk parameter in sysctl to not display the log
> levels that nft logs to in your console.

This is what I've done without modifying the log level of the netfilter
rules itself.

Mine are created via firewalld, so I will see if there is a way to
change it there.

--=20
Gru=C3=9F
Marco

Send unsolicited bulk mail to 1732133647muell@cartoonies.org
