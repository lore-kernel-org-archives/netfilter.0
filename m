Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239123;
	b=XoA4qsGRYo3rQ6VU29qx9hlFL7RfZ26HqDG0p6vrY6SKlXOnWQsnoUZZT4lNLFBG56Y4
	 2NJ1xfa3TcjFa+TWbPNV436hHv/tlwUY6eV1RKHRhxi2oyh8UQ3hpmVx94uM8EqfDd1XY
	 M7fTbE3FCS2KJN+QI93jFThUajNSQo30DpGNScgAlSSAdwIhDOAUHxFOl7Vden/qD24+p
	 VY0G3SGdYX6WGmezANdC9m4N80L1hWR/jB830el79gQNJvldqG+dQiLSRJf6ty99ZZ3Y9
	 nJe1+IBJI/RSmSVrqIUBOj6kvRshZZ4mmMGMDHgb/2VkyI7OMnLu+ka+zSIRckYdNgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=sQNcIG9SHLZG4RG4EZdlS1byMxh7ePzOd4M1bpCrrDM=;
	b=ahv/3K3f7XCQAL2T95pa5+mEEBXJ6KmRZX0af64Za1lzqU4m7/jBLayp61wXsxiXqg5h
	 s4uD6WCDEeYC2GmO4S9d8TMvovFkD18GE1BWCDF5e2YZLHXfzB2BOzSS90Ij+HGE3zwlY
	 oHI27C89mq5DskWxWHBdqSXHPew6bAj++95NX2deNzWRtz074u5Y3WgCyOS+0il9X7CN+
	 glCFsBPi17TCrm3WJHNRgtWc45AXCMOpf2vNI30oD/SXvwWrYzpoMkO8cpedciUKC3AG3
	 CWOnaq9imu7de7JTTBKtwJtFpM5Vgrd0JCO/JdV/xU12t9EuHIXVocDO7Aju6QMyEaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sObdQo5v;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BCD6082BEC
	for <netfilter@vger.kernel.org>; Mon,  9 Nov 2026 15:45:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3BCD6082BEC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sObdQo5v
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso149615066b.3
        for <netfilter@vger.kernel.org>; Mon, 09 Nov 2026 07:45:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239121; cv=none;
        d=google.com; s=arc-20260327;
        b=AsSUgd9kWGlhogzYMuD2hBMMm51ne5I0UMhRJE0LhLf34VbNL+cX2koBZ98+D5eds3
         gHJBOcy3hitCB1FnmrKRumU4EoKHFh7fJnNcrtN2LPTZlPtPIyO2w6gg9cHs0J3wEFuT
         dJWBTIkVhdCM33E5Vd7bi8E9bNyl7PmU1lOaF2xDlmooq4YzUT2f7AVTKAJuZVC5B+ub
         SO/ffzKBIeuezL8ndSpeWXtH06lJfed8TLmqpHI9Qd5hs06+mLNUpvYjEYxD17H4Nn6E
         3HiGIPFMWXlgePO5vUlWOF8wvbfOqyExF+VyuYpn/RUoU6lzVHu8DG5+hkFSEfvtRMph
         OEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sQNcIG9SHLZG4RG4EZdlS1byMxh7ePzOd4M1bpCrrDM=;
        fh=Z4d4/AUN76mK238x9qSkgzqWd/Ow+0yx8b46HJI7st8=;
        b=OD6sRCV/dH06J3tqAF9cc2sapTwPUsOsNUOliNo+WMuN9z//QDA4aIH/SIqiuE2AyD
         3dPrmD6KHA+nExIU9XSoTKCosrSNIRpjtJx0q0fTaFrvmOb+KyUUtzaDvxEqDKRaow8H
         3DiV376Ui5fOYl5Q51bw+W+ZSEWf/Kt6vqExnZ85UxHHDHvo/Qv+ejceX9vyymSbc+xy
         7mZ7QJ2HDHIyG9nr+Ld50uICI6fTITYT7XdZsHVqb5iGEBwOGIzYvm47m7T1vEdN3TLm
         0S/RdpRq06GE8Aul/rh9Xq9KyYpI9vg+TmXKCCFxaSPudmBSZr9Fr675oPIpLwbcWcyI
         4JgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239121; x=1794843921; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sQNcIG9SHLZG4RG4EZdlS1byMxh7ePzOd4M1bpCrrDM=;
        b=sObdQo5vSGQ8b09aO1ybQhH07dRuvIrsYz6tkjmy2p2uB43BUc9GynGOv93oOBLuQ5
         ceoA8ZPnh4+5P6S8qLWakn2fc6S+NjMNwQVmC7UW3HBMDAjUQksDA4PC9ILPoEcWEwQ+
         ZlYnPM8QZtP/LH+Ihup5rO5amGslNvtb/o4i2ItMp/mqIBlZtawRdpghW+BLUX/wsi8C
         lmfqjoGyswdmu3dhrz7c8dpVX8qkvb6WbUzBlUtF0Ir/CtERDvsu7kWTaO22i6hhDnZr
         nUaVS4RkYhfrQocVOpZuFQB5xSDpHvgZi/Kqcq6tev8hqN1OBusQEIvkAwxfWppJQmWO
         IIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239121; x=1794843921;
        h=content-type:cc:to:subject:message-id:date:from:reply-to
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sQNcIG9SHLZG4RG4EZdlS1byMxh7ePzOd4M1bpCrrDM=;
        b=2emQutKwIZxOyZJNv3y6b8BOrs7BgpQzQUDpWHz78BFihIIr4ohoBy4rtg52wXrZP/
         kmNOHCznrYRzOE5hv0mamjVZUHoeFnlx2nadPa0Hb03/W2zKBAyaisB3wTQFzaMF+T+7
         /7HT3XiGw5Id3Vq7mIswwJK4oShVM2RfDtH3KQUAutl/oX4ZhI5XRR817efX5wQp3ocz
         R1oR3Re1z8bJr8nVOhioBooRzi7BjYPvI5oPe3ieckakIp+YPdGmfi5WuNCWhoFKboNF
         xPcbVdSDLmXBbdc/A1hyUjJXUZrm/8L6eSmfJtPyAph+zijg7dks3/T9uRBOaltdjnEI
         zoxw==
