Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547E6BE4F
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741427667; cv=none; b=BkfI5ZjWVFQI9hSGM+ZMl1B82SVEls2ctOuppCvn0ElqKG7QZunVdxAMRSnj2NKg+A9yHPlXpVzM9LzoDqHyC7/+8X8ccf4e4lbcsSRuHH/fReG8Hr8cum9sF/8TzPhAQ3m2+AutdjXRZobEz6EzokAR/XF9Ij2dywxKMBwaGyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741427667; c=relaxed/simple;
	bh=sKy4IBR7a7ioxDyE1swpIgFlg+9LY+HLpo/uPMe7Lis=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qoC7Ue+sc7aFUkM99Y0FQWmR0vXqQ4Cu0DeAvTXaparxNwDzL+d+1mHBcRgkqxiTu4zfvHphysfTeoGGeLG906Flr6CG/h35SD+x8rB96mmG0U1SCJpplMG5/mAk+D30Y8XvMrq8ut/GaRlByjPzkAFeD8El+/jIZ76vC3hY9hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clae.net; spf=pass smtp.mailfrom=clae.net; dkim=fail (0-bit key) header.d=clae.net header.i=@clae.net header.b=BisnuRog reason="key not found in DNS"; dkim=pass (1024-bit key) header.d=clae.net header.i=@clae.net header.b=V1zmQpkS; arc=none smtp.client-ip=212.27.42.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=clae.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clae.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=clae.net header.i=@clae.net header.b="BisnuRog";
	dkim=pass (1024-bit key) header.d=clae.net header.i=@clae.net header.b="V1zmQpkS"
Received: from stella.clae.net (unknown [82.64.199.61])
	by smtp5-g21.free.fr (Postfix) with ESMTPS id E92F660141
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 10:54:21 +0100 (CET)
Authentication-Results: smtp5-g21.free.fr;
	dkim=fail reason="key not found in DNS" header.d=clae.net header.i=@clae.net header.a=rsa-sha256 header.s=dkim header.b=BisnuRog;
	dkim=pass (1024-bit key; unprotected) header.d=clae.net header.i=@clae.net header.a=rsa-sha256 header.s=default header.b=V1zmQpkS;
	dkim-atps=neutral
Received: from [192.168.254.101] (_gateway [192.168.0.254])
	(authenticated bits=0)
	by clae.net (8.18.1/8.18.1) with ESMTPSA id 5289rlPp495175
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sat, 8 Mar 2025 10:53:48 +0100
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.8 at stella.clae.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clae.net; s=dkim;
	t=1741427628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MpTITMmzioV046FOlYgfCwPDDT8Qa8MP7F/oZ34ftyk=;
	b=BisnuRogrz/2V+U5zRpSaqiD6PKGkolNrt6XYq3Lyc/jwmYxfFXfKyMSiB0bxxq1eVdq/9
	Nks3uBDMuHNAFmjOoF6pTborSFf6ydOh4nkZfHk0Zn/d9p+AsqZfp2KxhGOFRMjqtjv+Np
	C+OLMP5WlxWBzqcLyEytrJq8uMr4BAk=
DKIM-Filter: OpenDKIM Filter v2.11.0 clae.net 5289rlPp495175
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clae.net; s=default;
	t=1741427628; bh=MpTITMmzioV046FOlYgfCwPDDT8Qa8MP7F/oZ34ftyk=;
	h=Date:To:From:Subject:From;
	b=V1zmQpkSvVX1IkNRShjX8e7m8iU0sGibkCMKYoPlrcUSyFU/lpCnghTGqpGNa63ht
	 DBRijEYAwNQ1PSIbRoWfu7NmCxpGTr3YssasIEeJnB6BBE/6mD011JdoT8zIK2hq3R
	 nbxidx4PfAHgKZA0wTnNXH30UDbgCyDMB1VEyzUo=
Message-ID: <b49757d8-1e9a-4c23-8525-1b0e1846d6e7@clae.net>
Date: Sat, 8 Mar 2025 10:54:21 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: netfilter@vger.kernel.org
From: Laurent ARNAL <laurent@clae.net>
Subject: Translation for iptables raw rules that targert rtsp / Conntrack
 helper,
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello all,

I've setup nf_nat_rtsp / nf_conntrack_rtsp to handle iptv flow from my 
internet provider.
This now work ok, but to make it work correctly, I need a rule like this 
one in the firewall:

     iptables-nft -t raw -A PREROUTING -p tcp --dport 554 -j CT --helper 
rtsp

So If Issue this command, everything is working of.
The matter is that I don't know how to translate it to put in my 
firewall.nft file.

nft list ruleset give me something like:

# Warning: table ip raw is managed by iptables-nft, do not touch!
table ip raw {
         chain PREROUTING {
                 type filter hook prerouting priority raw; policy accept;
                 tcp dport 554 counter packets 0 bytes 0 xt target "CT"
         }
}

If i put something like

table ip raw {
         chain PREROUTING {
                 tcp dport 554 -j "CT"
                 tcp dport 554 counter xt target "CT";
         }
}


I've got an error on loading:

nft flush ruleset; nft -f /etc/nftables/main.nft
     /etc/nftables/main.nft:380:27-40: Error: unsupported xtables compat 
expression, use iptables-nft with this ruleset
       tcp dport 554 counter xt target "CT";

I've also try the following syntax:

table ip raw {
         chain PREROUTING {
                 type filter hook prerouting priority raw; policy accept;
                 tcp dport 554 counter ct helper rtsp;
         }

}

This is loading ok, but have no effect.
Can someone point me the good way to target the rtsp conntrack from 
nftables ?

Thanks,

        Laurent.

