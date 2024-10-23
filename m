Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB68E1DED61
	for <netfilter@vger.kernel.org>; Wed, 23 Oct 2024 22:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.84.196.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729721836; cv=none; b=ox/B/OX5+W8ZYOtHBO/djl7Tj7Rt/35Wq5XQj/7zC4/1wM95lXGFOStNkCY80zwbCnl74MdCvKn621YXub5JHKnCv7OJRedYvIGSXf14Owp2EvnH/oz4uzMGLmC7NfqXVKtEuqA2xXBlleNre9avsWfX2HmNMQGlx40onS2YmSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729721836; c=relaxed/simple;
	bh=3MM5UhDYZBPXbFBqatF7VHTYdo/1PpUTFBdV5aFTFVo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=jwo0dP7xGpDeysHj0WxvKIOxYuZSpemeOWbBRg4Jm3WOp/az6l46Q2c8SY6yh7oSUJBXyhR6aooEV6N5yBHaKwh1hsHZdEcYtcPTZjC77YW03ajxSh5rjz2fY/gMF4/zkpP6yrRAXW2iC5XVIFgfOip86RguBFLcKwg8caa9BFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu; spf=pass smtp.mailfrom=d.umn.edu; dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b=B5agzgRZ; arc=none smtp.client-ip=134.84.196.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d.umn.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d.umn.edu header.i=@d.umn.edu header.b="B5agzgRZ"
Received: from localhost (unknown [127.0.0.1])
	by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4XYjsl6Sm8z9wFZp
	for <netfilter@vger.kernel.org>; Wed, 23 Oct 2024 22:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wax4jCj1XtvL for <netfilter@vger.kernel.org>;
 Wed, 23 Oct 2024 17:10:35 -0500 (CDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4XYjsl3mXmz9wFZs
	for <netfilter@vger.kernel.org>; Wed, 23 Oct 2024 17:10:35 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4XYjsl3mXmz9wFZs
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4XYjsl3mXmz9wFZs
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a0a217c41so2407366b.0
        for <netfilter@vger.kernel.org>; Wed, 23 Oct 2024 15:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google; t=1729721434; x=1730326234; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3MM5UhDYZBPXbFBqatF7VHTYdo/1PpUTFBdV5aFTFVo=;
        b=B5agzgRZpiv7wjAzkqdrd1YIBW82oSKnmEvTBZNfE9pdM5SHqG1yPNK7Z+H8S2Tzle
         nlTCsVXHT6kShZaZg0GTUxp/Ay/EpmxVUiRxq7OCfHdQo/qrQyB72HRxwudDBliME89t
         tb1VI4rLkUfdPUlBGohexLa305fW3PEoc9bJ0ek7U9adva2zYPyzWwf8LFha02IOFwn+
         t2A9QxkfefshVV4FJk1212+/AsTbP32ntpmvUtoQZw/JwLFcfbxhzmcLPUqdTCf+HFp9
         xI2B/Knj+AjW6jcJs3xnCgqVlmcRhk+mONmhRBp+/s4FarGhDxN3kf3thnwNHo0hqNV0
         oubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729721434; x=1730326234;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MM5UhDYZBPXbFBqatF7VHTYdo/1PpUTFBdV5aFTFVo=;
        b=COXrj4pk+8MIArFd3U3WDPe69L5TcDjY/e3SUu6OYCPqj+Wawfcx/RDGjM9jbzOzBK
         M+G1/uz1MmAsR+EE7375FX6/9U1PtgfYghDvzWBip0NG4pwl0H+OzJFc8vSdiJ9N0pjd
         Bk/6d6Zt5hK35CSDJDy41NWBbsFgpxREB7mM0Fdj8w8NWO/Uom0O2k4vSD0FXYoW9g+/
         iqm0ZZkyklddhZrhW8PPkT5Cnk2YHJTJ0TEIc/Sd93eoleqRZk2AXtpX86Ql4qumQYfJ
         13B8OUINJmojMY5mgjKGnlfEuo2xgAA/2WN3yNzOZyutKWkk6Q7wsB5aalpjkmWEVmg2
         gQiA==
X-Gm-Message-State: AOJu0YydlFz0jcGoJeIQHux4VgoljieU04bCWY2Bb50TA+5AeIsKAGk7
	jtpvv3NKKdfMy5uqVGefmoi8NQ9vt4zr1Y4q93mt0aGNa31iph54mxDTTApahBS7TH3wZ2Nvv+G
	Cs3n4epz5gdD7c6AIAs2bDQnZyXekIekh9n/OqkFOaTLEXTJjsyGhD8j6Ivv3UWEkZu0O4b0nm1
	gjdgfqfLCwKtz2hVdbTPuWxuW0NBuw2YNSw3O6t+wxi+K9/GLQ
X-Received: by 2002:a17:907:7f0e:b0:a9a:6700:1ee5 with SMTP id a640c23a62f3a-a9abf86a190mr154430466b.5.1729721433984;
        Wed, 23 Oct 2024 15:10:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjHd5qMn/btvGk0LzAb1uEV1WYs/e31mc5DRWEa/iqEl3XVT4JRK7A4lHc+t+d5koGypKVsWmvUweTZyrfckY=
X-Received: by 2002:a17:907:7f0e:b0:a9a:6700:1ee5 with SMTP id
 a640c23a62f3a-a9abf86a190mr154429866b.5.1729721433566; Wed, 23 Oct 2024
 15:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Date: Wed, 23 Oct 2024 17:10:22 -0500
Message-ID: <CAOLfK3UqOC6Mm+R+N9cQRPg_LvQzRfsRb-nRNRjFc4HR6vmV-A@mail.gmail.com>
Subject: location of conntrack rules
To: netfilter <netfilter@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Greetings,

I have, what could be, a simple question.

Do folks put their connection tracking rules near the top (earlier
rule) of their ruleset, or near the bottom (later rule)?

I used to believe that it "made sense" to have the conntrack rules
earlier in the rule set, because the packets would be
related/established and wouldn't need to hit the other rules
unnecessarily.

However, the conntrack requires more kernel memory to track the
packets. Therefore if every connection is tracked, then that would
drive up the memory required for having the conntrack track every
connection/packet - thus possibly exhausting the memory and not
allowing other packets through.

So, now I am wondering if the conntrack rules should (always?) go at
the end of my ruleset.

Or do folks put the conntrack rules at the top/middle/bottom of the
ruleset on a case-by-case basis?

Thanks for any dialogue regarding this, perhaps obvious, topic.

Cheers,

-m
