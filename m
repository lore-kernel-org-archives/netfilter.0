Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B55200BA4
	for <netfilter@vger.kernel.org>; Thu, 24 Oct 2024 22:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729808499; cv=none; b=SpZjRtC1sCdD/AfyIbKgeSAcWFF7G4oBVfov4Gn4XzKF431dzr6NSbhqVWICsiEmv8P39WK5ZaqA+V7/kgmNjT9rCK8aKpbP016Nu5t7sbGCJ9UiPWok+o/zVwev9fIIFs+NlSYH4IXiwz23l7Yvk1A4TrmbfTT4KuLVxn8dz8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729808499; c=relaxed/simple;
	bh=FCSyVTXsTs/qquawWpQjXsac4uz9g2eH/GhcvNZc1Hc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=S3sfT908zf8WUAyB+R+3YFSTr33P1WaTfCxVKqRlqLvovLmohIQkg8yZJX6WIHgsqoiIOLbD3qlAU++wGvM++WuWfq3tt5avZxZRxJ/at7Izn6tA3cMwfcXBdWcQd9wPVoL8Ge9QPtkkwRZ/JsXn9Mtc3zN+USBd2TnvVZgPgIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pabut.org; spf=pass smtp.mailfrom=pabut.org; dkim=pass (2048-bit key) header.d=pabut.org header.i=rob@pabut.org header.b=rOQ1AV6G; arc=none smtp.client-ip=74.208.4.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pabut.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pabut.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pabut.org header.i=rob@pabut.org header.b="rOQ1AV6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pabut.org;
	s=s1-ionos; t=1729808495; x=1730413295; i=rob@pabut.org;
	bh=FCSyVTXsTs/qquawWpQjXsac4uz9g2eH/GhcvNZc1Hc=;
	h=X-UI-Sender-Class:MIME-Version:From:Date:Message-ID:Subject:To:
	 Content-Type:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=rOQ1AV6G9ZVHlZ9UMG7wc3K7TuQaFILxhCExr8q9CrAxyWR2Nbt3qJs0cuO3QEAe
	 SE0+xW//UC9ARRHAUh+RqEPT6IRTQi2rdEbpVsLAtbnSEbEMQVnhZc7sq3/16NnRl
	 eo9ll9bqM1GS3SrtRRBogGWV8uw4o7fsAfDuuQcz1tFn/Sx5O3Et8puwyuoXQHTYs
	 qfqfJ2IrL4gaXI64KSRwHoixmv/x2J2kxoRS0ts9cQ+EjFuLmFdlqPNF5La+vkTSF
	 E6yx0HNwNYgqrfb/5+FqLoXYVZdfWTm7joJedKUS10QMqIn0xiijsnq9qTyuLDzgp
	 dZRa5MrEINt7Rejdog==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from mail-ua1-f43.google.com ([209.85.222.43]) by mrelay.perfora.net
 (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id 1MybjN-1tpTla1Ykv-0143Dl
 for <netfilter@vger.kernel.org>; Fri, 25 Oct 2024 00:21:35 +0200
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85019a60523so474285241.1
        for <netfilter@vger.kernel.org>; Thu, 24 Oct 2024 15:21:35 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz5P8WyhAs01AkctglqW9trMIPR7nit+JSrF4rU2Sy45KBW0d2N
	wMxUkJoAyAIwX4I95wHqMHl1FpkRNpVOyLNAUutBCh1adCQd5jXUmVtXKu79sOdvb/jEE3fFmJh
	101fMRHiQRvRACoJa1x8jkahtv7o=
X-Google-Smtp-Source: AGHT+IHNwP4WztLxg1UhViBNvgT9gWvX/LQBpQdBsrH2fXIGJR53cs0laCwXvuudUtUtMBnyxBnZHCd0IKkbmpzHkmE=
X-Received: by 2002:a05:6122:90d:b0:50d:53ab:3d0c with SMTP id
 71dfb90a1353d-50feaf7ea2dmr3462308e0c.2.1729808494853; Thu, 24 Oct 2024
 15:21:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Roschewsk <rob@pabut.org>
Date: Thu, 24 Oct 2024 18:21:24 -0400
X-Gmail-Original-Message-ID: <CAE1O4xoKua3A0z9MKV+qNoDuYJhb-Qhy1Q13A6s9iZDAR1ZmZw@mail.gmail.com>
Message-ID: <CAE1O4xoKua3A0z9MKV+qNoDuYJhb-Qhy1Q13A6s9iZDAR1ZmZw@mail.gmail.com>
Subject: Unusual packet forwarding task
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:xbTCCu/2QGlGATYawdTtTJI2oGH321Q3+3YodGPm9bpAd6MNzU0
 4VDFOGXK7Rarh5dsHh/bxN/nAc1MdvABCaRbA8LKREjOpsv7iZ7i5xU+IREhxXAIxc/j0Lg
 Cnbt04KhYlRlV50cHDl56bona+um9jwXUFmmrFzNiQs/zdW/x63IdwY+6z3CTkFtAgiWHOd
 QIHPWjjdfdl9CO7U8GCfg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:DhcgVtjptTY=;caYruadAgb00gzSSRScabDpKwUV
 OcDu3Jv4XK9nhE9RF+PsczbCB72V64YeKQJFRD49i0bij0uSHTRqUISXMBEo5D1covP26NxlI
 VLA5uSSOSDW08hU+DW+cHxwe0cwRZlspfZypB5zYncgYK124G5zSRgE2UEF/wuiDlnhptTFkr
 quJuoA7FzDh5sMCmgDf19ZdGP+gNZ5kHiOc6W8ly2R+UJSDYuSxXOQN6oJj18vl/Vi1VF1dtI
 oRX1A3BKgCP7eEdMz4fAMVme4F9U+kan7e7o0DSHSdHcqRjVyWH9OR2YCnyo+Sii9Gs0gyCYd
 mmnJelzNDJtCTSUyysT1dDfH5FlvS47VMTKhHPaiFl+L20LFVUdC3BOFgud5HirYy+LP81E1y
 a+zZyk+r8fTfs8TgPEGB/1eE80EVMm7wK6bYfOqSe4FCUT2MhFnbQNd1oY18jqfRYPuavWBfe
 WluIzSn/1NqNGKbSMDc3TkBHuQ/LEdHZqfq/ALL6Zno6lbHaf/qqn7WQjuif/LoiIcTQFS/nr
 UrI8FsijsLAm3nMY5ylG2+9rbY04xlQ+6uSEQ+v80BJ/BJ9vSplyJkeLEgdbfRRNbMJGNTWks
 4EmDXJClT5DlHQLFDoIJy/xC+Q1PuPN77TJ/YaMjMnlZRClL48VfiN3w2xy5nOCy4DiX1u53r
 oxw/cfi5lFPKOZMpXjvj3+ULxDjwTvJJ6LUSw6pj1FQr1w3GWozCCwpaxfC00uSvTmVSRiLYs
 h3XLHSganFtspYJruwcsSJjF3iK54K9Dg==

I have a linux box with two interfaces ...

eth0 (no iP address, in promiscuous mode) wired to a network switch
port. The switch port is configured as a mirror (a.k.a. firehose).
eth1 (10.0.0.2) is a second interface to monitoring application

The goal is to take certain packets (identifiable by protocol and
port) received on eth0 and send them out eth1 with DNAT 10.0.0.1 and
SNAT 10.0.0.2.

So if the inbound packet arriving at eth0 looks like:
192.168.17.36 -> 172.16.20.3 | protocol UDP | port 6000 | DATA |

It should go out eth1 as:
10.0.0.2 -> 10.0.0.1 | protocol UDP | port 6000 | DATA |

I've tried every permutation of OVS, Routes, IPTABLES that I can think of.

I can blindly loop ALL of the traffic for eth0 to eth1 with an OVS
mirror without filtering or nat but that's not what I need.

If I try plain iptables with FORWARD, PREROUTING, and POSTROUTING
rules no packets show up on eth1.

Is this solvable or a case of "existing technology will not support" ??

Thanks,
-> Rob
