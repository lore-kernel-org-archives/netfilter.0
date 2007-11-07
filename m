From: "Srinivas Murthy" <codevana@gmail.com>
Subject: new table entry init default verdict
Date: Wed, 7 Nov 2007 15:01:13 -0800
Message-ID: <df1bdeb10711071501v4859ff60u58a41e3a00f5772d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition:x-google-sender-auth;
        bh=InKQyZk5XzW0T9rL0H5VTvV1txaBv6OFzoP5dtBWjm4=;
        b=D7Sx8e0K8FW2xHHSUugDY6qEkKoDQ81oUp0His8HAj04AqjEkQpZ0xg1dn1jl1O3Oc4vxOhnVEQuBMCdgjn4BXbzpKbBrV6BT8aU4tOqCfGYwrikol+mEhb4PLvpO5s/igVrkmo6+XjNtPgVpNcrXnZU5shnQfoEBHZmVO/P2Yw=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I see that a init value for an entry is -NF_ACCEPT-1

Not sure if this value has any meaning.

What should be the default init value to accept?

Thanks.
