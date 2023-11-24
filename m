Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hudson-trading.com header.i=@hudson-trading.com header.b="cUtmkiaZ"
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BFA19A2
	for <netfilter@vger.kernel.org>; Fri, 24 Nov 2023 06:57:21 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2854757f0f8so1653167a91.1
        for <netfilter@vger.kernel.org>; Fri, 24 Nov 2023 06:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hudson-trading.com; s=google-20201111; t=1700837840; x=1701442640; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ejwPjHprmGW9Q7eearkrCXpKSxq1rZCAQgITWzeeMNo=;
        b=cUtmkiaZghC7UnoHRyiGmTDcRffdcvwIAxegHOpj/zHiRTLQ545GzFz5IycoF41A7c
         vgKVkKodK5rSGROp79sMSgf7ruimPRrvg59MEiUtHO4YDWaEX9bRDKe+NAEG6CkUOdOT
         Wzv46Y2ObL1BVWWf86iZxtUwso8YsEnVdAKDimmB0rZkVQ+hFHFusZE9pnx7BKXB5DvB
         Qn2JxSCF/OSbnvhNf7aqoJSXKAIa2nlfj5fhLlsDiBtOp9qldiGloIBBWE8+d4SslGQn
         wTdd5lCJAIRx8CVpjjPRFTqDYeLUOkiOE835P8kvDg+oop9gdnbkxYpGbMb22BGnlQr2
         Vhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700837840; x=1701442640;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ejwPjHprmGW9Q7eearkrCXpKSxq1rZCAQgITWzeeMNo=;
        b=AknKIb9DnrwOWswNVwB++20VgBJ3HjJGe2078mDsl/y/ahDM7r+eEKaEDSTY4ZB6I5
         kD2GND4WFLK/SMXDGjUvJqsLKT7ay1UXAZir8MlY/Ct8KUiZvi3E3yCNAqdg72vA2KtC
         M37/vMy/XlGcv9h6VmkMan1SnEQYJVEZka7rCvf7xm3NSFYj68aLm5X+mZc1R8623owj
         uTjdg3GX3INTo2IjgEPAYmAQb2r8rQri9+w33Hm4DzdDeLHREyPZozcUDDN+Iuz38ENm
         kAyAQpzlq00OeLDwByjP1uSdZ7c3AFUUG25HHKoboxrsgQGwRL3dTMbmbwu2MEeieh2g
         yc3Q==
X-Gm-Message-State: AOJu0YwNh1GX9fHZO2H2A0ZCLXF//nejPzZR/efbAjJO62pHFXaL0Sol
	1oqt3B2lvbiGzktLX+ChopLrbzQXtk0jn8jdf+wKHmzjc2IdwdiHo74=
X-Google-Smtp-Source: AGHT+IFARA4a5PWcIJDAZstkk932H54hlXuqRkYrdrVKPna7J7mJJ6ZwzsklaVk5AIi5huJETP4af5HGOLubSX1WV+4=
X-Received: by 2002:a17:90b:4b0f:b0:281:8e9:7b86 with SMTP id
 lx15-20020a17090b4b0f00b0028108e97b86mr3080018pjb.23.1700837840600; Fri, 24
 Nov 2023 06:57:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Edward Dickson <edickson@hudson-trading.com>
Date: Fri, 24 Nov 2023 14:57:09 +0000
Message-ID: <CALqmkGz7HqTeAvyZwJDTcZsuSUVi6usAD8P6XwTnfMxzBSs=Fw@mail.gmail.com>
Subject: [nftables] Multiple reject withs in a single rule
To: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am running nftables v0.9.8 and am aiming to create a single
rejection rule which specifies multiple rejection types for different
protocols.

Something like: "reject with tcp reset with icmpx type admin-prohibited".

However when I've tried this, nftables throws an error:
Error: syntax error, unexpected with, expecting end of file or newline
or semicolon
add rule inet filter output reject with tcp reset with icmpx type
admin-prohibited

 ^^^^ (under the second with)

Error: Statement after terminal statement has no effect
add rule inet filter output reject with tcp reset reject with icmpx
type admin-prohibited
                                      ~~~~~~ (under first reject)
^^^^^^ (under the second reject)


I am currently using two rules which covers TCP, ICMP and anything
else, but would be better as a single rule:
    add rule inet filter output meta l4proto tcp reject with tcp reset
    add rule inet filter output reject with icmpx type admin-prohibited

But this would be better as a single rule, as the duplicate similar
rules create complexity and duplication.

Is there a way to specify multiple rejection types in a single nftables rule?

Kind regards,
Edward
