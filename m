Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA242433C1
	for <netfilter@vger.kernel.org>; Wed, 28 Aug 2024 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724873790; cv=none; b=RIbETcSm/j++r8SGBjne7ttINbAocuhp9D73kgTNCstOlU1VFqElwgsM7xNHDcXmSk31dftzwGuEDUcKGiA4fBzfBk9+ITdubIexUeJeBP3H/rLuR50SQtiyn/Ai2+eBMWsYWmazLGtLfuxuJSlJOX5tZ/Lw6vd3fouO3UsG4Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724873790; c=relaxed/simple;
	bh=bXt4rOpVlF0iyTlsskpgNlah8EsHeUzEN1QkBrEYNCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBgss3eYU+QAtUSx76vjsQn2AlctuH45as/H6W0iWOJSc8IkS3sSJVyO2mjOYKIhgtSR8zZ7o3ikLfFzhEfFsIEbdB6vsjTp8YZTfqJ158v11oXMnC6jvjhr/wNclP0qSIVjJAevIA7cWpVxRBXo0q5GVsXEOOsm94B8dbEBdxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lethedata.com; spf=pass smtp.mailfrom=lethedata.com; dkim=pass (2048-bit key) header.d=lethedata-com.20230601.gappssmtp.com header.i=@lethedata-com.20230601.gappssmtp.com header.b=vJYooYux; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lethedata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lethedata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lethedata-com.20230601.gappssmtp.com header.i=@lethedata-com.20230601.gappssmtp.com header.b="vJYooYux"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-842fe6f6c04so2313605241.2
        for <netfilter@vger.kernel.org>; Wed, 28 Aug 2024 12:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lethedata-com.20230601.gappssmtp.com; s=20230601; t=1724873788; x=1725478588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXt4rOpVlF0iyTlsskpgNlah8EsHeUzEN1QkBrEYNCg=;
        b=vJYooYuxtZU9w5sMhWXMhsuUaqwqUw/IO8gRs0qPTYge4KZ6VJ0OBTKVro8WoA4FT4
         kSneePLcLcELn4BHnrVM3C85XvLZFKn/+rvNSIJoB62wECADv4/nil//tAOXGAtWLoXp
         HTGNngQXbYNoisvpHpoKvYTEk/YtoXTw/2JssQLG7nUZbXg1uDpr4dSKwUONQi7K64ET
         1P558dLsMl6o1o3vJFrGrU8lJpxk6AfAODj0nb9IgibCCOijMMQTfFzqepeWm+/6ebwp
         S/V1q3vOb4TvQ88J4pgyE/JZsFmitB3hwToVY9g6jwh+S3j8sqy2Lbq4tmBGP5uDfi/M
         nDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724873788; x=1725478588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXt4rOpVlF0iyTlsskpgNlah8EsHeUzEN1QkBrEYNCg=;
        b=weKf8yp4qwITjxM2u5HNbSfnyBJRFZu9bTUIafEbWzEnGPRL+0ycdpJJSgYI+LpSPG
         /RNQwGO/bj2AeORAjaDwgChFVShqmDdx5QGO+rPhBEjjjk6e4OEYlz8lPgVjBMv7t5NQ
         4937Kb26M0lagRZ+N90Bz5PxSXqHFzNGtgkpfSP3hUMtYZxurB8r3Rvi8tnG+cjeVv1v
         Rfii3L5MIz7JsFW0kYjP205n5vMWh9d9gngP16A1e+ywgYMy8pKlth2se8Sk3wQ5Fzma
         hcLjhyc+4jkRM219pvKfmdj0nvu0Fi7yoUvXXUzCJunjVDWiQ2OqyORra3mXXQyCNGuF
         teyg==
X-Gm-Message-State: AOJu0Yz02wfiv+H2Rg0IrZSlDBt7fN/O5/FFmwglcPT85FraNT5nhZbo
	MkVsDlrJ/mjWZrQKs3gGNdh4wy36DU9lwUGyjB7agmS6cIGln3bWuN0RlbPVSk/8tz8B9Rb2XAP
	pIwoam8cJxEFSz8ap59YEpHs7w5IvpIS5DVTO0A==
X-Google-Smtp-Source: AGHT+IFokLkFIoKOAP2kzlDsbbIUCc1X2k8T9Ug7aiL/mJnpuVtE5wEh0fqNh+9mDIkRH3A4IJPPxLbBYjHYjJRYNJA=
X-Received: by 2002:a05:6102:a4e:b0:498:ef8c:cb56 with SMTP id
 ada2fe7eead31-49a5b24f48cmr998521137.24.1724873787687; Wed, 28 Aug 2024
 12:36:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANsOo6on+x7OrWQN5w6Ls5RwcLHKx4Kmrp80-fPxte2LQfcuOQ@mail.gmail.com>
 <Zs8vSUOWgM5MpLxu@calendula>
In-Reply-To: <Zs8vSUOWgM5MpLxu@calendula>
From: Echo Nar <echo@lethedata.com>
Date: Wed, 28 Aug 2024 14:35:49 -0500
Message-ID: <CANsOo6ox5gwM1qXErBe9f4v=re77BorWjm6FoCqx19WaigmwQA@mail.gmail.com>
Subject: Re: Stateless NAT ICMP Payload Mismatch
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 9:08=E2=80=AFAM Pablo Neira Ayuso wrote:
>
> Would you file a bugzilla ticket to request this to make sure this
> does not get lost?

Sure. nftables nft bug 1771 created.
