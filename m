From: Vladimir Ondrus <vladimir.ondrus@gmail.com>
Subject: Fwd: conntrack full with TIME_WAIT on tcp passive close site
Date: Tue, 7 May 2013 12:43:49 +0200
Message-ID: <CA+WDh76FhX6X9-usnePNuTCgbvB4joxFj+HKOqbov1u0HPY5QQ@mail.gmail.com>
References: <CA+WDh75vQ1yPeM8KMPhs4yKgK0apeVUvmvTPUxFjCgcKp6P0qg@mail.gmail.com>
	<alpine.DEB.2.00.1305062326060.15721@blackhole.kfki.hu>
	<CA+WDh76tvpAT1Zb8NAGEbGrVBhb+W7V0DnF7Dp21dZw0sx+9uw@mail.gmail.com>
	<alpine.DEB.2.00.1305071150260.16401@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:content-type;
        bh=JGWs6rb6Ve7At5Gdlm6YP5yghsKc7GJFEuxCKN8MCdI=;
        b=gm/EAAamu+SsUEwTxsgDbzL491hOUDwDXhdk71MPGw4eAYvKylU4T9jXYp3qdBG+t6
         Q8oNpfAfinkA2+vPSrW8ytIKT4sWHN4N2ldhuwGpfmCPPDaR7Hf5tn9xCadiTVVWss0u
         +vAR2Epl4ww3WVUc/+yswCGJQne5ajsegfjVYK+Xci5RYpxureDxWf3X+QVpw3L8sovT
         1JKiStjteyKk1U3oznJHofvW2mDmkdTvg+ky2eJNvMEntXuDk/QnV7vMoVsUkiBSU7zf
         Wj6SZ0es8EfGwpp0Ji9dgpXY+y/EVHsFgqVxFqCj3pcIkHMGuiXXn+wIFxXaJSG94Eu4
         G2xg==
In-Reply-To: <alpine.DEB.2.00.1305071150260.16401@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Conntrack "sits" between the two communicating parties. It has no
knowledge that one of it is the same machine it's running on.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
