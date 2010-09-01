From: =?UTF-8?Q?Mamadou_Tour=C3=A9?= <e2ia.ci@gmail.com>
Subject: rate of traffic that much a rule
Date: Wed, 1 Sep 2010 20:54:01 +0000
Message-ID: <AANLkTimSaMMtDxUjQhOcMtoJN-xyioiUxMK3GvUJJ_au@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=C6hG8gpJr17KI61zFbA7Mc9DzFMuUMlhGjQdR/lxWBg=;
        b=PjZ+5q3HE7epC9uGUs3tJAZo5/3L9IFFSfg5Ay3lQaP3B6K8dAdJ2HsRKTqWV+Tx8o
         9jgAeW+tAu1VxN5E7pta6ItrLs7ZFNUyYrr3FeYICMDklAWxEsIebM94WHYaeeZ0F7qT
         Qdfzg4BamyeaQt0ywbCWJgbGccwYwRsbtHlq8=
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
