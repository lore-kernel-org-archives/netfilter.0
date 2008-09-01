From: "Bosko Radivojevic" <bosko.radivojevic@gmail.com>
Subject: GRE keepalive support
Date: Mon, 1 Sep 2008 12:32:56 +0200
Message-ID: <d6c8ef150809010332g4760d893wcc09188e02ed2a2f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:mime-version:content-type:content-transfer-encoding
         :content-disposition;
        bh=wCFSwTwQJ0maa14buX9l/Mig3bWfNCMpQn9zmIe5seU=;
        b=DXJ4Sat27cNNRe5zAYhGq3kYXjMmLTNNOiG19BeznA7IZ7IiePkJpMX/pVn3iqo+os
         BqoEvk3NLaEOBerGpiYPec99EqrPlM/HX8wg01k7c6mxhYGbycOd2K3U6XTn8IxzI0OS
         t/LbNZwZBmKhv1tuZbZt+EDc78E26wBBwx948=
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netdev@vger.kernel.org, netfilter@vger.kernel.org

Hi all,

I hope I'm sending this question to the right mailing list(s).

After a few hours of googling I realized that there is no support for
GRE keepalives in Linux. Or, better to say, GRE keepalives are Cisco's
"proprietary" feature.

The project I'm currently working for needs GRE keepalives on Linux
side (besides possibility to run some routing protocol over GRE) in
order to have "link state" information. It looks implementing that
feature on Linux is not too complicated and I'll give a try. Are there
any obstacles I'm currently unable to see? Maybe there is a reason why
GRE keepalives are not implemented? Except lack of detailed
documentation :)

So, any comments are welcome.

Thanks!
