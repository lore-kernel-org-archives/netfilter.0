Received: from mail-vs2-f9.google.com (mail-vs2-f9.google.com [74.125.227.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B29D1B87C0
	for <netfilter@vger.kernel.org>; Fri, 16 Oct 2026 20:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181948; cv=pass; b=VHKZkmWEh/zBekBQ5aDOmFOVaaL6kgEJgB4hKUjyMfSs8dbn5/ojWcRc7D8N/mJnwWgZ4vrQYRVa9ES4wiclXVdAgEvQOCdOcqA/zkRIUn8R1cB7HEixKhLnvMP9mF3nsl3roazQ93P2oKG+h/7qDXNcSA8kr25dGi7a097KHZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181948; c=relaxed/simple;
	bh=T0BmXhifj6SthDCvAkT+2Sy0+vcIHgLH4vPCC6z9OZ8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Yywhk6EfCE2pXxDjhtwU8VVKHtDGMe3YYVhNHJnLgfLsitqePiEyoJrm7zqUSDoSHnSHA5lqOhmiwFBVxTRWa/JFoVmkj+W5qFmWg9yaCVDyPkJoM7fONZpMx3ncxM8c3Cq/MD5FGM6VgVxyjPHPl+lX/HSIEZolFqtC5zVJbb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TT9QVPeH; arc=pass smtp.client-ip=74.125.227.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TT9QVPeH"
Received: by mail-vs2-f9.google.com with SMTP id ada2fe7eead31-7cc0b23d67cso275946137.0
        for <netfilter@vger.kernel.org>; Fri, 16 Oct 2026 13:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792181942; cv=none;
        d=google.com; s=arc-20260327;
        b=ZxtNcMowlk5zvZpxJ6ck2BrJoRAgKa81DeMEJewcrVdXneA71Tw405t9VFQOra717p
         hSs8d+1PBqTq1fGXox0Zf+yfzkPrBMYAMXUk0zOvCA5U6f43xjRPoCCIuaQzmJTTOq/e
         d1PA8POOIKF7haJzIHlN6Km6D3NA4v5WXwjVB3tuMsuHzqvV0W5y3JFABsBgOcqlSdKY
         LuQrU+mQ5blAekhOFpvBrQEtZAXcHBwEzwSoc9erUPxCFShfddlvI8yYrp/WQGVsL7dT
         YzF7VBpNyJQ73Y7ctO+QkEXgnKuOtQxgx8KSQwaRCe37dntj7tL32zV2D9Sag3Y3cyoS
         wKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=T0BmXhifj6SthDCvAkT+2Sy0+vcIHgLH4vPCC6z9OZ8=;
        fh=geUeWHCx2uWsMvmpsADhdQW4khNH6dN0NqOGko2wfwc=;
        b=BeYHIgfHIuxd0owbK1CmorNFIOS/A+mV3fyw1EWPCq/0uSO7VAhsJeXu4jfEVoXFSM
         bVl4YPZGuQy5lMW8QsVOYbrFYNHXXjTtAvqwNKdTCQIKs0PKMPdCb7pqNQ55T2jMBtIg
         1vU/FxLqP1kjItOY1Qga9PfG5UxLk9inLK3lw2EI20gy6Ogh+SyzphiTqLtkTj6C8Yv0
         NOMNK0teitHT3XwtB6JaGXq4Z2ByyEygxvDJ0lbF/gErF1xTZqiLBLuo3M46VlY5ZZZL
         6Yfbm4OxtMwqOt34qVSPjdpsws2e933G65z/MwjGKUe+0A6XF4EHyaLzyq5dynsmHOsk
         Ya2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792181942; x=1792786742; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T0BmXhifj6SthDCvAkT+2Sy0+vcIHgLH4vPCC6z9OZ8=;
        b=TT9QVPeHDFKBHd9d8PiEwSd8G1YJB1Dfd8Bv+aaJ9T+mF3QiPBQR/o50CL9aIL1pEC
         TxMiLs7PWB4X5FRuoOi012GFOeytF5s7wKwl6owW54GakzdwX9QJITkxdE3U3yn3W46n
         VwWxQJJBkT6qcNyNXbZDgSDq6fAYhmtz4BrBbvJBp9fK6YznAMq5Cmexh/kmuy37hj4x
         mZzKlV/nMpTMfDvNzghMg8+cGwP5l6K8DakMkdb/7KE2AJNObBcn/IWF9HrHvp2ezp7m
         Oq68npK4+MrMo4FFNMEhD+AflxRQ/1V6Q2ZjM693kPbY74Ns3vXjag5hi+9zbQsKhkGz
         UARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792181942; x=1792786742;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0BmXhifj6SthDCvAkT+2Sy0+vcIHgLH4vPCC6z9OZ8=;
        b=WJzZfaUFvrtxAJKKg6oDFoWS6ou3pnbiigDMTLCZ/lXSI9/idOPSWxh70ULpeHcTrH
         XyjsmQN2StPQlnG6l8e0FTHn+NC7pKOXsHoI4EBGmH7QNZTbyuVlld2nR4m8Qe4AFE/0
         0HQTl2j3CMPMBHiDyGi4O3c6H2ZUtnOiZCta307QfW7s7E/kG1bXlL5FcWKm6ZUqCuMl
         8yken9Oe+PdqIcN0rrpaV2+38kQWT1y794jYAgAMTObvjgC5j7QNRarF8+wL/TL/RfaZ
         OOfO6kb3OtHojBU8BUu9OJklzzUJmBhQngKlf1si68F7uc2va8TbJrGvdKvrumTQDVXp
         qfXQ==
X-Gm-Message-State: AFq9FYLPReUxEYBMo0DHIKnTaeCfY9ZxCSLRR8yPN4xJX6xLgawou2an
	zF2JCFkNV9gyPGoNjINscbyY+aKqW+AKIQ3COJ+/q7fXTESzB/rjgMD1BZd4s38F+cSla2RPmmK
	Zu9lxnIoVuuXeD5vCGL8gP+GwpGE5/ZC+qEgV5SF2D8I5ccuS9w==
X-Gm-Gg: AYBFou0ywWKROzEtoF3ahPHszVTJ8+YNLGs+75ByrtfeobCIcceedyBM4LAoC1E+QJC
	KKTV1nRKF+MbNEcc2/xGfO5c+boJVX3ktvbDH6jcXO3aydBOjPyZ5VFsOz6+cSr4uUsRtUyTmPe
	DwErIgps3C6QfUnO36utyGNjyORbyW5UXobaPSIxAQHK+GMbQSp+vDTA/0kndoJmyu+FczapVvx
	upRKUv6S0ZrmvUQjSGUadRPghn22/1A/3iKKQA1PaMfguLST3vIrOVJup2xsklwUaAWHpwTKhDj
	XDibuXL3KxU0Gk9j1q4JEL9V9bBj1Gij68pdqSwR
X-Received: by 2002:a05:6102:162b:b0:7cc:9a7:7b83 with SMTP id
 ada2fe7eead31-7cc369663fcmr260762137.15.1792181942022; Fri, 16 Oct 2026
 13:19:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Richard Van Tassel <richard.van.tassel.work@gmail.com>
Date: Fri, 16 Oct 2026 16:18:49 -0400
X-Gm-Features: AclHuK9PXNl3LHsvVobxvUHLiT6XltvoQqkcjMyu-524VZ1qmBL1_CtvvWjs7e0
Message-ID: <CAGLc8_RABvE42M_1icBskniznt5-e2QLNd7g3Fku3bcw+2aE2Q@mail.gmail.com>
Subject: userns packet mangling
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello, netfilter world.

I am very curious about the status of re-enabling packet mangling in
user namespaces.

I understand that it takes time to find and address security concerns,
and I hope the netfilter community takes all the time they need. That
being said, I just wanted to echo the appetite for that functionality
to return, similar to
582d218b638be68342dd80893c41746b35c1be76.camel@student.kit.edu (sorry
if I'm linking this incorrectly, I haven't used this sort of mailing
list before)

I am currently working around the disabling in a somewhat controlled
fashion using a custom kernel patch and module to allow a process in
init ns with CAP_NET_ADMIN to grant permission to mangle on a per-ns
basis. As I understand the situation currently, I don't think there's
much appetite for accepting this workaround as a kernel contribution,
since the disabling is meant to be temporary. But I feel like I should
mention it nevertheless.