X-Gm-Message-State: APuU4Z+vh+ZocojL8Vqe0EQxoqj11xtuo+cViW8Ebna0lvLO/C5q/jRM
	ZFbkAKWzi4t0aku+vV3FWZSaIRxMsCIho6ntWnKyBoSVIoQhF5NoSIc013U+hJZMwybM49+cJPV
	jt3mgdNs0gfsUKZD1a64JSzyZzC5s1E8=
X-Gm-Gg: AYBFou04UGpiYkmimZVu9eWEfXU38guKkoJ+cpcVYLki8G+0HJE0x/oQiWeN0W3mtVe
	0w+exg6HtQpMVjlxAPGl/CUNu59l9LIVmzX/l50c7DGioqVoRyFsq0kKyoB61OQwtMGwSz3T8AY
	rbVpL/LT1dUM/6Deej9NeoFQiijHnGgvDJH9bpnyFPwO1/5GLF+RpyIwfJ2NttooqHrk/hJ+a5A
	W2zrBEz8TM4g6CihxNt21bntwdzEeUWZirpYbw4dhd0sdIbhsY9tHM7co33szv+5qFi/OtaYUr9
	QspshSIJcA0VrWgkCjiLoI2JafWG2ImCnl8EnNhd3MxH+483uXwpzjp7iMR1VDQIj2VcAzZiris
	xHbjmC0uGNdnPAxT3MLprO7V4hpUf5MB52dNtGfU=
X-Received: by 2002:a17:907:944b:b0:c24:4128:c19f with SMTP id
 a640c23a62f3a-c4d6d35be3fmr309643466b.11.1794239121086; Mon, 09 Nov 2026
 07:45:21 -0800 (PST)
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:netfilter@vger.kernel.org>
List-Help: <mailto:netfilter+help@vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netfilter+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAPH4NY1-MSa07O_hgrEXqyPwcTQDPeO2Cf2uN2GjGQFgaQ+kHQ@mail.gmail.com>
 <au1gtHLku32CeSVC@strlen.de> <CAPH4NY1NhxqqEbf8Ky+AaA561a0x6fDB3cS27FbVizx9ybm21w@mail.gmail.com>
 <avHWYRPcjP0ITv8b@strlen.de>
