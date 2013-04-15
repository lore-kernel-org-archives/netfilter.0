From: =?ISO-8859-1?Q?Bj=F8rnar_Ness?= <bjornar.ness@gmail.com>
Subject: Re: cluster match and ipvsadm (not connection tracked)
Date: Mon, 15 Apr 2013 16:12:10 +0200
Message-ID: <CAJO99Tk-wna+oP43Kgckj1m1UpWp+HVbABrgUr1urrw80Z+zMA@mail.gmail.com>
References: <CAJO99Tm4q3+RWheV9q9psvQ6dtL7sRLihGKA6w2epPEAKUVbfw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:content-type;
        bh=m5FPTQgHBTbTzLYUEW8DYv2zWL0/p+bKjlAL2JM0p1o=;
        b=j1nIc3cQko8M3vtCl4I2aBNiSe/meMR3PkwJQwC8+wodY64+jm4q+dvZU2wDVqdQ+u
         Bf/tjJagdokCj1gpnHA2BCNcz/hwlb+Idbl1PrOz2KzFrTkuYhiAm+m93QlYx5kmGPNs
         cSkKX5jV3sjkz3Bv0v8TmvOoLL/yqNj7P2CNfjdWfaJnAfJUsWaZkuzkl/0NhpJuVHjA
         1A4ZHh99S3H9XNJT2AqDBmYGTyFe/31MxsAm7fiE4Az1v8ynjhZqY6k/zzdWhlMqbOlf
         SU6EGiEJtXJzNN5EBjiNJyS5xctY/QRqYIQAvLow4Mj6iEYN1XV3OP3X8OXJU+XOyXY8
         lWIA==
In-Reply-To: <CAJO99Tm4q3+RWheV9q9psvQ6dtL7sRLihGKA6w2epPEAKUVbfw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Seems I found my own answer,

net.ipv4.vs.conntrack was 0, setting to 1 has so far solved my problem.

--
Bj(/)rnar
