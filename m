Received: from sonic308-13.consmr.mail.ne1.yahoo.com (sonic308-13.consmr.mail.ne1.yahoo.com [66.163.187.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E94D515
	for <netfilter@vger.kernel.org>; Tue,  9 Sep 2025 04:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.187.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757390610; cv=none; b=jrZB494uvsgpD0cQ9RjwV5D0uqcJJSZnUiFCtSE9mIiXBqrajsMlCluYOhjDDRmzIY70XEw/iWYABpvx6mM0TGouWlFOxAZWkO73lCc+1QR3Pmkk5VPUKJwyLh/9aNgz3N4yGfHnn6rJ8G9ymWT40gZTCMN0T4+teX3SIIee0p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757390610; c=relaxed/simple;
	bh=c9ZounQ7hPuMo7PYpmfsMZFSJnFDJBpy+H/XeWvpE64=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type:
	 References; b=ZevHwk/nc95TzuG3OKNMc+mcTqFHugNcSrX7IvwO6HzUv8drtCGsmmxsOftXXWq96m8S7jRX/NSo0uKnz16eeKqOuE9amTmKHtdiP5NtbxM2gt1lVqLx8Q8Hl/Zums+q8jnQgbqyzdVjsPH+uMzaodxNZITpPZ4pOj8GQ5ff8uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net; spf=pass smtp.mailfrom=sbcglobal.net; dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b=S7ke7pZk; arc=none smtp.client-ip=66.163.187.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b="S7ke7pZk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sbcglobal.net; s=s2048; t=1757390607; bh=RnUCoYS+VXa1AZhddI7jlZ52AppFMjKa6jJKUManbH4=; h=Date:From:To:Subject:References:From:Subject:Reply-To; b=S7ke7pZk0VYrTyD5PvmErYL/twobIghTr3q30QI3Hj5D+NeTqbeZQcAc4rlIkhIHBKk0QLHu+xllyONt7LoxWK9h0B7bWd6HblfT85khIAcxLtqSD0Sh4ZZNHUV8a8Kf+/BfZgue6Cz8jQlaGSYtuz/Bu2syhpWOEGeYdC0aN9Q6LnKlL0TEy5Mfd7xYqJ2AznuGWw0OPBSOrfdeiAYNDb8rEqvrUbI0WTVlBftdxUhrObz5WY4lo80pvByY4ULPoXI5Wu0aaNlqfWgkcHo2/T8qZmi8AXubmAzgoFR458e36I9dcEVY6lGMLnjHJBHxlS1vjTU9nJl5poFNWLlW8g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1757390607; bh=EcufBmrNWkhHDFOci43lOLucYAWjZaRzUSP4E4pbK6d=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=ZJBggtOa4JITOImbHtu3+QuXzy48BFQByFX1hz6uF6xSPl2mlzO7BUflFC0CGxVTJuof8aeRZJDElLtjLXBW5V7AwoPVb3tEuS3wVDd1lPnpGc4zVuMH7l+l/Clv4usoVEqbThuc82ErSheuXRypHVU6QveFkhb+bQNdVLq26tlS1ZOp0rb5Y+mSG3W4N1dbbfIaA6Yvl7w7cTvfePaFPtXss4R+BRepLbniMZe988BF2lcl5C4jPcwEqfKq6aa2gQICT9XPhX48RhIOW4FcyBsB8asvrFRdyVN6V7unrWpf3FtsSXZVVcEehEPpXL+HaCJDhodzUp5Ajt++ddsGUA==
X-YMail-OSG: Py_dUwoVM1m2lm_M8yh2KfLKu60ppH1spDquiJ0xkawjZ8U14x1rJJqZ42_AAzM
 NHq02MkfQtvunnN0QqGXembPU.tk9tzho8uqt3b6YjqfwR0cfJScIbDd0rHd4fwbSQD6LJIbGpS5
 hKA7Js5.AbpDUmf92WZ07wznqsyYy1UygPRlUMUjpr1jKJmLjms1Hf9zqo7RCmecPoaEd8ABxo0Y
 wCCh_Q0S8itHN0U5fAxNJQoUOpFcjMBeR9aPMlCCkQH7y41RPMjutLcu_dJaMDFK_bdTIyTFSvT6
 g1kH51l5iqtGer4mon3.jRNo0JgIPa82CnFMCL.0ry4QTwOGjq.U37AebW.2jkMwe5wCVhzl7X0w
 8kbaCWMn6RQaF3VGMV_07punY.bLAz66Qu8n8QZLe4pHLe1rYO4S6nAh_ABE.W340iw8vUP1pybs
 yhCe4phZtXY09tmn7iyX5db83q1BPyzJrBwPhr9AXxbxo8yfyyoPIcZqoPxBqvd_WlLSECkQLzCJ
 T9qAUnurLD3RGbCwI2KVSnngl3E032j701EtsLOBd1EXbSJ44tTbMdXG2rrjaWCFO6Qqs1ObWj3i
 LxSBZTYGQ7ct6G1u1iOszuBhyh6L2eWPPbcuxotnJf3Y__C97N6BreTRxHXINcEvjwJcB_t7BE3o
 C0kvhXf4zqrKweKnNCwITFczYFCUSTDmhdIsqH_MyxDnZ3lDw1YAXX4rSnSMTej9fwFC1Ac_SPIF
 Y4kMeMxJebBNN1ISzIKaGn7A4sm2uUhsQHXYpjyJP65Du5pMieGJY9j4OVnr_YbeBWOH2qfOY138
 Cb45RpvsEUMKjU7wlQqRkpy4TtH89gZW2K0PQDeTrNHv_.KyVTCp.CFdbNIOjOOcOgiuSRxo2gS5
 cjKjAc74QOZ1JU1g6tOM20h5PJoqhCLq6YpyLKWgR6BdEUAqz0jOqtGCv0pxB6V5_qe2uOGBiHZH
 ctx6qxajxN0EsbsWuMIz.Rk41OrSwznoRqw6l_2TO3JSFrNcIcfVyQtzKPwszND6L_Hfip94mvEp
 wV._qus9.TwClroboNNNqIKalyj4uH58r2hghPR3L31Yveg17xCB8rQK4qhG2ceXsKmf21ec5Sgb
 zbu6q.4FmkGA_i6okEYtJWdaGtMf2M_eVv3Br5SUtNc_GFKJmv6XugIwPDhbLrbliU8Rh0EzwjWM
 GBEMf0nNKIPNO70IPdUl8skhMCXBokXwXghvPo1p_4kSzr5460dR2RxmbmfjdvQGSRPSDLvNQwHt
 QXyfxwuyQK.ueRQPwpuAF1gqe_JuPomevliMzbU4cVh3YFfLA.hM2iH5H6RApE0FzChBkmKt5Plt
 _0oE_ANdHw6oYS8RwQO.Nd57AafA6vNamZR9ckh6byB0Wp9HvG1EDL3QwoO4PuIjml7VRRR73rZ7
 71.5itM0oPnol94rp4HIWAUaoLXh.nPUntObLVgoGKXI17Wzssvet0uiniKWvD8QybU2Kn5xUQ6V
 .ZzF3J42loqrlTyPUDJrXg2Pa22lTpYiITSoXiVhZpF4cQQhrjw_zuF_zlFNUSMlX7.dbs3Ji5L2
 ENgas.BXKuMiUxFlzPQf9U7nAyqiY9lO64Axe0ZHEhuDDP9XwH.M6nATNu1wlNni3gUXD2m.sb0H
 2nW5ZI9xoU8lawrQ4y4Zdg.8cJmLF6bNkEZw6OxUeAEMtgKqTopaxLzRNe6Ky95SXf2FvTTJXvRs
 OIW3ExnSvA9BtI2jnJi.9cx29NeSOF3n5PS23Vd4kiuVS2Nmg5w4nr5HOkIiOTLh3GfhGY8sY7tv
 ByBIpyeGS6hNq.Dy00Di2.06Ee9G7De6qMjp3ZlDlP9ldn.0BaWS67CKtIklAi0xOLdrfa4n4vxZ
 fDmZPN7aow3OCB9hrZPiAj2HYy7Sr6DrlY.jVSMncnbydLVKv3xnE_xxjJKRMoBJ1Jm7GyxAABzE
 3a_f9NbGWnmQEZIrnJkB5RWpb6bK5JYIzu_YEYzzfkhxvvU02HqHbmNHn_Zanh1tQQtNrE5Vt3M4
 kLop6isryxFRS8SIsB.mPkoTcgYPDEvzZLn0_Lw1B1Jz2wJymspfryFLldGyyUIfZJbHVFFwamXr
 .Yn0us8.TevLLfLQB2V7.c.LTWURpDRehzLbVmjpHACkwexN78_KVagwLv9KamWi8ohJl_XoZC9m
 2s3pE.Yb23RM09cr1KLcC97IVVsVvzFyF4YjVRiC7OGgrDwacENlj4DRNP0v82Bch.6WjYl1KKyT
 dbZ_5tJS9cvaQzPfULouyGgg9vuXqR13A.TmC1G.6v.YZfGz3DptEQDoLypMlK6C8lVDnC.iLZWi
 Hj48Wez1zQns-
X-Sonic-MF: <s.egbert@sbcglobal.net>
X-Sonic-ID: 5cbc4d63-c56d-4b4d-8166-434ca3dc6ec8
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Tue, 9 Sep 2025 04:03:27 +0000
Received: by hermes--production-ne1-5585967d7b-n9lwg (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 11fc2903b1a856ce36191cca00c2c807;
          Tue, 09 Sep 2025 03:43:10 +0000 (UTC)
Message-ID: <dd844382-aa5c-45a7-b363-05ff6d86c084@sbcglobal.net>
Date: Mon, 8 Sep 2025 22:43:09 -0500
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
Subject: Vim script highlighter, beta; 850 keywords; 2,400 states
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <dd844382-aa5c-45a7-b363-05ff6d86c084.ref@sbcglobal.net>
X-Mailer: WebService/1.1.24425 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Well,


Finally poured in my latest and greatest Vim script highlighter for 
nftables v1.1.4.  They are in 'Github'.


Pretty sure that I've forgotten a few things.  Maybe it is that I just a 
needed a breather.  (Vimscript is extremely large, runs fast on Pentium 
laptop.)

Video embedded in README.md.

https://github.com/egberts/vim-script-nftables/README.md


Enjoy.

Steve Egbert


