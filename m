Received: from sonic313-12.consmr.mail.ne1.yahoo.com (sonic313-12.consmr.mail.ne1.yahoo.com [66.163.185.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191701A08CA
	for <netfilter@vger.kernel.org>; Wed, 20 Aug 2025 18:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.185.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755715763; cv=none; b=jD6e/Cxvep9UIrRv7dHtnc5HHJwVLUq7RC41/GZgLL8/w6xf4dtS+WUkl8TUDayOOg3/9Cg7La0IIbcQTjqnuWRGQzSIOwHw+uJ0BFb0uiVBVnoRa8k9CEDTs0YHPf8WaRblepIpeEUOyzE1xJrCgTZK5ZxZ9ubYlisV+mTzrVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755715763; c=relaxed/simple;
	bh=+SgjWCVmPFaA2HJJsVt/bRhXVbKdQu6xsJkBxZmpScc=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type:
	 References; b=aMqPy2CkDXga4j3DEYDGO8msABNOfwAEdSM0ygOzY8MqlB49LkJgMlrsfgzTEahfaEAKXZ3CebkxKYffAjlYGvahIA/I894vKFWQ5mlfmMhFG3xJHlnAc4QgT8E6CVSNmGSp0jKxX5wYOAL2xYw24A9RCrijHfj9a8HdhSLGNEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net; spf=pass smtp.mailfrom=sbcglobal.net; dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b=LSmCj2VG; arc=none smtp.client-ip=66.163.185.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b="LSmCj2VG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sbcglobal.net; s=s2048; t=1755715761; bh=1kTh8Gzufu59JrYsRHTOtl+6tEmhNUId1ADFVM+CT1c=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=LSmCj2VGCf25krHjaC+qxyr++VuWVu7t/+pQqlcaO4hkamjpbzMOrgdVIpy6xez2UNTVAQnkHDSQE/MK7SmsJlz2K6Y37Jf6/sfkkdWzaikazJuUkluzfMiT/P4OmNC5escUEISuWAINFwfFc1jh/PiwmkqafabSPDXThrns7KEPH39gQBQueNz6Q13oIC/ZfPsVidl0/TgmYAmJRnQW7gdt3FyUTRNYrEvFJDoPRamFhQm+7CaYlmHBPQrY3/8CdCoyPsueCzbfLhAzL8d27obN9IKOsamwIVRbypMFSbGEOLR173IMKtvlzTeK50QR5SYuEVKpAOltR4vQDUJw3Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1755715761; bh=du3e8UDh6dtuIKfF5tiF+lI44yDPVkeRhwwUcu3RpxP=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=aCku0v6glS+lX1iCyG8DUIlWKDoterhej0ySTRupUC53pc2gbggH9r2Kmir/oEMiOkvcJFTwa0GB4J3GxHUcq+QLSG/VgjcXuhCi33OXZwtUCXUm+m8UO9qnkv7v7a52n2ABkZmbchOKfC/55GhEQ5wMVELEqb9edLcM6tzNRtSPyAiHJDU/Hp0Z4epNwV8wvvXh/9oI916Jp4TQA4baMa9XBVaBCVZKsPX7OwOLANev6lNp+5nL4kiIt1c7EXxIPtSBWxLZcFlpbQWEGnDGczO35nB3M/Y7EZtECUwxUsTksic/FHJCONamyFRVc/yMKTNqaQdx6HK2HuRIqoZg4w==
X-YMail-OSG: NMDdbNwVM1nklXmYiQHgawM93ZGcMlMylC2bdVEfDFcJvbUY.0aN0n8eWgTJlf0
 aMbXW0yUj0VwhBDhzn9aisW6WYnJOLYpQJec2k1sIvjFbpudVSNRu6nZX.RTKgbOr88m.KBTx7_y
 JlkEzYExAU6O72XxezZ0YWpUmjkRwUcSoRYu3.PB8hKH1jzucxezeDH08CVgTT1BKoGrb7oyg4wE
 2kiQdODGU0p9DSspQSFJtnwzioCghp5JT_f2RwamY9PwgCcR5BgPB8DCK.LvcFa0UR20FA8v07po
 2b5oH3v92_6SQi1vvMnyzhkt3JC3y1dUInRbiB1l4Sfzx9M2UD5jBTrIZEOIzcZNjaeJ0sHNtgz2
 oUao6o_oROFMTDRF7EHc5xcnkfdJ92dPIownLB5.UJRklkeGHxOctdOuClO4HySlAoR1c_DWfgse
 TMnWyf1B0dM9_XpeRcZjoIV8VnrRNrH_TO21fgI8Zej3bAxZ4z3uDJd50fjD5AQxSr5iSx2bnkk4
 ZaBpavIhyJ95jcZ0rvV9x0.sgBrkE4J222mpNlScsVvtBojw7VDAxVphf39.Qr.XIXlDJMgledKB
 bu2Fb0D3B0PK7aJe4ABXiMINsUEamvRR99NvKlZxhsrOpAt_l1RvWcbd6U95gczEeXCZk7Zas7lg
 e2xSoBFF4E.wWmTe0rdN8M7qAEglXMPpO4G5HV8ZlHN8pvZiAjsqsQTc7CInLG6gkyOON400VmvK
 dqHwmmmLpjz2yhoypAYsVNqCQLMk4wDNiEYOWD_p8f2PHDiODyDZXNhYrR6BnhKcKMGlFQprudSn
 qxIRTrStbAhq8T7I1Lyp5s0S4p0qh1IyxChAS7uJrJpulRKlFvFh3OCb9aYIjoIVFvFzyLQAwU2h
 _y0trF0jmgudH_tMAd_Vl1fCw2OnLQWjDdnT5QQjItGWGu22nKMToLzv_1w1QEHX3pR5GqFqJCil
 DaXAE4GwPpaotsGbc.KQOPtEMeIxw_AB8cJtA7mjlZeQJWU..XEKp3XiytamFasJlqn5UbfaSDxk
 LIYqUm0jdQrSoLdobYjbgN7I7TnfJ9sN1nlBhrCUEHJJ_1fcPFvm963klX0XFO61oARy318RbPFw
 nX6i9nSoEpU3cEP_0lFdpGJWGOqUaZlrNMYEAC7DxWNceXfCJJX9y2nuxFKj3qEHn2aXOM9VQCQL
 ZNaN2YJW5H27lfteWlXo.VZiAtvz1C9VyaOHVM8Cdu9gEdHZ3jUaOO_BU9JbilrgpdPl5HMix3t.
 CrHWGC0Ia6wsU1YQAWyE4SOlrKuL9hxCwgSJegeM.tjOjTkobVqokxQBP13Ggw5H9jZesP9dvy9A
 Ez34Ig3tOzh.7d.UEWMJ0gnxH0u0UBNW.4lOqZwcveLYsTYRiv1bIn5we5UWhilvAdfIvi1LI.rF
 FD3JHF7W82L2TGHZ8_09uFP411bbMM7XXjuy4DjJh._p5PU.f2POX69ECweqY4DcC4O0PTvidhTU
 2Isq.vD7OtKg1uW.U1xYV2V9aW5lOCbkDXpqDA4wR0zZ4xXF9nnNwJmTOTFOI0L.F2ag.3i2Al_r
 .fj0CUYDKl_wcOAiijNCV4WzNdjmtF1IF0FJQGSl4Ylk_VM43d7dy5e7Hngg7Q0PedRWn3_4H0no
 zi.HGjZLU4_Rs9g1pOIadYCVybWnGu0TrVcvk1Pdz.iXC4_T3WyFzTHXl5B2tvkV86Plq2mNA6Z3
 CFOEe2HHNrX5JhtZLtVRZQ9vyDzYOzXvXKuN6MCBx9M3.80dZabbt59WRww1IB5sFttMlfoFNd36
 .q2BS4PZ4JYB7kp2X.p1AU1H6GmkFmFfPeDAF._008RS.b04s1jbeYogikDksJNGhkvG_bMibb_8
 2YdyLN84EnLYKYnwhJCRmRkBakp28LTHfLbyGsuP.gELsVCkvnB16TGxKLncx6vK7igJqvtoYucu
 NCkKTmbycwb64GsKFZ1TgSAS5sZRGYiEzIBMzWfJ9gLG3ViQrwVri2MB8QxnFegG2BZM8bjLwINl
 eVC2dF69elRCF.a_7u7o_GEdAEAsVnQSpqti0yxLQnXNIFPrkonZlTN1PqzRnap6j7xTCg9RpnzG
 LL6pxAzIUEeRUYiUYvhy1s9RueRDsielOc2NOw61FJVO1Ou_gTADulO3C26drI1vW_7Zhl8KWvXn
 7T1JmDBZO3IlVA.OL9dBjROhW8CJlAUo9XuRucpEeCTEFlD0T9X83qyh7IlVkqNSXrwdNlv2nYGT
 U8WIm1VXM2119WGj_SH.HOKNufPH7_mZSQ6TkuV0d2KJhlWTOxqmiD8n9NX1trraZCCxYwIPu8wL
 SfU.jO8P5Hv0CDXT8EchVJKBnWl8-
X-Sonic-MF: <s.egbert@sbcglobal.net>
X-Sonic-ID: 4c10a76f-2549-4dd5-ac26-633602c33974
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ne1.yahoo.com with HTTP; Wed, 20 Aug 2025 18:49:21 +0000
Received: by hermes--production-ne1-9495dc4d7-jrxzs (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 13cee2ef6b01357138825268c1a7c6e8;
          Wed, 20 Aug 2025 18:39:12 +0000 (UTC)
Message-ID: <1130f6aa-3c98-4960-879b-27f6ab054313@sbcglobal.net>
Date: Wed, 20 Aug 2025 13:39:11 -0500
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: S Egbert <s.egbert@sbcglobal.net>
Content-Language: en-US
To: netfilter@vger.kernel.org
Subject: Implicit add conflicts with declarative add
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <1130f6aa-3c98-4960-879b-27f6ab054313.ref@sbcglobal.net>
X-Mailer: WebService/1.1.24338 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Take the following NFT snippet:

     add table ip table_id             # imperative
     add chain ip table_id chain_id    # imperative???

     table ip table_id {
         chain chain_id {              # declarative
             type nat hook input priority 0; policy drop;
             ip daddr 192.168.1.100 dnat to 192.168.1.200;
         };
     };

Fails with:


     add-chain.tp.nft:6:9-38: Error: Chain of type "nat" is not 
supported, perhaps kernel support is missing?
             type nat hook input priority 0; policy drop;
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


BUT, remove the 'add chain' lines, and `nft -c` exit code becomes a 0 
(success).

I see what I did wrong:

1. forgot to specify the correct chain type ... 2nd time (imperative), 
or define the correct chain type during the declarative stage
2. type/hook must align between 'add chain' imperative and 'table-chain' 
declarative
3. drop the 'add chain'

but the error message mmmm could be a bit more concise.

But I am not expecting a fix there because I saw what I did wrong.  Just 
concerned for the next fellow who stumbled my way.


I have all the NAT kernel modules loaded (include nf_chain_nat/nf_nat).

Running nftables v1.1.4 (tag, a83dab190a4cc6d770aa2b57079c78fd205a2abd), 
dated August 6, 2025.
