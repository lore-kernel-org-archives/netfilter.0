Received: from wmail.tana.it (wmail.tana.it [94.198.96.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71D81A317D
	for <netfilter@vger.kernel.org>; Sat, 27 Dec 2025 12:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.198.96.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837726; cv=none; b=sRWbqH+F51YIoMGiYYPDveMfnEsF9TCF52zArfgwj3Bqe0f7EfJP++CKvpkejtmSrDlBPMNFva4UV9oiKuJOn8fE3W/SPi/bPRnXtq9t7v7mvLDip2OIpwF4hArcEnFwTdmHWE6ustxUBIutCuOqHVTjrxplk9mfiKVunuiipqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837726; c=relaxed/simple;
	bh=AIrmnXOfbnDU9Y+oeQEnwT9iEj7GJncaN8cd6oIpVps=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=oThtz6BQNugbAa9kKsYA9LO7P7mgtbR30GA3GlUfL3hRkpsrH0WBppoi2b62IxY0ApmmW3+ethjmUMkIhHitQQI75+On6gMWAOBmSAfUCiLu9XNFWwQbMNU9IcA5j5IVgxDUcZkcL2W4OR3dM6MctGXEnCNNzOZ9Pa37EGcuDkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it; spf=pass smtp.mailfrom=tana.it; dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b=CVNN6ruw; arc=none smtp.client-ip=94.198.96.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tana.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tana.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1152-bit key) header.d=tana.it header.i=@tana.it header.b="CVNN6ruw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
	t=1766837412; bh=AVeqEgwuqIGWQlzdyXB9EosXODgcdXJ78uKyxzLOy/4=;
	h=Date:To:From:Subject;
	b=CVNN6ruwlOfsZMnCO8pFkym+WUmiaX8HYodzsqfSZkqAS+PmZ1Qg/gv84x4qf+br6
	 ovNJJjDrAVcro5Vy0eXnKyIMGCb/W+9sBQUS5r+kIWiF0oizGag1lgprZ6hgM/ghzR
	 p81CWn1wwUiozyoB20x4ycRdzafMwRBr8zyU4RlwzjaKylsQ3oJKZ2vMLs19a
Original-Subject: Netlink buffers
Author: Alessandro Vesely <vesely@tana.it>
Received: from [172.25.197.83] (pcale.tana [::ffff:172.25.197.83])
  (AUTH: CRAM-MD5 uXDGrn@SYT0/k, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
  by wmail.tana.it with ESMTPSA
  id 00000000005DC028.00000000694FCCA4.00002505; Sat, 27 Dec 2025 13:10:12 +0100
Message-ID: <370b3b8c-0ab3-426d-9770-6a4b418d9cd8@tana.it>
Date: Sat, 27 Dec 2025 13:10:14 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: netfilter@vger.kernel.org
Content-Language: en-US, it-IT
Authentication-Results: tana.it; auth=pass (details omitted)
From: Alessandro Vesely <vesely@tana.it>
Subject: Netlink buffers
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I have two problems on this subject.

One is with ulogd2.  I'm using the Debian stable version.  It has parameters netlink_socket_buffer_size and netlink_socket_buffer_maxsize.  On ENOBUFS, it does so:

     if (nlsockbufmaxsize_ce(upi->config_kset).u.value) {
         int s = cpi->nlbufsiz * 2;
         if (setnlbufsiz(upi, s)) {
             ulogd_log(ULOGD_NOTICE,
                   "We are losing events, "
                   "increasing buffer size "
                   "to %d\n", cpi->nlbufsiz);

The log it produces is like the following:

Dec 25 04:44:46 29 north ulogd[21274]: We are losing events, increasing buffer size to 425984
Dec 25 04:45:25 29 north ulogd[21274]: We are losing events, increasing buffer size to 425984
Dec 25 04:46:08 29 north ulogd[21274]: We are losing events, increasing buffer size to 425984
Dec 25 04:46:49 29 north ulogd[21274]: We are losing events, increasing buffer size to 425984
Dec 25 04:47:28 29 north ulogd[21274]: We are losing events, increasing buffer size to 425984
Dec 25 04:48:11 29 north ulogd[21274]: We are losing events, increasing buffer size to 425984
...

The setnlbufsiz() function is supposed to alter the buffer size by executing this:

     cpi->nlbufsiz = nfnl_rcvbufsiz(nfct_nfnlh(cpi->cth), size);

This function should set the new size of the socket buffer and return it.  Obviously, the size is never doubled.

Is there a newer version of ulogd2?

The second problem is similar.  A custom filter using libmnl reports ENOBUF about once every two days, during the cron.daily process.  I haven't figured out what's causing it yet.  However, I don't know how to increase the socket buffer if necessary.  The previous version (which didn't use libmnl) called setsockopt() with SO_RCVBUF, but mnl_socket_setsockopt() doesn't appear to have such an option.


Any hint?


Best
Ale
-- 









