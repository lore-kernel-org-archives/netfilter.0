From: Mistick Levi <gmistick@gmail.com>
Subject: Check for rule existence
Date: Mon, 14 Jun 2010 20:16:42 +0300
Message-ID: <AANLkTim0fkO6mhQqBlhAsW-I2blxkP36ld0Hk-W3kF42@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=5W7JoEewfjHVXfTaRZ6KLrUJh1BLBgZpng6ViDHugWQ=;
        b=dwnUw4jD2DnNCOS6gatXfFUT9NwBreBu6umRvCY8HkO88FB+6mqlNeygK8l72BFiMF
         2BMIFpNyqyuApVOsY2NSicy7gxW5SwdA8OF+x0QjzMJxvmADu691SqX5huvj91x3rufa
         v0cNOfGJ6Bg8NXgJkTFRGtod0gO4dnfTHM2S8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
Does anyone know of a good way to check for a rule existence?
So far I'm doing it with grep, and text manipulation...

Is the only way to check for a rule existence(beside run iptables and
grep ) is through the libiptc?

Kind regards
Yechiel Levi
