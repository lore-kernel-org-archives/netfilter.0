Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50CA605A9
	for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706688898; cv=none; b=aKy1+yYL1It4pZH5wTCe//83IMfmGkvuj/1FBDxuXhOY5wnJT7Vla/e6SLReY++9MzbCyC6mQG0A8nDAKpa291bBIRflY33JljaMq+TbfnQ0f8d0Y1TRww9DekZmUn00NLq+duyfdu+5qWCiH+i95LvLhPbgiSUZz7w3jzyDOYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706688898; c=relaxed/simple;
	bh=WmHj9oWmVUg5sQAPB6tjL7U87ulzyCRcnqANIhi6oP8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=tYQcsHWo5e7amCcoyIfCQnGeRUa1yshCHCjFuSrqO+xTD51waSiofh1+acOaM1VDjBQ4SbScl5oZrl1w5earQVB5KF5KGSZYC0/EnLNohXM5z9WEKfnhgutHO/96OisFmOzVhHlDqn/HOuupbby505Lj4YErlNadUXo1RI3b+pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY3weeGA; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY3weeGA"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-602c714bdbeso5341687b3.1
        for <netfilter@vger.kernel.org>; Wed, 31 Jan 2024 00:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706688896; x=1707293696; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WmHj9oWmVUg5sQAPB6tjL7U87ulzyCRcnqANIhi6oP8=;
        b=BY3weeGA5l+fvq4QIgYOIdQnCsMVuygyUJD5r9jMAAJeFIcXEOWIbYyfyNeY+oLS4q
         UFtROat8CrYjR1UEdlkPuvRIG8P32UR1M39ICeH2HLSReE0fQEBfia6p61/eDFgX1okU
         whqQnz/1sbTBNMgHWhkuODIv/4Eu+5mqqE5m8xsmdr4eC0WtMZBwyioF+6EKmWdHe6XY
         HDCNh5c3zWbDCinrUxeF7SXRdJ+79sXmUBZ/CpeSem++Eh8Uh/v/ilDzvYpWKe8kjN5D
         Xwx/tOZrLWsj/n8XMuNstBcXgD0lfjmtR4dMdC1qcGfALXpjOPGTD7StrVvIA9cC7z8g
         yAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706688896; x=1707293696;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WmHj9oWmVUg5sQAPB6tjL7U87ulzyCRcnqANIhi6oP8=;
        b=m1UFJDCmPASElsIRxxUAJF8RvQ+qMAbZOB6K9sT/5T5QzGIxQSPsjn2tXrgmcJyJWv
         eT6Gs/qRjeAULC6J76PFklFWxfRMy4GjY9WruoG3yHEVh/oljdPgXEIky1DPte5lVUBl
         HmH+N19iqPaMRTLxH5gOQPw5GLAg19M9O8QETQj48dBF8gCUryr0yIHMIl77z8Vu1JeM
         HnuFrYQweeCU+x8psli/ypD6A2yitTYEaR7pUVINCInXIP26FXofeQIINr0oNmeeeCfz
         akQA6uB7f6WD5zUnJ53Qkb6KRNv2ln5+uDPpx+lT9muleFX+za47Mam1U2Sn1t0RdVba
         i7Eg==
X-Gm-Message-State: AOJu0YyLuir7BWvS0TwUjV/UGvCD59QNlxSgwNEwePYV13IOCQYaUc9f
	jaktDaDNBmHrmGlU9dK8Ucvw0yUs9QF+DcHECSL8wG9+fRlisfUGyRlZTUgMTzS/H8aEj7kN4Xx
	T3BJwRcPckKi5DWsDH+Y/kSaUjib3A9h9lWQ=
X-Google-Smtp-Source: AGHT+IEkn9w4D7g6e+zug7c39k8OzNiQSSt5cDllZlOUGcXKRUjwFoxYqtx6amSDX+h4jv5auJsnGB4kPEdGfOp0Rpw=
X-Received: by 2002:a0d:d64e:0:b0:5ed:b2a2:1279 with SMTP id
 y75-20020a0dd64e000000b005edb2a21279mr424119ywd.16.1706688895719; Wed, 31 Jan
 2024 00:14:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Anton <anton.khazan@gmail.com>
Date: Wed, 31 Jan 2024 10:14:41 +0200
Message-ID: <CAJE3=wmAh5Ne9fWdrHOyZx9uuz+_g4+PhVXnfr+pS417mVWfhA@mail.gmail.com>
Subject: Is there an efficient way to delete multiple elements from a set?
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello, I've been experimenting with nftables sets for the purpose of
geoip blocking. Let's say I'd like to add ip blocks for multiple
countries to a blacklist or to a whitelist. Perhaps the most efficient
way to do that would be by combining all required ip blocks in one set
(for each family). However since country ip blocks are a moving
target, I would need to regularly refresh parts of that set. My idea
was to delete all ip addresses corresponding to an ip block from the
set and then add the updated ip block. The problem is, this is very
slow. While adding an ip block takes (in my VM) 0.09s, deleting all
ip's from that same block takes 14.5s.

This is how I'm doing the deletion and the time measurement:
printf '%s\n' "delete element inet test testset { $(cat test.set) };"
| /usr/bin/time -f %es nft -f -

(the test.set file stores a comma-separated list of subnets)

Is there a more efficient way to do this? I could of course flush the
set and rebuild it every time I need to update some part of it, but I
thought I'd ask before deciding to implement that.
