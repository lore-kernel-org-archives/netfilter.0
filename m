Received: from sonic318-26.consmr.mail.bf2.yahoo.com (sonic318-26.consmr.mail.bf2.yahoo.com [74.6.135.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A9D1E502
	for <netfilter@vger.kernel.org>; Fri, 19 Apr 2024 17:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.135.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713546492; cv=none; b=VwiiUKmWQS9VYltVvE73vjIFgrIKTbAjTvf3Ajroxgn9dY3Fx/Tp0ulmii57IrLAiavAMgO7R0CKDw1EtR5mo6ZeRbkF4pFy59WBDEPncZa9JdeOEJ2UqadNfdyTyf7yhx4/jGJCfNjC7o4X5KAzcusztzCkbqry4rrB6plk8DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713546492; c=relaxed/simple;
	bh=da+iTA8NBw+/8703icEXq4q6pEP8/1mxYiqNaB3XWcE=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type:
	 References; b=gk7o5jO34hIl0ZJkfuGM4C0s23QizWxwGB5+mb9JAypmfhqWrA1z/GurJNwm+xLn89flvLtCklQ8XMJqr8OTJ/vNU5vNPatn2zUAa6Tb87LR4WW8NH+IdDwXkBTlHFHrqQY6hY1mimY/B0Fsi3vv+EPpSNUCSj0ujrBzZFdWPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=Ki1TBa/L; arc=none smtp.client-ip=74.6.135.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="Ki1TBa/L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713546490; bh=da+iTA8NBw+/8703icEXq4q6pEP8/1mxYiqNaB3XWcE=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=Ki1TBa/L/pwErg3piNXv9+CQhyAKUatA9lLc2pEgR7j0L6HKQIdfhko9vW3kg8XlvjY0lsneEmMiWgibaInCS3Y1Zk6PwEmmn42YPPo5wvhkrgX6WRP5kOiRrl/rX9afiKHCG1rKGhqxOC2Ne7gR9K3cOCmR8DQz6R8kMxJvrXKhcnyYxXZlV9mdZ5SCtwVaIcygGli+C1S+onHkzKqNkyWdMdRfJbeT9oAF3r8oiYhmXD5E+uHrjae89tKr19gG9W1k2t0luKujZpnme5rUCX8TuzdBtXIP2nMt5x7G7dYnLZHrwoDnC1xUxZ/qlK+7GC0xIegNh0PFz4sBOZVWlQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1713546490; bh=eVD2bJ2A+x0qOIvZxE4o1D4mlqimG2WKQiwO1sjo4BI=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=q3AiEg6F9/wqgvwMHo9VFUYcBRPZK2t1SgT7/bsmqRQtD/i87+PhGp9rCJJNlvIO4V39IukjcuM3If2DZEXZiLsodzsW0NcguTvsJbaXF//5bpOQolNUWFmAqjJafCkorxvW42DOJawyllJknMw2aO7AEia/lQeCBY8f1bjs135o7tfOTm2UzG0+t/SVTJZqNNTgHXboVvI8d0VoV+xdD8uBsaQMNPpQfGtlvprssEyPq5Uq1VOmabHAta3tpcRo7wWcGopz9X2lisa1jlB/UMvL1F6b9+8MV3MUS+J3ZAcKksnLh90vbjw9ypuhKasNzeziu3ab6iNLCBpAtud4fw==
X-YMail-OSG: Mu260c4VM1kSWFfTOEz09QpwG0NdymKnDzwiAKHl3DUBSdQ.6SMW2PWsnpCoqvC
 P7TXBV08YyqGYxj.8uTYgN_lNZoMDgclEOya0ZU5KdJbpR5toFlnKyQlLVdhzpQ8mMpvCrZWvSLy
 4ycuzEiicYgSng12QTHtnKRbbXCi7l4Yn6qdBzvqnDQGbtD638_SfDbKlIQ4yBPAxx0n_B_iiDqT
 KIRLnf.zjqbereVjr5SCJAXhw7c.relL078kJfE9L4uibetZxrHjJW5f7xW6yEUQDdhr5yjOPeE9
 RDKy1VBn.fJsVPZjRuTLFqCRAykGqgLFCbQyTzuXReCM3CG7R.3QV7WZhkCFP6NY6Pdw1rzD7m6G
 RTsaTNKu0TnAH7e2OS2AyRZGFrX0KMfzIOUuhbdy_lwbTBhfegz4NTEfTx__Q_qtohnwz3xPu26Z
 GnNmxuYYx20CnBfOa7Ns.wPIx4itny8CWRvy9oD_5p9rbBV0lqaHoVnfHyzSH3cxsOOCPXyVhvSi
 I2kTMBq1gDpuO4FZbRycUxpRQF.ZghimCEj_I.nNYE1tYNx.6NEM9QGQZ3pINX7y8bAecBY24lO_
 UR4Xt08sRcDxn7mg9PF7ZtMVc5jjeMFEJZaRAQMK2.lhSugZxvdchnETaD9n5PcWa.O83mo1xePa
 pWKBbNl6VcNhVWvA4DSrTvPS_FrBIGsXuAn6KYDHZKb4QS4LDx8CtRUhoyTkDHnvfAGI64DQJvqx
 oLm1.19PACAO9C_JJrXq.duJAKXOVy8VeBNkhKTIJb6zUTk9qHuRHtZx7_PATL1hKYCXVRQu1MXR
 cWmZ4F8qIaN.C_Fx965B5_d0fDOzDef6VBzpJ8XUDF3uACJ1w5SAlzI6duJhkMBY5uk1PAif7qnu
 727BfIkavKRAVbdDISMWi0Z6V1wASLzJQvwKy1z8Z6YjNwjC7yEVopxQMXA13VbAxNmv68_Tqp6.
 ZT9.7GprkqLJH_A0CJG2OA87CPB_8h4kBNrOzuk5jsjDuyazJoUMGPEk.L41xnvkixVM2vFFJRXl
 AgADV14hW9EwYM39V366jaOu24HqjaZaooSvYB9kt2RU2ZpXzYHbKCNX0GYYHwg3tkL1t.fUBar0
 tY9mXYMVHLuy7uZrV.jKp0Y6eez3yCn444nMTAYnoT0Y3MkWqMaH_f.97.2PJTVPpYuDdxnZDYSl
 FhAzjq9nLLrRh6j7LqkanFQnJ1C0l48zsbPkuXmw_9aw.sjumqGRnT_DlHcNa5d.p_YDb_8YbGdA
 tRGYXtYfAVXd2SkTNqeHlTrQsz2VE4QJ3TulyRy.1AFbL9dvaXbBcw1ZgCEvhcsvQLyEL2kkzh4s
 O4RFTKdrnP9wFq80gbWVcit_n8kQR03GVNHZ8KSRFt16l2CIdEWKVyD6H8D_wTzuRQg2WZLEYaDq
 9Z4hMHwbBbpyVYG2QlKlp3LjlvZGxxQ_aDrNalfHy3PsH57Z02L8x6GNi7QcAs7XdEy_J95AGAm0
 AMgwVZsbYkHEN8eC0vMu3Mxb.dic4nrexAakgZeO0hxDW1ixnFAckCqgLoGBEwxj3wdUh_LOu5XL
 AXyDk6cAcre33DRmJe3.RwwHCaI6arilcVWiliB76zeS958msFANodckl72lKwo_bPRcwxU4FpKp
 dbPxE7ybfkFTpnPWjEkoNvvoYQ2B9m4rS6j64BFWr0ZNTkvFREqgu_iO4c2zQcr_FCYWxqwMDNNE
 um_cb2OryPpQ66fwDwNBAwt.iXYA_8KDekmg0O6msEn5DvOhNEnNurUiOCfGKPJblaH6KZ7T_vY.
 coYbBhejS0Kj6ybYA0xUYP0wV66rHCIsBt0j8S_u.cqyxX4MsDer9KWaD4I8zUgCwmi_UQrcfSgl
 N_e.ckLZ716EpuGvvBAj.YDSH7kz9eF8EuL2Ynr_m_J_tfg_YtM3Viv0so8rjbJODBzbPBnybvE.
 mys70Hvsyt5Lg_o3j84kMnZMRqQRiklRr_89.hMBH4tfWcazdphx7S_sJbT3keW1to_JzKyBhbdJ
 JDtAwhm_aCnQc3mvFw2amZ.vhVrEqVot0KPTL7yh9osbwLNe5j3.xSSKdG4_wj3g.u394MGlDzzz
 Gsd_fUFCEj7s2aW26ajPOiozlGOYJDzpgl.j5JzJBNc4MzkAqBREhClGlQm56B2Bb7D8EF9nNLR9
 T97ewwZ4zn51BnuSjewTSMksnm0bNvL.Y4MWLaGVw8SME8CA45YKVKhBlbsiIDrZ2s59BNyonZuG
 LegOuubzlwKXOzmaDFVn9CQOgFg--
X-Sonic-MF: <uothrawn@yahoo.com>
X-Sonic-ID: ade3a7c3-ef7e-425a-bf1b-ab2d1c506a44
Received: from sonic.gate.mail.ne1.yahoo.com by sonic318.consmr.mail.bf2.yahoo.com with HTTP; Fri, 19 Apr 2024 17:08:10 +0000
Date: Fri, 19 Apr 2024 16:47:46 +0000 (UTC)
From: G H <uothrawn@yahoo.com>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Message-ID: <48471547.724608.1713545266678@mail.yahoo.com>
Subject: Rewrite arp response with nft
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <48471547.724608.1713545266678.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.22256 YMailNorrin

 On early versions of Linux, I could use ebtables to rewrite the ARP packet=
 using the below command. This ensures that the switch would only see MAC a=
ddress 00:50:56:96:12:5e, not aa:18:f0:55:79:1e.

ebtables -t nat -I POSTROUTING --logical-out br0 --src aa:18:f0:55:79:1e \
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -j snat --to-src 00:50:56:96:12:5e --snat-ar=
p --snat-target ACCEPT
=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0
I can get close to recreating this with nftables, but it is missing the fun=
ctionality provided by the --snat-arp argument.

table bridge filter {
=C2=A0=C2=A0=C2=A0 chain POSTROUTING {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type filter hook postrouting pri=
ority 0; policy accept;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ether saddr aa:18:f0:55:79:1e et=
her saddr set 00:50:56:96:12:5e
=C2=A0=C2=A0=C2=A0 }
}

My outgoing ARP packet has its source MAC address rewritten successfully, b=
ut the "is-at" still points to the original MAC address. How do I alter the=
 outbound ARP response to set "is-at" to point to 00:50:56:96:12:5e?

$ tcpdump -enni any arp or icmp
12:39:08.525439 vb-p0 P=C2=A0=C2=A0 ifindex 5 aa:18:f0:55:79:1e ethertype A=
RP (0x0806), length 48: Reply 10.60.0.67 is-at aa:18:f0:55:79:1e, length 28
12:39:08.525441 ens192 Out ifindex 2 00:50:56:96:12:5e ethertype ARP (0x080=
6), length 48: Reply 10.60.0.67 is-at aa:18:f0:55:79:1e, length 28




