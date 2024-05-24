Received: from cam.del.bg (cam.del.bg [193.254.29.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CABA81AACC
	for <netfilter@vger.kernel.org>; Fri, 24 May 2024 14:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.254.29.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716561765; cv=none; b=UkB/y5pvBa2V2oMYr2qLvp1FkdgY5BPNQ4FUjvbIQcaeq95w0YlExp14iBwqAKYd+bNTE7OKh5Z2Az6TGpRXI0rmSLI75f7CuwFnEHrcJTCoIJZl8dKsmTkx1xnwK9k03u6rsyL/PPvrp68PNoyUCmNXJqL1TBf3r6qK5hwDgP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716561765; c=relaxed/simple;
	bh=MiJQxMUf1WxAlmGQwqD7PSR0GyBV3ttyMuv+2Au3tfg=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Hj0yePEsguig2jnJ47penI39a+cCEQthkyub9SDuAo1jd1JcmaaSb1c9NnLU7/7ewNUFm6wtGVs8MzKjGqlqxDCPaG5jsFKH7YMbZpOHM8zKm8NMdiglM68UNTw6MwM2spFBrjq+Bb/koOjh4/Przt/rjBNLoMifWL9IiZs/8FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=del.bg; spf=pass smtp.mailfrom=del.bg; dkim=pass (2048-bit key) header.d=del.bg header.i=@del.bg header.b=XkQH8WEX; arc=none smtp.client-ip=193.254.29.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=del.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=del.bg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=del.bg header.i=@del.bg header.b="XkQH8WEX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=del.bg;
	s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mXLpwm4yiYgk4C2+PRBNtW7U+wq9uhMzctaHr1bcKWU=; b=XkQH8WEXsDZdc9dIM62si1yLrF
	SQVConuK1tC86VexM+ZfXfGYmT7ePZ5P6tk53pJJ39zj2qgrhAzP+5Rbg3IInUiS507IW4viGxypr
	51cNqPlMJBHA4IWYXz2xMnaKRBA7ZImSdLpb2nJHhidtcTb0R76hUuxkPHA7Phwn0glablrUlEdl6
	GkLURyRjMfcC0ddtaD2IXkbsalFAR98LPviR5ZchVqlQyjeJG8NLgJwFaQ33x8IjLQK7/mW0n5BKG
	hhTDPdpjUR8ZsagqgOQMqqhdKcyHFR14lhtI/6vTwAiDbgFKe39vu3X+7YmL1GUHuphXBbQgtuyTs
	BMLafvDQ==;
Received: from mail.del.bg ([193.254.29.12]:40352)
	by cam.del.bg with esmtp (Exim 4.89)
	(envelope-from <tm@del.bg>)
	id 1sAW7y-0007Q0-DD
	for netfilter@vger.kernel.org; Fri, 24 May 2024 17:42:38 +0300
Received: (qmail 13201 invoked from network); 24 May 2024 14:42:38 -0000
Received: from unknown (HELO ?192.168.168.21?) (tm@del.bg@185.58.21.156)
  by mail.del.bg with DES-CBC3-SHA encrypted SMTP; 24 May 2024 14:42:38 -0000
Message-ID: <ee410abe-b6c6-4e27-a516-fc3af750481a@del.bg>
Date: Fri, 24 May 2024 17:42:37 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US
From: Teodor Milkov <tm@del.bg>
Subject: nft not logging some layer 2 frames?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I've been trying the |netdev| table for ingress filtering, which seems 
to be working fine. However, I'm encountering an issue with logging.

Here's the relevant configuration snippet:

table netdev filter {
     chain eth2_input {
         type filter hook ingress device "eth2" priority filter; policy 
accept;
         vlan id 99 vlan type ip counter packets 68304372 bytes 
28196182850 accept
         vlan id 99 vlan type arp counter packets 756970 bytes 35442808 
accept
         vlan id 99 counter packets 441 bytes 49415 log accept;


As seen, the counters are updating, but logging does not seem to occur 
for certain Layer 2 frames - in this case UDLD:

18:00:55.426295 f4:4e:05:ab:cd:ef > 01:00:0c:cc:cc:cc, 802.3, length 
115: LLC, dsap SNAP (0xaa) Individual, ssap SNAP (0xaa) Command, ctrl 
0x03: oui Cisco (0x00000c), pid UDLD (0x0111), length 107: UDLDv1, Code 
Probe message (1), Flags [RT] (0x01), length 107

 From a brief review of the source code, it appears that nftables might 
only log frames of certain known types like e.g. ipv4, ipv6 and arp.

Could you confirm if this is the case, or if there's documentation or a 
configuration tweak I might have missed that could resolve this logging 
issue?

Best regards,

Teodor Milkov

