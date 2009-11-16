From: Cameron Smith <velvetpixel@gmail.com>
Subject: Help deleting a rule
Date: Mon, 16 Nov 2009 13:39:38 -0800
Message-ID: <edc0e50f0911161339x1ceed507vc4baffa428cad1b7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=/+xn4RAr7EJ8iI67kUehDAKEGsnRYOlJVr1CQFHMDQc=;
        b=T5mBiGTJ0KHBp0KgXePdJMLV94ouJqM05UuzXRAsaQ5oIpXdXIk5E2u1bMQfMevxqk
         Fa7BDo+gmoHRuKmOVHZoo6WT1O9m9affznModO/cKnLM3YPbwJVIlg36itw6uy9CecEu
         0kDZNuja+TQ+UgrKt0fheNmjge54OYTInnkf0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

If I run:
iptables -L -n -v |grep xx.xx.xx.xx

I get:
112  6272 DROP       all  --  eth+   *       xx.xx.xx.xx         0.0.0.0/0

I want to delete this specific rule.
From what is printed above how do I know what line this is to use this command?

iptables -D INPUT x

Where x is the line number?
