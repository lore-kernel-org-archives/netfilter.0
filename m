From: =?UTF-8?B?WXVjb25nIFN1biAo5Y+26Zuo6aOeKQ==?= <sunyucong@gmail.com>
Subject: iptables hashlimit question
Date: Sat, 9 Jun 2012 11:33:31 -0700
Message-ID: <CAJygYd1qba-vxbCqtBB2k_XrL4GSz_ysDrDOJ96VSk5uCbo7cQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=ndqt9wquQaJYIzvtN3lm/cE2ReMJqHipDE2zcNSoNhI=;
        b=S68abR/EXlBQuFzjD+nVJAzzOtzN9/udfF5YClS8y/JJOCtJjZnq4Ba4roa2kEjGrE
         N4WYcfiaCX3UvHAxz7Co3IHtL1yKBNISYR/WZhtY3awor+uALDBnvKvXK7obJXvYAfnf
         9ZW7RJheu2a7U4+Dg79qqzbGmQ3lfK77AdDbOc3xtXyS4iTIxVcAmp+rcEv8baiZyCam
         7zF626c0NiU9gonOauFQyhB+4zii1cqygNaXegEpvW90q8BApt4cbZhKCmDcx6wj0Gl5
         vijIUqYIlPmueil4rQNE/SVdFEOvqM/rO5ilUhPJDhmSzpHuXQAG/UzMQ74oH6Uh8kJB
         3alg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

I've been trying to setup hashlimit on a linux (as a l3 gateway) to
limit the pps per each IP, i have two questions:

1) for performance reason I have marked all traffic forwared by the
box to NOTRACK in raw table, would that affect hashlimit in anyway?

2) (there's only about 200 ips total) I found out when I =C2=A0use this
iptables -A FORWARD
=C2=A0-m hashlimit --hashlimit-name limit1 \
=C2=A0--hashlimit-htable-size 4096 --hashlimit-htable-expire 60000 \
=C2=A0--hashlimit-srcmask 32 --hashlimit-mode srcip \
=C2=A0--hashlimit-upto 100/sec \
=C2=A0-j ACCEPT

it still drops quite a few packets even thought the rate is well under
100/sec, then I found out if I add

--hashlimit-burst 100 , no packets will be dropped anymore (it appears
to be working correctly), the doucment is very vague on this burst
param, how much should I set it to if I just want to limit packet at
100/sec ?

also does =C2=A0-hashlimit-htable-expire affect the rate limiting?

Thanks.
