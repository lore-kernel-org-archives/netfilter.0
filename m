Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F8B246332
	for <netfilter@vger.kernel.org>; Mon, 14 Jul 2025 10:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752490131; cv=none; b=h/K0tzNBrSD5QRENu9nmc95T/iFxzdbpGIx2PjWjlnTR/1JTTSszqQKjLkmwiwJjOI+DuTB7iYnhrrVElOA4d3YjmiLUOmmEjIcQJmQg9nUx3nd1ngAsaWB2VSmdmYzTo4zSa1jxtGf12YvfeMF+tbcLNorqtkqy7O5A0iXjyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752490131; c=relaxed/simple;
	bh=v3BsXDH1q9v/HXalDVA6LWxPyX2gW0oxOb7v3ulFpYk=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qIIkc+S0z119Rhpnxs5sVZKFq/+tZvKtEmpjasGErVHBZ5waaW3bEpy4MXo5imXwX3HpNIsvCvRaPD67FgS4XqHs3J7oahj3NWwoxtsNDtsP/Jpb4Wkhcf2xpvIzL2mAt97aOozjEmt4TMfaJDbRSmL7hkzx0upT2KD8ZW4IJQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b=ipmDzJH7; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (3072-bit key) header.d=posteo.net header.i=@posteo.net header.b="ipmDzJH7"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 00C52240103
	for <netfilter@vger.kernel.org>; Mon, 14 Jul 2025 12:48:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.ea087b; t=1752490120;
	bh=vXEmv81Q/mfdoJQOyG4Z9qPQu/0jeGsRxHrMy8dAESs=;
	h=Message-ID:Date:MIME-Version:To:Reply-To:From:Subject:Autocrypt:
	 Content-Type:Content-Transfer-Encoding:From;
	b=ipmDzJH7gBrdubAPGjc3sxJ6qZdlYrA2STNlJGQiIT8z9BumSydKeJE/nSDgO6HHh
	 l2V7yZ6hSdXgfCFJ9eXu5k5hMIggGB7ffASDVwzu+Z35TqZduFbW83EgcrGPENchEQ
	 HwJ/2LlHxcrDKVIXd+oyn1GCCyxjFTCYs9+Z7LokkGWaEHRRY0IT+5sllhLqbSY9zS
	 MQoMajsBFANrx7UvfUe+Kvi5ph0YgBfyPWg6TVuaqqrjbfZq3RTcb7XMrCkIHA502m
	 ddEzNAGQ/Ye/d4tDqFmDYNL3ouXqPIlFT5MtcALyhUD552Kg9Ll518NikbsRxbOfrL
	 +DxqnAEYsCwJMoDp63gUnx99EPAJlHgQLml6TW+LVtoTLNXNssx5AHjr1oXTkpCLn3
	 WuK/VRxwDXe/nnmdp8kKWZG7MRuyeKeXughprx+7btY4+mgvvOb/mSfo+bKxOkfnC1
	 HOvy9Yx+/kMvqib2ptsiUc1xIZ6sQyXJY21HwoItXTlrqp281Rw
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bgfF44xhDz9rxF
	for <netfilter@vger.kernel.org>; Mon, 14 Jul 2025 12:48:40 +0200 (CEST)
Message-ID: <4c0c089d-cc53-4375-bb01-c34a858809bf@posteo.net>
Date: Mon, 14 Jul 2025 10:48:40 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: netfilter@vger.kernel.org
Reply-To: niklasbeierl@posteo.net
Content-Language: en-US, de-DE
From: Niklas Beierl <niklasbeierl@posteo.net>
Subject: TCPOPTSTROP can be repalced with undocumented "reset tcp option opt"
Autocrypt: addr=niklasbeierl@posteo.net; keydata=
 xjMEZdJ0XxYJKwYBBAHaRw8BAQdA+fmbRutZay9mwPijVElKzUPqK+r01K0Bj4WYY/4WXzjN
 J05pa2xhcyBCZWllcmwgPG5pa2xhc2JlaWVybEBwb3N0ZW8ubmV0PsKZBBMWCgBBFiEEGlzw
 HwE4e5Gxy1uKYq0GIKkqUZIFAmXSdF8CGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQYq0GIKkqUZLMdAEA5PViSeSRCGgpL5KI+oVXmjMf/AW2/JBRDIMmvsTCIvoA
 /iNlYVz7Gq6snluKRbVp+5nswGSLGfNjBZW1HahZxnQIzjgEZdJ0XxIKKwYBBAGXVQEFAQEH
 QPQTcTxs+t+ka488mbWG/kime5lKmJc2ShC3PJGwZG1qAwEIB8J+BBgWCgAmFiEEGlzwHwE4
 e5Gxy1uKYq0GIKkqUZIFAmXSdF8CGwwFCQWjmoAACgkQYq0GIKkqUZLfhgEA+kByvNF+4TYJ
 qiED0EywQTDbdvkXy4qNUD2eOdc8dSIA/2vrrK2T0rgBd20lcdetVDXBctyAKvI7ZvHSOY0w IbAM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I found myself in the situation of needing the behavior from the legacy  
TCPOPTSTRIP target. On the netfilter wiki, this target is listed under 
"Unsupported extensions" with the very brief comment "consider native 
interface, need to extend nft_exthdr.c".

https://wiki.nftables.org/wiki-nftables/index.php/Supported_features_compared_to_xtables#TCPOPTSTRIP

The only other official resource I found regarding tcp option mangling 
is a section on the page "Mangling packet headers" which exclusively 
concerns itself with clamping TCP MSS to PMTU.

https://wiki.nftables.org/wiki-nftables/index.php/Mangling_packet_headers

I figured that it doesn't make sense that there is code that can handle 
this specific use-case but can't mangle tcp options in general. So I 
took to reading in the netfilter code a bit. I discovered that there are 
more registered keywords regarding tcp options and manipulating them, 
played around a bit and discovered that these statements have the 
foreseeable effect:

tcp option timestamp tsecr set 0
tcp option timestamp tsval set 0

Furthermore, I discovered this statement:

reset tcp option OPT

which seems to turn the selected option into NOPs. To my understanding 
this is equivalent to  "-p tcp -j TCPOPTSTRIP --strip-options OPT". Some 
superficial testing confirmed this. There also seem to be some "known" 
options: timestamp, window, sack-permitted, sack, md5sig and one can 
also target options using their numeric identifier for reset.

I think this should be mentioned in the wiki on the Mangling packet 
headers page and also with regards to replacing TCPOPTRESET. How can I 
make this happen? Can I get credentials to the wiki somehow? Should I 
instead write it up and send it to someone?

Furthermore, I would like to understand (and document) the general 
syntax for setting tcp options. I am especially curious whether tcp 
options can also be set if the field is not known to the netfilter code. 
I guess there are issues with encoding the cli-passed value 
appropriately in the header field?

Lastly I was wondering whether it is also possible to add or entirely 
remove option fields from tcp headers - as opposed to just NOPing them?

Best

Niklas
