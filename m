Received: from sonic301-35.consmr.mail.ne1.yahoo.com (sonic301-35.consmr.mail.ne1.yahoo.com [66.163.184.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D9235A957
	for <netfilter@vger.kernel.org>; Wed,  3 Dec 2025 16:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764778921; cv=none; b=gM4ZtioLS0UJw33SMg6nl3/4yxs8IzGA1ZamzpheH54osdsWVS6Zn5XIcsg+d1O4zeama0w1Ru3rN8MogE/kFnBSJVGaqdmWiM+gkI6aSwQjHDuYCcgYyussQ/aIfAOs+QKTBy/dWQCCAQbF6UngETBZ0yi5PAS3t28qF6tFlro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764778921; c=relaxed/simple;
	bh=TtUmqbdWZn+I0Rn6fpzvOwZPBeZdA6mZPH/B1ouKoA4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=XfrKJHDZCv2DsV615oFM/TLlfSCpJ/LhZMgZTFU28EBzm6oL2eR3t8o1Fn0pXIfZy9MRo/elch5p5wOu/VQ2iFjt6760t6LrTyXIkyF+pMYE+igoietQNqf4hTpRZSLmzgO8W7CLuRpXGGBJWJpm7MscvHnSf/LKrgbhP5mKr9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net; spf=pass smtp.mailfrom=sbcglobal.net; dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b=lmRdWgRs; arc=none smtp.client-ip=66.163.184.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b="lmRdWgRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sbcglobal.net; s=s2048; t=1764778919; bh=+VyPgooiu1Bc7zIs4Ua3BRv1WbclzfBYe5pUKhMMRwk=; h=Date:Subject:From:To:References:In-Reply-To:From:Subject:Reply-To; b=lmRdWgRshwalQ1v6YwcF5gV0kcsdngbA459Vjg+2JFpyPw9dFs9PVIRyfTml4nV5adnMunP2JUQLbezhbLDVwk/EHDbQQaKuMOE8BmoPBXS2YJprQM+Qn1ikZYpKl2xf0GyKv3/UC7vpLAGj3pHkJ9utT8dJDHwqFsF+gWm3OeGA8bVCVUXsAIX3/ewZKRx64N3TN71qViytrRZ2e+FKDn+Zk2G978yJRSkhYfqO27A5mVQzqOiqTwrAmPmZI23d4Iabu2NAWiTKI+JSShnuX03K95aOalgGikgHitU7Fj8/5K65Li5oWfcQJ3K/L/oxosh2F+nA/1L53rcu0p3/vg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1764778919; bh=uV5boC9QRU+KKuPR9KK6sFkl5PYjsnTCQ9v1YxbdvGC=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=TeAgrhnX3gIeRVwmeYpp3qJT7y0u10dulfvFmSLICBF2PWyXGXQvlkbT818Mqyjkiu7DKDF+utrDDAv8igUrZUUnGgficWmu/ETOc3828Z8xJAmI0Y0RrSAH1VA+YinBNY/gm6PtPS4lSrZ+s50QMR8gWY8DO9SY7v7HbyLMiacSWjlfZV0MqBwOGclxryJcAY+xL9vvauddt9o5Hx6FwRp30NFBLoK6BHSupXtmR4sjKiXoh5l4A11txna0tcwMOyjbB5OyDFc+IpjiyNTWgsFnGbxlcuxhB+YHt5BOVe1VJXKAfRhy5jB54LtRmbWkSAer2xNl115V/Bj2gcIN0Q==
X-YMail-OSG: JEUEPAEVM1kJAbWwAt9QlzUkrVmpe6J8OQ4fzPEM3FNGrSxGvPukQytajBM3.ff
 pII_GUJmckAVHwoNG.9Sg2UMlleEU0NpsdwzpXLSyZV7bypT1CVRldeTwL.OoqISMg_JKXgWN.KD
 YiJc9qOvHbyy.o0WefonA42WAAMcey2LXJPMnRZ0cgiH0RpppYJKoodKNN8TZaTeZCHwkUYfc8bg
 yp3Qbx_loVMwi8UTEKklzCq4jv_QqOlIEBxinwHY7oyFV3RLKo5rLKi3KSwVMsyvdPTegor8wrjV
 sYg6uE4Xg4dLJMaFE.2297inP5hGkGHG_ZaW58SntSeJTLh0QBx1SbEfyE0.9fUtCVoloULoZE8Z
 lsXUSMeETFOxFNOU56QwUbYk_HyXliQJ7azwqzNIyH5HMt22OU2gvQXxovk_.DDCOSu0XW8QTQSr
 vMpigjhVHV1dfLFPh_gN_.moXrbbP3u2OYpXLhXAFBbSYT8Y1VcL1xo157tran64wcyGE5Sz_PxF
 O8LMBq38YK_FtuFBl9XnVcecFPK9BDdgbmnSyywkW8LiO.q4W8e.HeXkAIn_ZRU0rIE8QK4CdABP
 rxXjT4_YbtO3Z94W0qooBjk16uGxuxV0z0CCur_72BSL5oPhS_s8Vp948wQP7uF1cmSY7VnH60gk
 N6Tc9_c4FR19TcxiYzVRn6zohwWhgN4XeKu9KSsDM3BOnGD7jWV7aRDHNZD7unDqqiBuOx2jHwvF
 cfnfkcHUX8k5r0IvuWROBConIRacDQeydl5lLDiRB2uMucCiANxLVQcBACLlx2T67u45Y1P4dfFg
 SJnsrXBov0KSOzeevpUJ7lkz.FnOSDpBC.ZPIidDt41jGDtmrtQCZgjBNv0zAuUsKudMAk_8Jblb
 MaM6CsvQoPwXPbkmSAnOg48ONKqQUHtwkjzbCReI0bO_2DL5U7Uf07UBvXhzIXjt..FZQ3kMNZ45
 ggqRs47W.AziXta076.dXaGUk9rnpXRx6E0f2ToY8C4RspaTaAveMT1noqa9ZyVPGzZGuJrMnNK6
 j8uiYG9Wy82q3LNv41RWPIILWaWXKMDsk.4AI93QnafEzMTncu9UxDzLX_kXOJT95ZDxGLR4irBw
 Lm2GVOsdDWpaNpBflSfulOGzzPqZkmN_iaOtlZU3Z9uPkBvkJ4nzgbHFGuJ45ZlbpSi4LXZYKxz3
 6pFhAFMq_jPJHkJOt9G5QtCPDhKoHVq2kOzRcq1I_VH2Yz1Q4wEE2iW7wVk9IT4nl9_KoKAbQpPy
 MX9j.edYl8TE1JUm7FEXp18SLzPO_E5Y5_QflbFKrCTtDTIBTsDamabX0N5YC6KLbZfRPLKDGxJg
 g8x8AqMX1diBW26dBt3.7LtMK0GtJIo5zWSP3lFPj.3B.GBeXuqcTzu7ye0QGpPqIDORnbPQaV63
 k.LEKXGYd.faAXePAd4CXWnb9tm0hunOHdYxkJbrutduhofhOFtA7XJKlMecY.IF1eIPvk_uAium
 x01Kd0ZpHQMokmwd8Ld5E9rvruZv.xOpgnpSSMcSsyHJjED.yl.BxX0ut.F.TZ3yAeNA2wNKUSg9
 UwlQQiNpOHVuL3T54b41M7Wj2GESbYfDmfQxCc3kV8fERogMfhgkyvzTxcXi1bXhPWwEJ8PKZ3In
 g6XuPv_lmLPWI0JWqHKr.BzdC8iUt.xvslQL74ZiYcBUiXRhvIfHAUsjHIMs3Hwqs7xEYSG.Kh0K
 MIlysKQ5afvovXZPSIGlGSgKQJapn7MRmUupr4YNll5GG11Coaj1P9Wb1Yx.oM4oLSqKTvpaEjYj
 U85K7i.lSlPYxsIDeteQA6JZOJv2ypW1PzbyWkbRcjpz6yxBZIyg8FFYIz.iJiqRVljzGaNT8Xdx
 u50Bxt6SAgxVNobGSJGbnciDOLifb28Zo_aDoZ4SifLs1q1mTx0EzX_Aa9WzXO2PvVs8ALsnxx1x
 Z8gLtkgL7g124Ot_tCvcfRnYG1HvnklrW9xmPK2w9o4WnCr4aBc3zRdXJWMlq8l5f9lA25UfTUkK
 wLQafSv64ndKUi707kqbqxcDZNJpUcyaEzEqCnx.rkHzxPv0nsG3Hj7LfYnYitmHfZgYMYOD0w5v
 wKv1xXfbuIXHhROiDmZ6CaVBgvSHQy_qgMOj1d1ckKvihVHVDdSrfn8G0.sF8AhCAodOW0mE32Np
 fKbmKT_3WrIGX3DpTtep.Sk.wqhNPlZGlNb3o5sADqrQvpkK3icekJLf5nc02XfqpFELjMSrA3PK
 X6P8fcmHdthymKzqZ2wYOszKyGewoZDoiQYOQ1DW9qrV8BWyurkBZFdIjklsQiuyQiHZH8b6bv6U
 begDj3B4-
X-Sonic-MF: <s.egbert@sbcglobal.net>
X-Sonic-ID: 3d687c33-8779-4804-9078-02117631e965
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.ne1.yahoo.com with HTTP; Wed, 3 Dec 2025 16:21:59 +0000
Received: by hermes--production-ne1-6547dbf44-24tl2 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID c364a5adf233ddf0e45b79096ae1e3db;
          Wed, 03 Dec 2025 16:11:49 +0000 (UTC)
Message-ID: <8713154d-d857-46ad-922d-032d41fe1f9b@sbcglobal.net>
Date: Wed, 3 Dec 2025 10:11:48 -0600
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Vim script highlighter, beta; 850 keywords; 2,400 states
From: S Egbert <s.egbert@sbcglobal.net>
To: netfilter@vger.kernel.org
References: <dd844382-aa5c-45a7-b363-05ff6d86c084.ref@sbcglobal.net>
 <dd844382-aa5c-45a7-b363-05ff6d86c084@sbcglobal.net>
Content-Language: en-US
In-Reply-To: <dd844382-aa5c-45a7-b363-05ff6d86c084@sbcglobal.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailer: WebService/1.1.24794 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Updated nftables rules syntax highlighter it to include every possible 
supported syntax found in v1.1.4, (except for 
DCCP/SCTP/Geneve/VXLAN/inner-outer-headers).

     https://github.com/egberts/vim-script-nftables/README.md

Now works with over 50 color schemes (unit tested), dark or light.

An animated GIF showcasing this highlighting:

  
https://github.com/egberts/vim-syntax-nftables/blob/master/doc/nftables.gif 


Installer:

     https://github.com/egberts/vim-syntax-nftables.git
     cd vim-syntax-nftables
     make install
     vi /etc/nftables.conf
     vi /etc/nftables/my_firewall.nft
     make uninstall

Tested on Debian 11/12/13, Fedora, Gentoo

Unit-test Test generators tried all possible settings, example for 'ip 
saddr' statement:

  
https://github.com/egberts/vim-syntax-nftables/blob/master/test/ip_hdr_expr_relational_expr.nft


Next, make it work for my EVPN-VXLAN firewalls (inner-outer header) for 
my multi-tenant Geneve/VXLAN overlays and finish up DCCP/SCTP.



Enjoy.


On 9/8/25 10:43 PM, S Egbert wrote:
> Well,
> 
> 
> Finally poured in my latest and greatest Vim script highlighter for 
> nftables v1.1.4.  They are in 'Github'.
> 
> 
> Pretty sure that I've forgotten a few things.  Maybe it is that I just a 
> needed a breather.  (Vimscript is extremely large, runs fast on Pentium 
> laptop.)
> 
> Video embedded in README.md.
> 
> https://github.com/egberts/vim-script-nftables/README.md
> 
> 
> Enjoy.
> 
> Steve Egbert
> 
> 

