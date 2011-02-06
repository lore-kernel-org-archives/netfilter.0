From: Erik Andersen <erik.b.andersen@gmail.com>
Subject: Linux bridge/switch port mirroring/SPAN/port monitoring/Roving Analysis?
Date: Sun, 6 Feb 2011 15:24:21 -0800
Message-ID: <AANLkTikP+f97ohiY6DCi-zogvde=d-rji8txa9RPGJd8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:from:date:message-id:subject:to
         :content-type;
        bh=Yt5YfsfXKKuokK8vSJBH1Mfzdw1qhSGB7IscU0fLuM8=;
        b=K1YLEpWVHsHwyFg2tyN5soM4xsxp9pnU+6RAtzqZ3ymtQCcjpnBXtYzmKtkNEdIMWI
         7cziIaPTqRnqxS1+2poF8xAn435Ab8w5m0pVz/Aqgn6DUm75VrThchV1XFJqMaW4QZsM
         vPmZY33ERXtl6mCw3BG2T0Uq40TOCRbWnOQAg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Is there a way to port mirroring/SPAN on a linux bridge? If so, what
would I need to do to set it up? I'm hoping to port morror to
vboxnet0.
My current setup:
-------------------------------
br0 (used for LAN)
  eth5
  eth7
  eth10
  wlan1
  vboxnet0(when I'm running a Virtual Machine with virtualbox)

eth0-->DSL modem (bridging mode)
  ppp0(over eth0)-->ISP

--------------------------------

Thanks,
Erik B. Andersen
