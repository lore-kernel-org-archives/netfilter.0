From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: [ANNOUNCE] ipset 7.6 released
Date: Sat, 22 Feb 2020 20:34:40 +0100 (CET)
Message-ID: <alpine.DEB.2.20.2002222023100.8763@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        blackhole.kfki.hu; h=mime-version:user-agent:message-id:from
        :from:date:date:received:received:received; s=20151130; t=
        1582400080; x=1584214481; bh=KRHpkErE98Hx1o6eOkjgj94LQQREXWDwyRH
        H20BnE/I=; b=uWIoq9DIkL610S92oGpf27mRv90bYCT+8Y8bqFs7r+hsqfFxCFx
        HkAk81fDqVF1JHzXqvV2cqfOKm0jYFda5oRtcKfmnns2mPteKP/IdZ9JO+FSQ4Dl
        NnjNUpH/Tmt9ejPtACc6pGafi/WiAeZF02AOiIf9fQXgpWV8KEwcqM04=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

Hi,

I'm happy to announce ipset 7.6. The release contains mostly bugfixes 
uncovered by syzbot. The fixing of "INFO: rcu detected stall in hash_xxx" 
is resulted faster add/del operations due to the introduced region locks
instead of using a single lock to protect the set data.

Please note, the oldest kernel version supported by the ipset package
is now 3.11.

Userspace changes:
  - Add checking system_power_efficient_wq in the kernel source tree
  - .gitignore: add temporary files to the list

Kernel part changes:
  - netfilter: ipset: Fix forceadd evaluation path
  - netfilter: ipset: Correct the reported memory size
  - ip_set: Include kernel header instead of UAPI (Serhey Popovych)
  - netfilter: ipset: Fix "INFO: rcu detected stall in hash_xxx" reports
  - netfilter: ipset: fix suspicious RCU usage in find_set_and_id
  - Add compatibility support for bitmap_zalloc() and bitmap_zero()
  - netfilter: ipset: use bitmap infrastructure completely
  - netfilter: fix a use-after-free in mtype_destroy() (Cong Wang)

You can download the source code of ipset from:
        http://ipset.netfilter.org
        ftp://ftp.netfilter.org/pub/ipset/
        git://git.netfilter.org/ipset.git

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
