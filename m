Received: from mail.integraal.info (integraal.connected.by.freedominter.net [194.145.195.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A135222A7E2
	for <netfilter@vger.kernel.org>; Wed, 21 May 2025 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.145.195.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844115; cv=none; b=pyy3pae+n4jBL1WXZ76ubnpCl8/0doUfzD+f2kc+C30u6+XXRx/tUluSDMs8g9HW8tltU15Usd2tcJB4K49f1WMC5RM/5i9dzzeX+crluJ/tL475KIqzYKCOS5cvB+MKuGEsBjDojEoiusTYrs7yXlQchB9kiggIvjWCOWImIEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844115; c=relaxed/simple;
	bh=Quqp5IymPGh4LbPtZQG5wKRaXvpzPQTRjYR6Szde6Ac=;
	h=MIME-Version:Date:From:To:Subject:Message-ID:Content-Type; b=Fl8CAoTnCSW2GxvceYKZIHHwSVohzGU8X6CzgebcQlOWMDv5gHoa0pSAZ629IUyiVndV9hekhx/rvjWlXUY1bqXYtmO6Se+m5nF3//oDggfTSb5X9oUbfDbuJ0apo0WeUof2YEbOOTi364sXeSuuffHG5j1wMLsDJ3NIRTf51QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wielders.net; spf=pass smtp.mailfrom=wielders.net; dkim=pass (2048-bit key) header.d=wielders.net header.i=@wielders.net header.b=lWO82l7v; arc=none smtp.client-ip=194.145.195.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wielders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wielders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wielders.net header.i=@wielders.net header.b="lWO82l7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wielders.net;
	s=postfix; t=1747844106;
	bh=Quqp5IymPGh4LbPtZQG5wKRaXvpzPQTRjYR6Szde6Ac=;
	h=Date:From:To:Subject:Reply-To:From;
	b=lWO82l7vSoVQ2FeuxaZZBoF1wPwm8LBS+7tmWGOz3R2PrGWzFy+/CEx5hTCYU5aGE
	 heoZ9pvH25c1ggH7lOJgbP/ENqIo8efxx3rMbCqFED7tjHAZv281whowKIoPOZMMMe
	 UMCqWGvlKhqzRT/NCOm5523yD6ZqsUOJwsCd139EfflTNk/t1nnoN7QqYwvdzQoWTy
	 LjT48ckX5CHqNjYofK2toOMo0vBkw34QNdD1b1mto0T7YR+XVjwMqzC3sdPFtRHot0
	 Q+lMz+eDNR/6jSyH2B9rloR00gQTFqw3bf5UdNH+vdSBTm207yTE1ROaN+3LnRsJHU
	 qvqemVhhD6SzQ==
Received: from email.wielders.net (einstein.integraal.info [192.168.11.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.integraal.info (Postfix) with ESMTPSA id 952B312006E
	for <netfilter@vger.kernel.org>; Wed, 21 May 2025 16:15:06 +0000 (UTC)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 21 May 2025 18:15:06 +0200
From: Pierre Wielders <pierre@wielders.net>
To: netfilter@vger.kernel.org
Subject: documentation/explaination on the syntax of the set_elem data
 arrangement.
Reply-To: pierre@wielders.net
Mail-Reply-To: pierre@wielders.net
Message-ID: <a4465ba85a6faea0e960c7e0b37586af@wielders.net>
X-Sender: pierre@wielders.net
Organization: Integraal Automatisering
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Dear reader,


I am currently trying to wrap the libmnl into a C++ wrapper that allows 
to get (starting with that) and set rules. So far I was able (using 
reverse engineering ;-) figure out most of the stuff.

I am a bit stuck now on the set_elem in the set. Is there somewhere 
documentation that describes the syntax here?

What I get from the sets:

Table:  [lxc]
Set:    { "name":"__set1",
           "handle":4,
           "flags":3,
           "key": {
             "type":   ["service"],
             "length": 2
           },
           "userdata":{
             "length":6,
             "data": "00:04:02:00:00:00"
           },
           "elements": [
             { "key": {"type":"value","data":"06:00:01:00:00:35:00:00"} 
},
             { "key": {"type":"value","data":"06:00:01:00:00:43:00:00"} }
           ]
         }

I know that the elements in the set represent are the port number 53 
(0x35) and 67 (0x43) :

"match":{
     "op":"==",
     "left":{
         "payload":{
             "protocol":"udp",
             "field":"dport"
         }
     },
     "right":{
         "set":[ 53, 67 ]
     }
}

What is the other information "06:00:01:00" and "00:00". Is there a 
document describing how to interpret the data or can someone explain or 
is reverse engineering the only option (got a bit hard on this part :-)

BR Pierre
