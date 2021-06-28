From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Reload IPtables
Date: Mon, 28 Jun 2021 10:43:10 +0100
Message-ID: <20210628104310.61bd287ff147a59b12e23533@plushkava.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
        <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
        <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
        <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
        <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
        <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
        <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
        <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
        <96559e16-e3a6-cefd-6183-1b47f31b9345@hajes.org>
        <16b55f10-5171-590f-f9d2-209cfaa7555d@thelounge.net>
        <54e70d0a-0398-16e4-a79e-ec96a8203b22@tana.it>
        <f0daea91-4d12-1605-e6df-e7f95ba18cac@thelounge.net>
        <8395d083-022b-f6f7-b2d3-e2a83b48c48a@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        pHorBr/r1CzHJLtfbnPaiwkb/j3EgRv98w7OQdU+K2o=; b=Q5QyfU+EboFE+OKi
        ZwSk61TX59UOelUMuRFOwCkLMBUZ/4o6/XimeS2qvTjzVB/5iNk8rXIsLtnUop0V
        XiRH20BJ9mXNkLk/Sd2rXeSUuHneg5JOL3NxSxI476JrCIXxoj9j3Nnhe0kZnv0K
        /crM4znaroDA/w9Eu4dKj5ezgwIKHSrD91igNEcO9dGA/K39rnf1KWYJB/AnwL8M
        995EL1PX7huLY8eWGetH90P6Fr1IotMV4HbR6JYj6mYFp/NZ7Phzw5NjuOejXsKp
        sd5XnMsJCsIDz2TrofLvun2s8/uO2OLJlAfFNUrlUr2rRt7Z9ax+zEuyZqJltiyv
        R1C58w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=pHorBr/r1CzHJLtfbnPaiwkb/j3EgRv98w7OQdU+K
        2o=; b=qag8xGg5VgZgPseeMenbFju2hX/ntKl+qyWrAM6JBDLjdwHVYeVFxyaAp
        IpSEeDJIjILanO7mPYEjuy9ug6G4GUIuG+YvFofOnG/o/NWoRZRO8rhiVgMiqw2p
        o+n2knjC8kbWNB71Bqo6XDP7tIRi2WOtuY5DPIEiL9RwCuV47wmNbhNc2xX/hYjl
        5LzKxxxB+hqdf3M5H8E5oRIh1RWTcm4t5TCPiNgIAWF4xWgKdSyqRKPRB/VuUlqA
        jKryKgAfwaxFrqWbLg7OLgxvbl0fvaLTsknbf7Cly4wLS49hBidQFprTTtDYsEnE
        qNwyhtCZlqEepawuZQj0NTHdeatcQ==
In-Reply-To: <8395d083-022b-f6f7-b2d3-e2a83b48c48a@tana.it>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alessandro Vesely <vesely@tana.it>
Cc: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

On Mon, 28 Jun 2021 11:23:36 +0200
Alessandro Vesely <vesely@tana.it> wrote:

> I left old values commented out, rather than deleting them.  I try and use the same names for shell variables, names in rt_tables and iptables.  Device names differ.  I annotate these cross referencing in comments.
> 
> That way, I can then use shell variables in iptables commands as in the next snippet below.  How do you handle renumbering otherwise?

The desire to expand shell variables is not a compelling argument for eschewing the obvious benefits of using iptables-restore(8). Consider the following.

iptables-restore <<EOF || exit
*filter

:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]

:eutelia_in [0:0]
:externa_in [0:0]
:fastweb_in [0:0]
:interna_in [0:0]

-A INPUT -i $interna_if -j interna_in
-A INPUT -i $eutelia_if -j eutelia_in
-A INPUT -i $fastweb_if -j fastweb_in
-A INPUT -i lo -j ACCEPT
-A INPUT -i tun0 -j externa_in

# and so on ...

COMMIT
EOF

Now you benefit from atomicity (the rules will either be committed at once, in full, or not at all) and proper error handling (the exit status value of iptables-restore is meaningful and acted upon). Further, should you prefer to indent the body of the heredoc, you may write <<-EOF, though only leading tab characters will be stripped out.

-- 
Kerin Millar
