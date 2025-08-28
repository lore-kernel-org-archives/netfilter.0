Received: from core.iputils.de (core.iputils.de [194.154.34.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8163B26FA6F
	for <netfilter@vger.kernel.org>; Thu, 28 Aug 2025 18:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.154.34.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756405264; cv=none; b=iIMzTuxwGe6K4xRjrI6LhLJTsmZv9XdTutI0NGoU7PTD9F9xYpgKagfUlj6ojjcT5eb/7WNkdistBlGWW3mDpN5IPXHidCW5LjUtDoWobhTx3G+X425Fi3Vzo++EjN8+VTcNMp4hVwj6C4VVCKv6J40V+RyPys5I3UFXvyGom7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756405264; c=relaxed/simple;
	bh=iwXDzImoiE3FFgyNSu/felnOQlUtb9kfHmlyVbNvegs=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=dludkClQmGeToN5UfjNdX4eGwKLSwgogZtAsF4V/GzGyDghmJ33WXDuw/eLmVbW/OXaGgb5ChLrKL6/JyZML7F7dc5uQr7bPqJ4ZgWbdk6pz5D+cQ7OYRxZ5MsHnjpGZZebwM5AB9iMVbzivClIS3XLFSf/r2PUEgDFF8zbR3yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iputils.de; spf=pass smtp.mailfrom=iputils.de; dkim=pass (4096-bit key) header.d=iputils.de header.i=@iputils.de header.b=WAJQPleR; arc=none smtp.client-ip=194.154.34.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iputils.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iputils.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=iputils.de header.i=@iputils.de header.b="WAJQPleR"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3F3ABC5707
	for <netfilter@vger.kernel.org>; Thu, 28 Aug 2025 21:20:55 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iputils.de; s=dkim;
	t=1756405256; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language;
	bh=08ddHOL+xKJOArH0C7ZoFG/GcvVhKKNKNaJw9r58ygY=;
	b=WAJQPleRPO/tZhWeDGPcE4PBp2eLnMJ0ruUHb4PB5Vsec08MAXIlI+5wYCVcFR2v+YMhV2
	Kr4ebWR+w+e27i/duWFcDMaH3Qeg+PG/BaP303YRvrBTf+pe5hjqUtgqpVTfqS3BuAca+W
	bmv28udVQkK7uYvzwfoNyezaTDfKUshGg7buaAbJ9V47103fvfbYl1kNeYP+afUpK5Mmey
	QRBugksf+HLgD2nlKisxjqFPRAoO1Uck/x9zLR2GybW08bLoUW5TQvRhMd117IoZOtwOgS
	bQnIkw6sFt67pTmz+BHiEbA3fl9moSDHrKNUS1QstjW8z2SLzj6h6WDfJFc5aGddbSLJKQ
	V64iC+q5hkmlwK8KGn9JqvpDA09IJOyCsiyYXbb4Em8wBmr/VGbjanFmReO6c/ogzaVXdE
	WrHSNeCixLWLybTh5CW9AWmrieGXeUzg8qoVML+ngrKvwuMRzdG8eJaX+Hp4jpX/70MJJa
	SwN46+boxrPX7wdjztqsgObKtMPFRGqD1vuspqlGIZpuxYuDamyMzoujxZyUebJIDMyhHy
	7JERXXhyYLfXXza5ueihDeTheeiqrDnTFiFH3KkZ8ldWHTPeK69jFMtHDylXBYBRcPQQOZ
	EKG6PcSQ7hqdtG9NwoYkQ5XsMYMltdZx4QswwW42exjLpfHsdWHMg=
Message-ID: <7c8d4b91-b304-49a1-9f69-20f40aa3094e@iputils.de>
Date: Thu, 28 Aug 2025 21:20:51 +0300
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: netfilter@vger.kernel.org
From: Panagiotis Plessas <plessas@iputils.de>
Subject: [NATHELPER] Dealing CGN Public 1:1 mode from ISP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Folks,
I got a new FTTH connection from a relatively new ISP and I am having 
trouble rewriting headers with nathelper.
I am not sure if this is the right mailing list to post this to, but 
here it goes.

My ISP offers static IPv4 behind cgnat, where I am assigned a DHCP lease 
in the 100.64.0.0/10 range, and they do their own NAT which just ends up 
being a 1-1 port map of the external ports to my internal IP.

I know that if I SNAT to the public IP my packets get rewritten 
correctly but my ISP firewall drops the packet, I know I have a static 
ipv4 and incoming connections work and are on the right ports and the 
same with outgoing connections. I also do know that they do not rewrite 
the packets for me and I wouldnt trust them to do that.

I do not know which would be a good way to make it Rewrite the header to 
my public IP, but keep the interface IP as source IP.
I am not sure if anyone else uses this configuration for public IPs 
except my ISP,  not sure how useful it would be to add the capability if 
its not already included.

I would love some guidance on how to rewrite the contact headers in the 
packets while maintaining the Source Address the same


