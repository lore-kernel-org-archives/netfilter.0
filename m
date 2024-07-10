Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD5423A0
	for <netfilter@vger.kernel.org>; Wed, 10 Jul 2024 00:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720572592; cv=none; b=XXXPmRy5cBfTTxlkC6XMU/2yAAGwqws4F+P78G/2wCgzHq0+3NNi9vt7c3slZL8vFMGn9xCwS1IEXPma+XnpelRLu0dSHXI+cjm3oTxfgz04Fgg6X9K6WE8umRYnqkdkA9DpJ4eZJ5RMVN4AMOXd/6boXs1JH/vttta15Q+j6tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720572592; c=relaxed/simple;
	bh=BV9vAHBD/oHbj5BodcbChO3S6ey1xg0w9UhN9MCkQrE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=r4AivSd9QtoQUuHtqXELMBCCm9cQSOXR+A+8X4VmxOPJb35rGgL7HAxuR3uFQXH6/ueGfBqPLKizrv+vcI/Sa0HF1NUBG0TcRDRfRCbp7/94JXcrb46dNmJK+Cfufb+erVJqG1zDUUkSlk1EnWLYE5ZOAtNr0ju7FEBWUTXYAE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTgVRjqN; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTgVRjqN"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6519528f44fso56248387b3.1
        for <netfilter@vger.kernel.org>; Tue, 09 Jul 2024 17:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720572590; x=1721177390; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BV9vAHBD/oHbj5BodcbChO3S6ey1xg0w9UhN9MCkQrE=;
        b=MTgVRjqNuz6fhy4ITA9FWTW3/3Mz0B/yNCX/7ppjYS8smnhShVvNteFiyJGZoDjrQz
         IU2H1fK4EwGzhGyxrz90n5MyvNLE385Iz/iLTTq3pQPCX6gh4ySazFW1T2eiVuYdaPlq
         SxafQ25x84lpN6u1lDsoTXEfpli+aLVGDbMJZPoLoPqMTSZcC2GCtmdAnG80IytRZ8nj
         VoNIsr0RGgJsFPyAuWu+j2DyeX0MOM+0T05rXDIjZR99q3NkrdR92mEoQogCsjHFp6R8
         Jjj1hUQv/CBTha2NwFyYxWYIe42QJPo2JMVTp3BZxzaqIPtWcgIy0/3fxKeiVEt7rXYm
         YfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720572590; x=1721177390;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BV9vAHBD/oHbj5BodcbChO3S6ey1xg0w9UhN9MCkQrE=;
        b=c5ry41lujqrFoIvQDd7BbY1NSoP7geEjALxFlMHXIIK69UBlVWWRUk4o2tUrcPp7rJ
         VYQzpPWz/RXj8S9Dr5uYpvDj3Xukv+PKa5LkGVkkqwql+0hTS3jfVhv1MPM6LPEbCG8Y
         MXiEHnMk50DcJ07tJew0tKsQtAcpcLq+Jd+3qDvoHEjUvvOj0dJK1edLBU0i48BNOTLx
         8Bl2kER/8nPuLWe62reElsbJHtxWkzrzIU49TUY48DjmanQ76b31ulhcGIcefpqDY7a1
         bh/5Ztos8CxisCi4t5w6wJ8NY/SzSrcdckMnh7/LWOxg9ftBYdSpxamhf3mpzqnspO2L
         ZaSQ==
X-Gm-Message-State: AOJu0YycTKJCyosf3lFjfQcrYtznDHGP6aJvb5j474gleMRWUC2BwSFs
	6D0TEEqogNpoOqE6JpIE/YtZv3xBRvrbk7JafH3PUCtmgVSsdcbLnv4tpKZ+o3KsHRGST3stsDO
	fBeu4mdzmAUDt2u/Jux86Gfq0W0J7F49b
X-Google-Smtp-Source: AGHT+IGyPNP57N6I3kV986V2MsUjXMgSF5V8LjYrKNIoceTYD1PZ0vqWWzY1zNNrSyvabbY81F2m1x3vzHFkx25wOTM=
X-Received: by 2002:a81:8301:0:b0:651:79ee:d142 with SMTP id
 00721157ae682-658f02f55f9mr44080117b3.36.1720572590240; Tue, 09 Jul 2024
 17:49:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kevin Johnson <kevinamiel100@gmail.com>
Date: Wed, 10 Jul 2024 01:49:38 +0100
Message-ID: <CAFiPqxWHmNKNc3o_HFcZ+OVJZhFSdka8BJeyuLvhf19y9MnUkA@mail.gmail.com>
Subject: Understanding and debugging conntrack source code
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I've been trying to understand the connection tracking (conntrack)
source code (specifically nf_conntrack_proto_tcp.c and
nf_conntrack_proto_udp.c) by sending packets between virtual machines
and observing the connection states, looking to possibly find
vulnerabilities or perhaps weaknesses.

Are there additional documentation somewhere that aid with the
understanding of the conntrack source code (specifically
nf_conntrack_proto_tcp.c and nf_conntrack_proto_udp.c), since it's a
bit complex and difficult to understand?

Is there a way a debugger can be setup where when pings are sent from
one machine to another, I can see which conntrack functions are being
executed or which lines are being processed?

Regards,

Kevin

<http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
Virus-free.www.avg.com
<http://www.avg.com/email-signature?utm_medium=email&utm_source=link&utm_campaign=sig-email&utm_content=webmail>
<#DAB4FAD8-2DD7-40BB-A1B8-4E2AA1F9FDF2>
