From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Reload IPtables
Date: Sun, 27 Jun 2021 21:12:58 +0100
Message-ID: <20210627211258.8f8aa45882f75c88aa689424@plushkava.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
        <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
        <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
        <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
        <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
        <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
        <20210627191107.79ca63b9cf4dfe9028649524@plushkava.net>
        <227edb33-b86d-2310-bc63-c6d903bea95d@att.net>
        <20210627200752.694217a849963715fd782049@plushkava.net>
        <b18dbd3a-3154-5f2e-20ea-2df5f787f33c@satchell.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        f/yS82I4DJNXw8KHYw9F6FUTrz+kBNnxeSpHMFziGBg=; b=HyGfJ09P7TUqpQX2
        4Ab3mEQmpta8IzQE5NQ1uCeoG/ot0ciYC3MQ9wcniNrWTqONJ9lhYhM7j+FeYw2P
        6dJL/7UZIX7JGRJdaH+NkVJiG4J/gnVVVqB6G/PFgsbtSYZfSs1E5oy0FVzAo8sB
        yE9lriWI2YENUlS1aPE3RMVEOocNOX/iydBjMNRNDScQeqJA1j0QJldGKRWeXIyW
        oPEq32Rml8Z5jPWzt9VYMATDoJwV5ZPwOusxRSC8lV0Mr4mnVnrnDGnMXVU0S9bp
        PLFacFSzzHkAGYrB3SidtonSkHWYF2AuMSaNigbkaSg1Lf+yC6QC//bGpP2h6bTr
        gJCKJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=f/yS82I4DJNXw8KHYw9F6FUTrz+kBNnxeSpHMFziG
        Bg=; b=pm/VfqosagZGrqM/XigLv4gCbE3PsPjfm9tKtWaJ4mKvfblswCiq11BoX
        42mSDVQco+ovNZY0DqUzqI6J1+XBqKnA/+wwWYqeNjwYbSAR+ab8KWuQhd2sL2fc
        qnvshBBpCiHDo33gcVtmw5Bu85KVrMIvmdDEbYJ0ajjLKKywmEKWeHpIrS2mvPy7
        xxoDGHvTLm91TnDPFZIM5lHTFay74qJRUigrBF01QswfkBNcqBOOa1vci7QAbKuF
        RuVOPYp4i8S+0eMBXtteoDtDfskvHHMo1rr8djZUq6FVnPG90teO6J6RrB3syr8J
        z3HwWeFEt6+QuX1VzO/PdlLdaNrmw==
In-Reply-To: <b18dbd3a-3154-5f2e-20ea-2df5f787f33c@satchell.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: list@satchell.net
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

On Sun, 27 Jun 2021 12:56:18 -0700
Stephen Satchell <list@satchell.net> wrote:

> On 6/27/21 12:07 PM, Kerin Millar wrote:
> > Use of shell redirection is optional in this case but I would caution
> > against making it a habit in conjunction with the use of sudo.
> 
> I believe your statement is not distribution-safe.  Red Hat's 
> implementation of ip[6]tables-restore does not implement reading a file. 
>   Ubuntu's implementation of ip[6]tables-restore does.
> 
> This observation is backed up by viewing "iptables-restore -h".
> 
> That said, I suspect that Debian would use substantially the same 
> version of iptables-restore that Ubuntu does, so your observation would 
> be applicable.

Debian 10 was mentioned but yes, it has not always been possible to supply a pathname as an argument. For those with an older userspace, the problem can thus be avoided by simply running `sudo -i` to obtain an interactive root shell or by running `sudo sh -c 'iptables-restore < my.rules'`, among other methods.

-- 
Kerin Millar
