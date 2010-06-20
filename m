From: Pete Kay <petedao@gmail.com>
Subject: newbie question on netfilter-conntrack
Date: Sun, 20 Jun 2010 19:41:59 +0800
Message-ID: <AANLkTil9wrgMngn6vFqKeh-WNKkEmwCXYJx-lGI5RAu5@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=69A4ZKJwuhrFloeNmDXok+py1t3B7+7Og7gVL4wGyWs=;
        b=vEutArFQHbYyjk5cG0S62SVJtL+/u5lqmmIhP9QAliwEe7qw6UzNRzKZ6LUMTGR8zO
         BEZP1D3NNlj9xaFBJ7Hy4mXSm3VfftNWysEHDpIDXQ3HhW9P26faO1z7ZAng9agS4CEv
         uJocDTjDXUdWB+85INPSE2x5PVcxXdTCqZUsM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am new to netfilter-conntrack so please excuse me for my simple question.

I am trying to set up a rule such that any UDP packet coming from a
specific IP:port will be redirected to another IP:port.  Could someone
please give me an example how this can be done?

Also, I would like to know if it is possible to monitor the proxying
of the UDP packet to obtain information such as jitter and packet
lost.  How can I do that?


Thanks,
P
