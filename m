From: b38911 Zxc <b38911@gmail.com>
Subject: Correct usage of nf_ct_get
Date: Fri, 8 May 2020 10:10:08 +0200
Message-ID: <CACWCkhDssWGr3qg73T+Ft_f8jWDaA7wway=so0URwiDRK6hiTQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=MEPx9OZpYC5MR99JRZhnc6eFa/OtpMpGHJnrSuQ4dXg=;
        b=iRmO2b8v6sRxGiveeOjt52tOrl7EpwNXU5rOCl9FyNL/K3hYMGg42mCh6/aiPuCTbg
         PiTzi6WJ7lY98E/jzuqHlzunYRJ83fSt8WljVnQzTM2FpfDbQICRH9fmGVTVf8Gcz5GT
         zS7Vl7+sHOpJ5MqgZsySGQRCU2BXnY8xcUKJS4KGZ6SsYCOnTiI9vUbFHnWZ0TeApIU9
         FCzvT+mj6MG8ETEPBudnKAXTqraktWyfaHk2/ptANh7cxFjfWEq2iPdOid50NbKpgCGt
         Ss1PowZsMbsql0zZTqEnq0TKf339e+QrvzRBg8B64lhoRRQbzm0b96Wb3bZO7vhoyfDS
         i87g==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a doubt on the correct usage of the conntrack func "nf_ct_get".

I'm calling it in this way in my netfilter, to track UDP traffic:

-----<Code snippet>-----

      ct = nf_ct_get(skb, &ctinfo);
      if (ct == NULL)
      ...

-----<Code snippet>-----

On some systems it just work. In some others I get the result as NULL
until I do something like

# iptables -A OUTPUT -m conntrack --ctstate NEW,RELATED,ESTABLISHED -j ACCEPT

I understand that this is due to some module missing. My question is:
is this the only way to do it?
Can I force this programmatically (or by loading/registering specific modules)?
If I'm not wrong, the modules insertion is not enough to get this
working, an additional action is required.
Thanks a lot for your help!

CC
