Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D121DFF7
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741795733; cv=none; b=PmsJrKeu0E8KCgMf0W1IoB6clqg/HG7GoKgkVCYgu9qNcQqLW73JS0+LOs537Pq3zKqKddIkS/jHNAkY+FRi1MnemhjNj+FhOEDoZBcEXXYX7hVoj+5qn6adYPJclGRFMgZiYKtPBojxxbB2NUCFEnVvRkMN6wp+ucT7spcbTaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741795733; c=relaxed/simple;
	bh=buCOiJ4HNnTEH/r3RNwiYDJc+1xZEMFFK+QxMgCEMP4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=KvOKh3UtYbUJT8Kl/rQm/VbIvPFsp94bcPvSnUgUB+BIzV1QseG8w1N5zGkQ6I05pOLhVGqxkXW6GYwY3if202VXIXckL85MWXBIlsic9dKIiDRUX4cDfOvi57XbDrQpo8qN9WF1nQlaGIDc5miOc+qX+8s7GkoyQJbQRH9MxRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b=m4l8d3ZC; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b="m4l8d3ZC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1741795728; x=1742400528; i=lars.nooden@gmx.com;
	bh=heoezZPdvgVXLmc7jbcnx9TCcP55i9XJxHm/C0FGfi0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=m4l8d3ZCXEhph86b53OnmM/mYv5Nm0Ha3KxoYL/nHu598gAfzqtl/QwCvoYo+SRw
	 JcfWKhK3SqkHmpjLBRzZvf7gZsl8jslgtKRPNJBOD2pNfQMFmALk0Vz5VL+2b+KN0
	 szhZbeN9L9lJUsaG5QGWRg2vZpR+bVS9EPnJPO09/kNLLpax/dOMlNX2P7FBdabFb
	 eN3ZJDUQAuNzm+sw+PdrHXCIvSVnkOUMwcrSWAvlwr+S5LVMVq54rA+W+AuzCFhzZ
	 k0qcFMK1L6sxiolNtg9LhzsiYKEGYptjy1IzVAUY+FbRLsd3i7GjCSN29DBrrFFEh
	 HRYLyX+KL1oFy7cXfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.11.9.65] ([80.220.97.94]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MCbEp-1u1RC72wPz-006DFS for
 <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 17:08:48 +0100
Message-ID: <6eec303a-752f-41e7-a903-37b3614d170b@gmx.com>
Date: Wed, 12 Mar 2025 18:08:48 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>
Subject: Dynamically appending addresses to a named set
Autocrypt: addr=lars.nooden@gmx.com; keydata=
 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 jw==
To: Linux Netfilter Users List <netfilter@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aYsiwASJlUWtZuNXhUk+uLAH+H6wYSYh3JK+G5OQ0BE+cuLPTbZ
 ohHmqlNMuhiIyObcIIYFNjIDqbRUoVpk2ll2xLwB5UyQ5IOq9NdmhjXnygSHWSPQca1FZLc
 dRgFcVDTm9zbdcJp09+hVC7IC1d52J/OD2J9gSHOhBYlIfFWouhyy0GKwNZA193AdZQ0OOV
 XYg5IYqTZxIXTcm+cbR1g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sNVLefvrAbU=;PomrqLeh31qt0XkxkkxF9dnHchY
 VVf5xOyCj+Q87/u6JDR6yupOBC/0OKpmHoIUXQdoiq/QB5mFPSlT9kGLP/tMh2Sd8Jmvkz4HE
 sJ304rRMs/znX2NBfMq2mTC7Fi2FtSGtaUuKHn9tnpQQzVc90xYCa4JgJ4H9MX/xUr5gJWlnG
 THRRnC3hf2a4j07aTuB/hQa7yb9zxIR4oYrCngWCR2xONIK6+A8L4F9bNRKHX8zCWqqVWcmje
 n40Sdezpu60aDQgyZLWPMCQkEWLk19rPDNf97uefnAJjRjYDES+rkrVXZ0XuSqHGZHD+tMqXr
 neufCPSPHvNRwVQscp82JqHBMTLfWtKM8INvTq1KDvsybE5KR9jIC9OJua0KWlIVZIiXBrktx
 RBVSfU9YXd3/bWTSjz45zDY6+uoLkv6gV1zKQOE5cjvJZPWKQx8Ex8plc1KGTs4cWKADgoMdG
 2MINjKqZRPMFNannXMp+GGYSLQAJFs+7PZiT0F0L16I62yfs2utaBjLdNHjHRI1bXlCVL0Wgz
 OgVvCyLCZVDzZMrDpP0dAl1iuLpM7KBmbigf/V0FzJU2X/iOHuevs0kFKaHz1/ECNfLajFMvq
 jARa5cvranJpqIQjIbM42Uqvfg3HzoB0lNDlcwcq6Z3+JdvdgBqc8RVBWIhqq6iXANeDSTH6+
 8SAbTKV5nQyWFKUpyMskC3ACHzR7iuQEmPmvBX+Mi8UvhlHQzGI2rcYvc+EI1W5vujrCJT4hY
 y/J3tSbkAh1oinFoE+vS0cOK4bqm3C8Ty4fe/QgwU18AcpK1GxcptHxpMHKaBP+0HZq/iareK
 R/08nuPKf/q9OrIdhloFqJbSz/75QgSjIHBouD56jcDHyqOBIfspLdvCggV6lriupbNMGvgBV
 l/RwsWQcBaRNt7Tl3fjesKHWeMi1nPtQzRccT0w167++b//cwI64jGj99+5rLpPn1h5jwqwI0
 JQfCxjPYYzvJs7yCFAVKiYy+xPAcgjn5MYaau4oK/h4PqVd2Rs9vWK8scTMxTeIEEJvkHtysI
 FU0eaUDcmoDq04FlhDTHwP1thosJfYKrU+eaufx0MENJqS7QJLgehXJeKvAimsZPmRcXMx/or
 YfUgvgwy0bGo2AW4+rEZdjeSI0CbhlVfX7xGg+TOPvR0z5vW9M61nPEGd4Y9u9a3AM7YjC22m
 09/F1p/aWdbu13lhSFfvL8hGa9Vi6f7Ewh+3LHIhhloM4BKJHPDaENwCUTNgNwWDiHQqmqdWd
 iV//dMa1nl//iYN7aJ8NJPCzyiKLurdNHU5fspJUBPNnWsD6qHEdECutLo9TO8Oc4nZSEpVmf
 F6mIjHgHTjpR/8TrczSoGKeGx7Ax6+V0AqRT63T/utV5e/DpzI1xpMi2KeqDlg5KI4PMM+PYE
 CYHPQdvtpgdvgMqb/x1lsXXxCYn/I1OltahQc=

Hello,

In NFTables, I have created a named set called 'bar' in the chain input
in the table foo.  I can add elements to the set manually,

# nft add element ip foo bar { 192.168.2.2 }

However, I am not able to guess the syntax to have a regular NFTables
rule do the appending automatically.  I've tried a lot of permutations
of the following, but always with fatal errors,

# nft add rule foo input tcp dport 22 counter add @bar { ip saddr }
Error: Could not process rule: Operation not supported
add rule foo input tcp dport 22 counter add @bar { ip saddr }

# nft add rule foo input tcp dport 22 add element @bar { ip saddr }
Error: syntax error, unexpected element, expecting @ or '$'
add rule foo input tcp dport 22 add element @bar { ip saddr }

What would be the correct syntax to have a rule which automatically adds
a source IP address to the named set when certain conditions are met?

/Lars
