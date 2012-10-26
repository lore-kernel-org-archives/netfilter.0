From: =?UTF-8?Q?Csord=C3=A1s_Csaba_Ifj=2E?= <cscsordas@gmail.com>
Subject: Status of iptables target support in ipset
Date: Fri, 26 Oct 2012 15:58:21 +0200
Message-ID: <CABpXQ7aX_LtYxP5UCo454-V9yu07kc8BpUBesCWy-4V_2ZqRvw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=Gsxj4XDzEQpFoAr1TSWh5muRYkVlmjt6YQ/VK3Qfzv4=;
        b=Bdt5ayb5eUIj/dwKhVzK8oEVcGUL4tkcS7cRgwb4wpJoDxb+Cqj+/woSdbg5ODpqMi
         q0v80utQ1+WeDFOD+xr+Qo8op/1p1ikMpP+iStrN3+xSapG5Pg3SIu0TAbKOtY4ts8sk
         YsXCiizzTu8GsEWHht2b8zE9kqEmtRcFWIfZpzfaYFuY4tJ5E0KsluRbaRiLCFng+tGh
         AkX+ifGKu6KxncpzmfVKjC/FxEMoIDo2S6oxIHd7LVOxOAcf7oT/H35bB2TazeuOSubO
         T13gyM6IgzlIthVFiPfx6+5cVO1WY/faoq70ffoDgj3s9NIAVizsYxNAsHyXPxr1vaXW
         +omA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

Dear Reader,

I would like to ask when will it possible writing such rules as
mentioned in $SUBJECT.

=46or example:

ipset new foo hash:ip
ipset add foo 192.168.1.1 -t filter -A FORWARD -j LOG ... -t nat -A
POSTROUTING -j SNAT ... -t mangle -A PREROUTING -j MARK ...


Sorry for my bad English.

Regards,
Csord=C3=A1s Csaba Ifj.