In-Reply-To: <avHWYRPcjP0ITv8b@strlen.de>
Reply-To: allfoxwy@gmail.com
From: allfox wy <allfoxwy@gmail.com>
Date: Mon, 9 Nov 2026 23:45:09 +0800
X-Gm-Features: AclHuK_astcwMY5bo2x1vLvm_PEDQXnK9-KSxrS1p639cMJd4bWrW27q8OCClMI
Message-ID: <CAPH4NY2McTHB7GTugjOMnO0-b4GqponsebLDOjuWG7OCCjC9nQ@mail.gmail.com>
Subject: Re: [regression] Completely editing packet should be allowed.
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>
Content-Type: text/plain; charset="UTF-8"

Florian Westphal wrote:
> The NAT dispatch uses the l4proto value from the tuple to decide
> what to do.
>
> So as far as I can see NAT postrouting will write updated tcp/udp
> port to the packet, which is no longer udp/tcp - corrupting
> the l4 header.

Excuse me for that I should be more clear about this part.
The scheme is working by IP-in-IP encapsulation. The layer 4 protocol
is another IP and it does not have a port number. TCP/UDP is in layer
5 in this scheme.
I would encipher the entire layer 4 contents and edited layer 3
header's L4-protocol number. The recent change in kernel refuses this
L4-protocol number change.

The design:
Incoming packets => got deciphered in PREROUTING of RAW => CONNTRACK
see real contents => all the normal
Outgoing packets => CONNTRACK see real contents => enciphered in
POSTROUTING of MANGLE => MASQUERADE based on earlier CONNTRACK
information

The problem:
I can no longer change L4-protocol number in layer 3 IP header during
encipher/decipher process because of Kernel commit 112e447



Florian Westphal wrote:
> We would need to make a re-lookup (possibly creating a new conntrack
> entry) that reflects the new/updated L4protocol + any other changes to
> saddr/daddr.

I rethinked about it, this won't work unfortunately.
Because NAT need to match outgoing starter and later incoming reply.
If we re-lookup / creating a different entity for the outgoing
starter, NAT would fail because it would think later incoming reply is
not RELATED nor ESTABLISHED, hence drop/mislead the reply.

I'm not sure how netfilter do SNAT for IPIP, in the past it was
working fine to rewrite saddr/daddr of the outer envelop header ( the
layer 3 ).
Inner header/contents ( the layer 4 ) would be masked by cipher. But
as CONNTRACK happens earlier than the cipher, it already has real
information to do SNAT, even later those real information would be
hidden when departure.



Pablo Neira Ayuso wrote:
> I think your software should be doing this packet mangling from the
> prerouting hook *before* the conntrack hook, so you have a chance to
> create a conntrack object that really represents the flows after your
> mangling.

I did a test of replacing the use of POSTROUTING chain of MANGLE table
by OUTPUT chain of RAW table, so that outgoing packets would be
enciphered first, then enter CONNTRACK.
The new kernel system doesn't work. The phenomenon is that I could see
packet-counter increasing in both PREROUTING chain and OUTPUT chain of
RAW table, which indicates both encipher and decipher is working and
remote system is replying. However the new kernel system still can not
see the ICMP ping reply, it would say 100% packet loss.

I _guess_ that:
- Outgoing pings are enciphered first, CONNTRACK could only see a
valid L3-header ( with the L4-protocol number edited ) and a black box
follows it, it would have created state based on these masked
information.
- Incoming replies are deciphered first, CONNTRACK would see their
real contents and create states based on that real information.

CONNTRACK would have a difficult time to match the real state with the
masked state to tell they are belong to the same ICMP conversation. (
Well, that's the whole point of a cipher )
By using POSTROUTING chain of MANGLE table, the outgoing encipher
process happens after CONNTRACK seeing real contents and creating its
status based on real information. But this is now blocked by the
recent L4-protocol number validation change. ( Kernel commit 112e447 )




Back to the very beginning when I wrote the cipher software, I wished
to do the encipher _after_ SNAT / CONNTRACK. But this design can't be
done because MASQUERADE is a final destination and there is no more
POSTROUTING chain in RAW table.
