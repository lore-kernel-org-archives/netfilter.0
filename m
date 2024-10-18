Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89CA3817
	for <netfilter@vger.kernel.org>; Fri, 18 Oct 2024 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729279827; cv=none; b=npgGZqUZdgamXbtsHreCiemXqoRvUF9Y6VO1s6gvlgqtCBnLUj4jlkn1gvjE7VNPibqPKcOFYJhtjghLEJkL9KnmPLwacqJOOOkGY0cPo31ec/kmyBLEJEb3HEP3jsLDuYU4Y0CFW1H6LdyCW3sZS7W+e8hp5h+i+A5pAWzwURk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729279827; c=relaxed/simple;
	bh=8Oq5QM0WFwpGEGWQASXP/Vp7xmyI1Srab6C84CIemlc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=m4Uw/te2bVwbLSpdOz1UmFO3c2CGuPAVTTksqWL6TU+3C/5kvGqFYfv+Bjx6yyhZ0X6K5ilTJp89obio0WLkEOzSkC0utiOZ2gUmgnQEMPYTGRoYAPqynxDPTpPl9nNwrOo5nnwv5f2apXRZu5h+bgIR4Oj0U3GjS84s1jXTTN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHRYtldl; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHRYtldl"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so30533871fa.1
        for <netfilter@vger.kernel.org>; Fri, 18 Oct 2024 12:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729279823; x=1729884623; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=InnP00ABUmtTkBXVHAsR+KizRqYqnbIR1fayAEAdndw=;
        b=PHRYtldlrbzc0RGb9+04FT+5MFcP9bHIifsXApXgNp2c4y4jDnmxyNtrI/BIPxwWxY
         kUs4Qz3Q1spFQ44p0Y9HLQjI4AlFgvsJjV7uCK7ESK00+qu1zzYo4F+pd6+4/syd9WzM
         VdsiuGTM7ol0HsbqGpfE5ATDq6D1Q9UyaKY6Xowb1/BSJoic6GTixf6XnoHVpWRhOEpO
         gD6mkmFP/PdAD60zKxJ42IWD00NT561httELP2XNN9+ZTpnMMv4G8pi02IMO76hIIUey
         8tJZ4Am2B42MibplLxNp4I08xXh4/nORxbQyRqXT/2GnDPF0kyxXRc3YVpTFYbmhK7GN
         rc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729279823; x=1729884623;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=InnP00ABUmtTkBXVHAsR+KizRqYqnbIR1fayAEAdndw=;
        b=qHYAFX5ymL/OS4cHEkqTBhqd7pSWZTzFtf+9q2VgIp0fqS8migmE/rUfT9mzCFQ8AU
         c2AmyFZ93mDPsJJzDtKDOMIDhz+ZitX5Hqb0uV7X5v5HC/KR86BtJtdPAQ0kS1m6anpd
         B46yc6fmwI6xwQCDp3eGiaYPnlB504k8ed97XVVrNNiTBfMIzv0li7XLqyHDpVAQMSJe
         zHOnJP/moI8B1gICIgGCHbJUSSJO2XbyHxv5jxe+7yS1aFZXU/L4vvejuHYLm7CJZa4A
         Z1v8fihkNJXtNfOjhW1iWqCNJTXq7cGaTvsOy9xSLA7b2vh69jjhAA+IVjKiojqi/58k
         YIOg==
X-Gm-Message-State: AOJu0YxJTzv7OuAQTsCSn5WFrCj1Muxy2nwI86TUgE5ri0/teylLt5+F
	wJWEWUAz0YenQYGHND7ISRdDIu5SlBlS0QZcdrWOuWL05ju4ioygSqBHA2eq5wwG9LuH6sbJfyq
	N5NrReowVZ9akcHN8SnmgtL3MLCMBlKJ1
X-Google-Smtp-Source: AGHT+IFM8c2o0Pd7En9HVzRYuOV4NP8WJibbih4Cj35TbbDhgZEjCRTHHj6ibboYx2eywZHF1GbJltSSEuQ9Daf9K9I=
X-Received: by 2002:a05:6512:12d3:b0:539:efdb:4324 with SMTP id
 2adb3069b0e04-53a15218eccmr2607649e87.21.1729279823363; Fri, 18 Oct 2024
 12:30:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Telbat Diordna <diordnatelbat2@gmail.com>
Date: Fri, 18 Oct 2024 21:30:12 +0200
Message-ID: <CA+OqyoGkVcvgVYPBMc6v-JeRwncoJz1OyECma2-megULkvQ0xw@mail.gmail.com>
Subject: filesystem access to add/remove/view ip addresses
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In iptables there exists the recent module (-m recent). This gives you
the possibility to add and remove ip addresses in rulesets (usually
blocklists).  The advantage of this method is, that you can allow
access via FACLs to ordinary users for selected configuration items.
E.g.:
echo +/- <ip> > /proc/net/xt_recent/<iptname>

Looks like, that in nftables there is no recent module. How can I use
nftables in a similar way?

Thanks for any information/link etc.

t.d.
