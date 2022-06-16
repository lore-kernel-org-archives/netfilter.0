From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Support for String Match Blocking in NFTables
Date: Thu, 16 Jun 2022 20:20:14 +0100
Message-ID: <20220616202014.e7ebc6df8f8f0f1fdce27e12@plushkava.net>
References: <CANKwiJVSW3RjhHDnziGjWenApAcvdSAqBTi7MfHqyiyHd4_F=A@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1655407216; x=
        1655493616; bh=pgds9aDkyaZNSiFLvIx5nASHgek8LOIAZbDnde+txhI=; b=a
        bqWtsBq43PP6Nyeq0IOgspWKDiDWMov43nEamxADCDKFBXy/ljGnNNo+BFRS3ABw
        P2/wAR9obq9sDB3T1W72ct9K+kWtn/IYpokeLYEQCZKhLSgY73PZGdzu5fnqbDvI
        iAnHcs9i5WxXSCg+hMSZapgathesZthWFUaP0jLGICgjSBqeAKmBCHJ2DNtmiWYg
        DH1TVDF3l+KPUSGNOj5YtTGwN8oV8U83IrceacBCXjSPV56G3Resj4jWhGqXg9KF
        m412ddpeY0/XZd1onM/XyKwp210ZYBv9mMP+np0+6L/BYNHcTsCwqYGsu8XHDZyx
        ++WMehP/2PZMlHnorxJmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1655407216; x=
        1655493616; bh=pgds9aDkyaZNSiFLvIx5nASHgek8LOIAZbDnde+txhI=; b=F
        M0fmWH7mpHDIdj+KTW73BaRCDAuI9u9tBJFXOjFsKQ/GiMnZkqC/SdtLve/FQf7Y
        2YeCyxgRjmo7eNIoioiIIYg4dIRNu5Kav2sJnv2+7uzKT600D63ILFIRsyuC6KMM
        NAxFhpG5xsEuf85n9+JUmge2fyw10gZtXHLVTh1KN80KEo4NXnLfKfGLIyP9HLnF
        WKsqiDlrvmuBA5gYo12Th/CkuA10IsIJFlxvH8ZQvDWsID6oJv0uHiZJAhZjp9Hy
        ctYJAZ6fPDGNLedbiKxlPQfJh3it/o6I4g1YLssWC2pmhh8t406pP29Z7OOXRYq1
        SAeSPteJPVVg2Q9xi1ATA==
In-Reply-To: <CANKwiJVSW3RjhHDnziGjWenApAcvdSAqBTi7MfHqyiyHd4_F=A@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gmail Support <testingforadept@gmail.com>
Cc: netfilter@vger.kernel.org

On Thu, 16 Jun 2022 10:15:55 +0100
Gmail Support <testingforadept@gmail.com> wrote:

> Hello,
> 
> We recently migrated our servers from RedHat to Ubuntu based systems.
> We used to have an IPtables rule that was blocking packets matching a
> specific application file and below was the rule we had deployed.
> 
> -A INPUT -p udp -m udp --dport 514 -m string --string
> "someapplication.exe" --algo bm -j DROP
> 
> In NFtables, I read in the blogs that string based blocking is not
> possible. In the man page of Ubuntu, I see a note "The  string  type
> is  used  to  for character strings. A string begins with an
> alphabetic character (a-zA-Z) followed by zero or more alphanumeric
> characters or the  characters  /, -, _ and .. In addition anything
> enclosed in double quotes (") is recognized as a string."
> 
> Can you please confirm if string based blocking is supported in Nftables.

There is no equivalent to the string extension in nftables. While it is possible to match against a portion of the packet's payload using a raw payload expression, doing so requires that the offset and length of the data be specified. That is, it cannot search for a pattern and, thus, match at any potential offset.

-- 
Kerin Millar
