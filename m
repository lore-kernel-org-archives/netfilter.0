From: Max Stritzinger <max@lambda.mu>
Subject: iptables MASQUERADE considering route source hints
Date: Tue, 11 Feb 2020 18:23:09 -0500
Message-ID: <CAKPFKCt1qP47BNzAdgTk7q5YiSFycGXyuc3ypbq5ovraSYexwA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lambda-mu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Cquk/hzoOqvHY+r7RNcXVReY35KuBzoBdVaYpLLd2LI=;
        b=v3Cv5JPsUllZzIE9p4clCR3hEDaqu0y7K6k9fqrIO9YFslnVLMxIxf8+xJjRfvkptE
         BAijuITxHF60xgD7+VR4KXOczv6rZ5NXsM3tn4HbkTSHOTpM0xIFRwWLkod0a+B1cJJ6
         l4/k3gZqy64EsR3+HMLsfjGUoFCTHumONd98GATApqaa0YwnAotqMic1htBRUIMwFdCU
         D3jvjJKD5KvIu34ZIzSVzrbjyCB0gKMbcHk5G5YDW8jEVrJOthdvws2GvWGpWcOMzngJ
         V570HSE+VrLX0W7lakDfTO/m1mPJCoLhsYzvL3hrrrH5nasCsqMFtMpus1yy2MIsFtaM
         RC9A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

Right now when selecting a source address to use for MASQUERADE it
looks like netfilter uses a different function (inet_select_addr) for
determining the source address for the traffic than what is used in
general for IP traffic (ip_rt_get_source) which means, for example,
the use of route source hints is not considered when selecting the
source address for the MASQUERADE'd traffic. I=E2=80=99m wondering if chang=
ing
MASQUERADE=E2=80=99s behavior, adding an option to run the other function w=
hen
selecting the source address, or adding another target with the
specified behavior has been considered as I think this would be a very
helpful addition for certain use cases and is likely what users want
as a default.

Max
