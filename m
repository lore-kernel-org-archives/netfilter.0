From: Martin Gignac <martin.gignac@gmail.com>
Subject: Error when using 'time' statement in nftables 1.0.2 rule
Date: Thu, 7 Apr 2022 22:19:30 -0400
Message-ID: <CANf9dFMQO4mHXFd88BHL5u9BWyp-v-Tu2L6x_oS1OdMp8UrhhA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=3hnd+m7/FhQqBY15RA98TFD9NiIyd2f5OMWSct7LaMY=;
        b=G+4TjGBL3Thk/GskDfsbQQCVO8N+OSvCejoOWnihubADcDtzLPV382Ii0gMqqGdcKo
         4NOVna0EgjbDdmxysBYC8gaQFfZ4xS3VszCyBR0UL7KXAeC6eTxJdeCe3omEqNHgibKJ
         p7f12HTl5jbEwdRhQ75tTZnLyn+gDNnQdykGRKWqEJFtY5nFB9CCO1bAAxLrKWa4PhHg
         dXq3uO+JqhIqu0j0kmKzp9fDemOiyo3KTzHNx41rJp8bUqRmdsVZ/2IVnaM2bqm/jc3V
         cU9DVTQfalXK3x/reMQI2HGtfMDI6KDOqh2K8poWuM0kWZvmWYbaFzftQm+h6TYTFNf9
         4Dmg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

On nftables 1.0.1, I can run this command just fine:

    nft> add rule inet filter input iif lo time < "2022-07-01 11:00" accept
    nft>

On 1.0.2, however, it gives me this error:

    nft> add rule inet filter input iif lo time < "2022-07-01 11:00" accept
    Error: No symbol type information
    add rule inet filter input iif lo time < "2022-07-01 11:00" accept
                                    ^^^^
Have I encountered a bug, or has the usage of the 'time' statement
simply changed?

Thanks,
-Martin
