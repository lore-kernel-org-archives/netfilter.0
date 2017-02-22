From: t t <eeweb90@gmail.com>
Subject: Subject: iptables: nf_conntrack_proto_gre.c and support for NHRP
 protocol ?
Date: Wed, 22 Feb 2017 12:22:01 -0500
Message-ID: <CAP1xz+7Gc7doHmDim0MEkQyz77Y92=YtEifw6vueTKFMY-dnaQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=+nYvBmlAbAbtmYngvSmsJmFmClIIFttBLIZesY48jps=;
        b=bsCGyjqAJnSu0m4yqcbpX8qdDhrHAHHYwpt7F5K1G9AxlJi+8O9XHDLQTGnFx8rGO3
         3FYtNQo0VQqyOZ7BcYiD1sVCdVPPpYSvvKi/o/O1LKxunkdvVP/AQulIcbNUh2ff0xHG
         3ujpdJw1oV5fSwOudl5nEXZ64l2/0Pa1koyWh1/fbHIeSZlf/Df/oJqMu8ltYdxH7rHR
         +ZJiIGNydv72pJ2s3h1xP64d80h6rIaPgTm+RzAW+yKIODJ2zn6vYAn7XQqSBX47LmzS
         2mb8wnSncdy2ofhYpJldR5R/wrEIzGQBXbSguJRjavBESnPDB6tXIOU3dM5I1XTfcjl9
         z5pw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
Can you tell me if there is option or future development for iptables to
support tracking multiple GRE tunnels through one host when:

1.    We are using NHRP (protocol 0x2001) to establish a GRE tunnel (ie
NHRP Request and Response packets).
2.    We are NOT using PPTP.

Thanks
Tom
