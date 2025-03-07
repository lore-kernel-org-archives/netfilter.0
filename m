Received: from sonic308-12.consmr.mail.ne1.yahoo.com (sonic308-12.consmr.mail.ne1.yahoo.com [66.163.187.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941E8194C9E
	for <netfilter@vger.kernel.org>; Fri,  7 Mar 2025 18:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.187.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741372372; cv=none; b=QxwAG6+nqi7oG4bK8ZUwOvgv+7VYEtUAUfoTzX5c4DiNgEATH4zsCRVHsnLiAoqSREuE1BM8RnQxPtkoovgb8BWhDwKIHGORrshICCofX6NGln9u5dDI8yj4bHyHF9HNWC/O4LJW83/21VlDvQjkzxCJtQTJ6KcHl0jxYLY6Fcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741372372; c=relaxed/simple;
	bh=i62r2XUHH91OAp66uX6wxyJKWQrZFBWaZpBZmkIdt78=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=hMaNlOntgAHgSn7uTIZiTfWODvUBEMgY0G4pQFIgzwqONLhwYuqnPkDKQqF46l8/lpw6UJisDj3Bb0Lineo/Wtv6dYnAS3Kf5Hflz6LaMssol0ll8g/YX92U4j3G++89tBzxvUS1Wo1zJOvgsQ22VSY81Pzox9GlPuwCfKDxL48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sbcglobal.net; spf=none smtp.mailfrom=sbcglobal.net; dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b=sd7eeaoU; arc=none smtp.client-ip=66.163.187.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b="sd7eeaoU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sbcglobal.net; s=s2048; t=1741372369; bh=UJNgO1nOm5/fpjkvQT9YmzbhxOCj0X+hRDhpmCCLw7c=; h=Date:Subject:From:To:References:In-Reply-To:From:Subject:Reply-To; b=sd7eeaoULbo4SrKnojmVd5sukavbZDE/P6LE3cTeXWR/qLT4gFmBf94zxyC2YIDjKZ8HgX3oj5PdcQD8nCVxoyMxJSIjmJntQaFnZGhNkgjPF3BlpJve+u6eQmsRIcG5H8dt/jHCxsPzsMp022sRWkN4O6IevQJZ89ZPK7bLV9oPDGym3HkYTbAQeMj2GuhwmtzkMdQhm58LzMlZcLlo4p6UJBpcboCA9bOQ6+ptocQ6HBUOXNE9kGCRckYWKfE8HRQtE4Tg5wsrkp2uaRQU/sn+QXgVjvqIemKvUjcsYj7pMoLC6m2jrZXVFEuT1sZRY6IXjSIogZeeYZ+PpHkQpQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1741372369; bh=njwvQJsdnd/vv/I3MnWguvrgIweEr5A4RQaxgF1cfKw=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=URO0lhpG5FdxsGOKZ8T3bpUJhy9eaD6BlRFkqtlgRpqpxexxtOfKUPzcUejtGL//Nhgw5BUh27CilNpO0D42xQcQfkt8ZkS8KTl0GchYfMG/Q9O689Yl8bJ9QY+02lYA7jOXCMQ2GUUywDOvuwL4NrVexvFbxQZ8g1J678qKA3WkwMRvBnEV8zIaCOUDxHm7MT4gbi5d1TK6vIpv1P8beYC07u7ytFzb3JdeNHWCIP1U/+zH8UFi6Tif/yDnQf6e/PNUt58Y2flZ502vgfoT7iszrCSUSCiKboWzYLcgwRBkgqTJF4gBm8f42/9wbbWaCWRmrysSyuC+XlNP82SbhQ==
X-YMail-OSG: n3LKfD4VM1newg.cwzHBmSo_XE0WaFTVh3E1uPv01fQxU4qxdIQXa5nMEU5PDk2
 1_1q1qpOGYxuDqkSUbzcOlpLHUEMUD_dGgQS4t.2DDWja.ZRoTuqBjZJBDERCvJNnl1yIGxIJEwu
 XJLqVwzOBRl0n_dmud9hP.GM3bFMlKLOT5GynK5moDzdHX.PdPyy81vQdHRBzh3MH7CpDVpFymdj
 5jFPXcapQtCFVGaeYnd1eex1poRF9q6TodQYI37O7uefPoj14YyzUB31XBMxmuN0DV9Hsakzn6bL
 cnCuJ41ysrw.51vbiN_uWBajk2PNu8QNipVB1pDNZeDX0jx7p93BLDoDkMEwFBjK8Hf9aRTJOMK.
 apmesJABm1uShs_AlGYfWA5o8_JKOq4EkEspzoLYtkF5it3bLu21IC1Qo1bdDzYR6ZQWo7Vxd6Hy
 inwuEq2HbcqNKX2O_5lj5_KQwht9Uo9IpcnGFkWnT70b4QCxgo3exSVXYYx9VMA7QaIy7yFhJmFn
 wMDhv_inv8E_Kv_sM8tnXQHqFGLYuLbCA8kVwgP.FfIgz0xplGxU6ZOImYwHeqzJcjl6cMh9uU6J
 Ha2L.1k6XGC0_7a0Gsjn9qZq97.1B.LoG9vgOvdInmoS2y16.m29Y.O4uwNhfTuxoyMbTRVudKjw
 cIJPDY09tGH596MCsB01kHhLRpTvXwbYU6FxY_N199Tz22D8PYHbRM4UTpNaMu2iXgwVS7awKETV
 VjogjorffjgUlK7jOwLovRbBAQFQz9Qg_6XH4v4dAz4pYFPf546ARufl1rkpnEiWY1FNWylE_7ZR
 FPpkM8NqC7bhaOn5k9lQc6Vlm3rSfrOKLLoohQtK__R2.CVgovZFdK0e5puKHvnWBpjdLc.6rMIa
 YKqz9SgeRrhTVpp3onEDQFdmCzWlprWJV9rrON.LvLSMDE.hXQtdSaiFdBXQfihLrt.mVSdgIQ0M
 sDrusDj_Yqd2W2PePUE4nfZZPmLHwJlElOLd.ES8KPGaXB6fEmuoJesQbrWUu2RW5vKAqN.cvC6i
 OOkU7n4vozmunu4WDMy9XLHv17P2Dm1hBhkb_OWB75oFpUSGzssfjL8Dm6T.BQG_eEoXLTVBJ7He
 RJsKzULSVWjX9FGmNWFHn4bs.V.prJhZut8LRcVzRPPGGoU9i.oA.cSGI8zodXuyLJW5gif5ii6W
 e0BtLgojxpbAG2yZtsM4BWhVvakz.NpOjoNuLsDf3B0tSIucDXHaVrb3QWsdQPscBv1iIUETGTvW
 W0OQQHTByHF2or_C6OEGOgNRZZ0gP8yA6xAvHlgFdBJqjOoGdJKtghFUTDG0rsKJTi1RG5iYfcFu
 Hv8e71l8__7WxcRlMq8A9iXnK16TQgl8WonPv6IjaEMUOpH9DxE471gEuUgQmEnTdl6KTXoS9GQF
 R3E2nZ1KtjyV4Ji7N52RbFuOvt5VnR_puji1gua6SeqhdQXthZ1meuVtrSlFpScbbnNZitnIDnOR
 wesDcsh1nJPIdwJ9bt620Vc5iZlSyWqLCx7UwYUGvZh1O46ms6Wjo3l7y_2Yn0aVb.56H8v4XUNy
 M_rw2Rg7CzkQuz_N9Hj4hTlVJxKixyrCqSTXPlYU0BW0U139Tt_Np3s4TCQK.R0RzxAwD2XR.yjp
 C9Uhth44eRf1HNlUAIJUw7NqEzHl0z3iTI9weZCtkuCj3BB4V5oU17OJeQbc7XjTb9cuGpHcOk4p
 3j50q3KMoFQvz8emrZd.TNInPN4ay_ys6h_2gOY3QWnOTvVs_0HyEn.HwkC1Ph..K_oKxynhxCLO
 FGcg5OyCTvNje0Sc0gbQPKLcRWXHUThKi8izxjtoFDehVvVGkjzzuHqXXgRXe_EhLEfTUYbYjQGD
 OrM9Vve7p7QkGtig7HHBTfg3nF.E1j5bfxjXFSYSWpgoZ1gQm.S68JZHIY9o7bwjbg0Vg71G.ngs
 GyJQcx1su0LMuAZnBPEj6bAkHiy_rP_OalJYipi0guIPo4fG_z8wwDkvvPe6lb7Hm.kTiZTSOU3M
 zEKWpgpSnoqnTcsbW1QT2daNoR8SQGMSROSM2uEJ7FUyEEmpnxck43Cgkn9YIv4te7IcpvESauca
 brLk5HHC5yfI4MVvftJYWHKXf2AHCXELEedhDSTLMArUwAiKJZLiU7EPmX7cIR9Iz8CIqzDSpixL
 phBTWfeF8jakuRNG7gkaLkLig_p1Z9dyU2YD4L74U_InmBvdDG9XZJaMvJi8OpANHa9Xc.yUTOia
 72SqvvsBvc6bE6z3uc5SSTKaT36B7zQfJEOCLOhF45PygOg01cAqSwSqbWEeAtzZYbEUGppIHAJ4
 UWsL.ADib
X-Sonic-MF: <s.egbert@sbcglobal.net>
X-Sonic-ID: 7ddc48a6-eac7-4e17-8d1c-ad4e487045a5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Fri, 7 Mar 2025 18:32:49 +0000
Received: by hermes--production-ne1-8446b9c656-8qd4d (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 69799b34527185032f6f807976f53964;
          Fri, 07 Mar 2025 18:22:41 +0000 (UTC)
Message-ID: <bf9711bf-c3e7-4406-80db-8153f07e478f@sbcglobal.net>
Date: Fri, 7 Mar 2025 12:22:40 -0600
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: tcp_hdr_kind_and_field window COUNT vs. tcp_hdr_option_type window
 LENGTH
From: S Egbert <s.egbert@sbcglobal.net>
To: netfilter@vger.kernel.org
References: <744a8f97-e72c-4a7c-b2f2-a121f0019778.ref@sbcglobal.net>
 <744a8f97-e72c-4a7c-b2f2-a121f0019778@sbcglobal.net>
Content-Language: en-US
In-Reply-To: <744a8f97-e72c-4a7c-b2f2-a121f0019778@sbcglobal.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.23435 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

After a complete constructing the EBNF of nftables (needed by TextMate, 
LSP, and Vim syntax highlight), I notice many repeatedly overlaps of 
syntaxes within the parser_bison.y.

One example of such a overlap pair:


All within the tcp_hdr_option_kind_and_field, the Bison parse tree 
offers different pathways to the "same?" following `nft` expression:

     tcp option window LENGTH
and
     tcp option window COUNT


For 'tcp options window LENGTH', the Bison pathway is:

   tcp_hdr_option_kind_and_field->tcp_hdr_option_type->WINDOW->LENGTH


For 'tcp option window COUNT', the Bison pathway is:

   tcp_hdr_option_kind_and_field->WINDOW->tcpopt_field_window->COUNT


Is this intentional overlap? Or did I overlook some hidden feature(s) 
surrounding LENGTH and COUNT?



The Railroad diagram for latest 'tcp_hdr_expr' is only XHTML-viewable 
via a web browser 'file:///' from your hard drive (GitHub defangs 
[X]HTML; SVG is too big, PNG is too squishy):

  
https://github.com/egberts/vim-nftables/blob/master/doc/nftables-railroad-chart.xhtml

