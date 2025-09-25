Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342862C032C
	for <netfilter@vger.kernel.org>; Thu, 25 Sep 2025 16:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758819127; cv=none; b=CSHS1QnR2M1TAgBd+zdN56N49dVpFamQp2oXZeHnQS8mCuTV0vrWPAUJmxANc9pSpkuv+JbFg+WkG+PPtwYPFefLaqBJRQFeK+Nt6uMq+YHZhtx18jrxkKav8fFEYEXwCt/mmlD6tOP/7TR10PJKV6yjO1s1IGhh6a7sdHe3esc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758819127; c=relaxed/simple;
	bh=zj+nwgAcAXSk0H/FeN9Nm0jDKmHyEKFlv/3tcKDuMlc=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=k5SJBg8+l2/BC5S9JmLveKrS8CedpbHBjxgxVtH/pZVtOmjMgfJvvCCboG1EwQ7TytJ5OOEfvTCPeHahbLuLYWAgDR3F5XXQsymVQI5nDi+z21Zza3yu9guGNfWobaGislXZWlpBxRAVUM5laYUfZ96GeWMbPxFRAP6iqEtK1BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LndxcJLG; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LndxcJLG"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-3197f534179so1017862fac.2
        for <netfilter@vger.kernel.org>; Thu, 25 Sep 2025 09:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758819125; x=1759423925; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62GIzEVDKgt6Npmb9fjrCcBhX07LGCezzpuo+CAyjcA=;
        b=LndxcJLGpbEHAY/YJVTGV65s1GoLqOT62GKD/md9WD/GoDxDA1rPp01czYb1hcIP45
         MqM7k6a0hr1emi5aSE+s3okBoe5ACtb4nH5NuvQvNg4WZs0hSL/UEEfmPZPU+nPj/MtQ
         VmKrCD8YNUQ/Ppy/5RzNW0AI7S9NIx0uGfc7VAca8U5yux4tFOrcgs03j90KpuPYRMSb
         bf/9aEwUXJvWDpDmk3TUaGYMS7V1biGAqDPG3iYa7v6wGLC6+puUXtqbaoRg5rgn2I5+
         VWPw9in1Dden5D50h90Dm9DiZfdqZQdlpiHNctr86/Dcerj+7KR/O81UDDi7YpD83UlA
         303w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758819125; x=1759423925;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62GIzEVDKgt6Npmb9fjrCcBhX07LGCezzpuo+CAyjcA=;
        b=JwoD2Fv2MJDzzb7pMPwUldGURCqsw4qQYPyc8h2740GnaEzFrFJADdpT6BUbJTiXwp
         Tn0AoeIAWzej2P2HZj7wPr2aendsU+aKub1VW9jeI42IzV9HRZMi6a1+Po3jy6C00EAM
         0DGbAYqMfHuFCyCkhepbIlRUQKDem6Hn0xu+yfAZBHmISfYDaMD8RpZf12krfBCmRbgP
         tz+yc7Kf3d1iyktuAtW1Y8Qvx+bGvzHYxrAUi/Jk1oc7e0Ht5uQ81mBLzUB7sIuLb0Wn
         BOCOXUkVkrcHaP2rlzbWGY3QguvK4OpYdCaOE0fPMPcvcoZR62g+SjYB+Ng8F06QW/IE
         eppg==
X-Gm-Message-State: AOJu0YwhQVWZR/Kkow1JQkWhtQ36tR63/W04U9Qn2tN6hAj9B0vZupQu
	FIgHkcbdCxuWK6WfcixA/GV4sFQSDPin6y8JkFz3tE4jqd/mniAvkDXE5V1C0Q==
X-Gm-Gg: ASbGncsxz9wXguYexrPyzXJEh3TBdXtu1DTifsIZjxf/GlRLbv5rBx1pmaHuSTJKG2Q
	jDX+B3mDQiREfEvoDbWy59TmVfiRm8Onh2knn8dfPLoncMO/tOqxsdNGn6e4nLEN/kpujpWZ/Vg
	12bp1Vx+yFa178RtWcQKq8wTp7GRSG4IPlmzPiFjvt/2fzy+g7F24+7vLDEueLIYrKKGGnGpggP
	X34mxmqrFq53qEP32lLQ3E7XA9uidhb+66zp7j6titiEmdI8QmvPsuIOx1qvb3FcludGc1SlQ2E
	dEq1v7t3F70iL2A+YYolrKSj2iVxGWXFPO5qS+FFderNjC8p8tmCsdAIf11Yw8d3taVTiGMljno
	1PbVYOj8cSburmf4RYFL7uUvu/1YOzfzD0b7AkZRHu5nayd6YJaRO9I7WtfnvJuuHbF/JcJFuVi
	pFYN4=
X-Google-Smtp-Source: AGHT+IGRMugs8x1VIgkBowv2dTnOaxzELOpUuGtx+2Vm6KOlaNzyS5MpNvMUmYEaP2zotN0/x/jrgQ==
X-Received: by 2002:a05:6870:85c9:b0:344:5201:15a4 with SMTP id 586e51a60fabf-35ec0c332famr2116096fac.16.1758819125046;
        Thu, 25 Sep 2025 09:52:05 -0700 (PDT)
Received: from [172.31.250.1] (47-162-145-207.bng01.plan.tx.frontiernet.net. [47.162.145.207])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-363b055c292sm684541fac.17.2025.09.25.09.52.04
        for <netfilter@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 09:52:04 -0700 (PDT)
Message-ID: <9d95db74-ba98-4712-be2a-b90cfc0239bc@gmail.com>
Date: Thu, 25 Sep 2025 11:52:04 -0500
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Ian Pilcher <arequipeno@gmail.com>
Subject: redirect/dnat to localhost address in prerouting chain?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I have a multi-homed host that (among a lot of other things) routes
traffic between the different subnets in my home network.  On that host
I have a couple of *redirect* rules in a prerouting chain:

table ip nat {

   chain prerouting {
     type nat hook prerouting priority dstnat + 20
     policy accept

     # HTTPS connections to old switches are redirected to stunnel
     ip daddr { ... } tcp dport 443 redirect to :8084

     # HTTP connections to the management network are redirected to an
     # Apache virtual host that will send a redirect to the HTTPS version
     ip daddr .../24 tcp dport 80 redirect to :8089
   }
}

In order to make this work, I currently have both stunnel and Apache
listening on the IPv4 wildcard address, which I don't like.  There's no
reason that stunnel or Apache (on that port) should ever receive traffic
directly from another host.

Unfortunately, I haven't been able to make things work when stunnel or
Apache is configured to only listen on 127.0.0.1.  The redirect rules
shown above result in a "connection refused" error.  I've also tried
changing the rules from redirects to dnats, e.g.:

   redirect to :8084 → dnat to 127.0.0.1:8084

This causes connection attempts to time out.

Is there any way to make this work?

TIA!

-- 
========================================================================
If your user interface is intuitive in retrospect ... it isn't intuitive
========================================================================

