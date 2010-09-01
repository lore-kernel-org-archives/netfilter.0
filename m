From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: rate of traffic that mach a rule
Date: Wed, 1 Sep 2010 20:55:02 +0000
Message-ID: <AANLkTikGf4SoTnkSW_0QtusAzr-D5xZXQ61UVxojiSPc@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=C6hG8gpJr17KI61zFbA7Mc9DzFMuUMlhGjQdR/lxWBg=;
        b=Oj9LHibmjy6XgvbZBMop11/TjeE3K7zSiBjHTT5LhSqHEj+IiM4DoY86QozZqCDz9L
         2i/+fET/302I17kNHFwxr3hfyOQwPfR5SMDDxm8I1OxJPu+zHZ8ISBO+8XAYq2HWg9Do
         mi4xQLcEOj16KLyM62AIs+l4jgxjoJ9bwkBAQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,
is there a mean to know the rate of traffic that mutch a rule?

for exemple i'd like to kow the rate of traffic that match the rule
iptables -t mangle -A POSTROUTING -p TCP -dport 80 -j ACCEPT

regards.
