From: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Subject: ulogd - works with AF_INET, but not with AF_UNSPEC
Date: Mon, 30 Jul 2012 18:55:38 -0700
Message-ID: <CAAJpzgbK4NxV=0+b214kw493GyvXm1s=1yFFHz4QmBme6LKHrg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=dU1EF/QIY80tqJBD+UnHM5BzLL1aaRiH5uDo5PIBjDk=;
        b=AwOgicYyoUFbWAStJ47jpY+YTg2XNMdTaiPL+3kV3lgO+bPi+lukB5vfwuR06CwFo6
         4aLwWZuWcfzx4mdIrGzWvnWhla4rr1PynXEco+HxrKu3b/JN0HlzQF8Wm3E27auqn1z8
         kol0WUMqm2A8Z5moIaWrpvdArQWiZygT9mDY1j8xkJWxBCD4z27xfofQwRsAWGkRFLid
         jbUvlmx9jKn4hkouGNPZp8X7/4+2mcxqFlUsVZbFhyKA4ScTHCrHogFrdeFG1M6P9aNg
         WDgt4rKuX6T9e++tlHvn7VPLGW+a2OAApf7Q2ePdi71IY0S6mNspM7DSWS4bsNt9BOWT
         TBDw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to use ulogd in RHEL5 system. When I changed the address
family from AF_UNSPEC to AF_INET, NFCT_Q_DUMP function works.
Otherwise it is failing. Anyone know the reason for this?

Thanks & Regards,
