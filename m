From: arunkumar velayutham <arun.softtech@gmail.com>
Subject: ebtables rule to forward the frames to specific interface.
Date: Thu, 17 Sep 2015 17:34:47 -0700
Message-ID: <CAH21Whgc5QX7TyUF7MzPNJs1B_qPRA2ir2sJaH3uNok9zvdaaQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=QXitaRPC60otUUec9QA+TYnKIFc5cYr0Kj8JvV6iyoc=;
        b=jvdQvzyoeiL+vh0npCg7i0+K6JYj/46Y+wUYgN4hOWxmROJ+thVd7HeLfc5AUKFsKJ
         AV1JzT/g2tUlRlC0gGApxn965bVkeF3DUlPzSFdLzWuPSNwyjh26eUFtEWHdWuoQwevS
         AzIwtE+YwtEUscj87hyfTRbPsU3fL8uHu+VPp4PTamXuWLKi4wgglf8AMK3MFP3VenhK
         ly+VopBzGXwvbw8LtDwSIY1UhbqsF/BjEVdH16u18nD8HWK6FUIlsIBD6i1dYdnaYRRm
         yot7wnE8Bs8Gskf4lXCSl9fCut8zUrNv3D87vI15Y1C2I2Ma1EPRM6GNCZOmDoNt4HLL
         OGuQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm relatively new to use ebtables. please give some suggestion on the
below scenario.

Frames arrived on any of the interfaces (eth0, eth1, eth2) should
always be forwarded to a specific interfaces eth4 all the time
regardless of its destination address(at the L2 level). for example,
the ethernet frame arrives at eth0, though it can be forwarded to eth1
to reach the destination based on the bridge table, it should be
forwarded to eth4 all the time and the device connected at the other
end of eth4 will decide on the routing.

looking for a suitable ebtables rule options which can help in
achieving the same.

--out-if or the redirect option will be helpful for the above needs?.
I tried some thing like below

ebtables rule to mark the frame (using --mark-set) with specific value
per incoming interface and with the further rule, I tried to retarget
the frames to eth4 using --out-if option. But this didn't help.

Please suggested on the ebtables options for the above scenario.

Thanks

Arun.
