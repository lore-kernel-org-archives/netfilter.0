From: Edison Figueira <efjgrub@gmail.com>
Subject: libnetfilter_queue quick question
Date: Mon, 12 Jul 2010 13:00:28 -0300
Message-ID: <AANLkTinrAZdXVZhULjFkkDnEyiwo--NpwYWWc5eNLGfB@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=9rox9igL9185kpQ4NCfmsUNWyI/Z6xZbRZTJ5Fb+MYs=;
        b=fbgFmDK8YJF94gT/L5qSEE3gsTiZoLwV4qs9WOGamlQjEsLSlfbfz4RL4MtEa+CAIb
         Oix0oVFpMOQtG+gZp04JxzrswMbSyCXZRWVmNdpxWMaPghYH9ui7TjjR8bgfq9plE5XB
         QrbKFfYtAObTSrnW+fOdEttrR8QKnKGpMsVyg=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
Quick question,

The absence of the verdict like <RETURN> on libnetfilter_queue is because it
was not implemented or is not possible to implement?
Has something like of <RETURN> what can be make in the queue to have this
effect?

I appreciate the help!
