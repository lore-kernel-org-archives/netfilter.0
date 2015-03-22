From: Albert K <alberk@gmail.com>
Subject: Status of Nftables.
Date: Sun, 22 Mar 2015 12:01:48 +0800
Message-ID: <CACjDgAN14zE8KRh06i4uh1G98fLhE4z+s+Q0Gm5eMZjeHNwdnQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=EI7iVJjk/RTbjod4oz0SmARtzhmECRAuTAM5UIpfxHo=;
        b=d6/JvblaN2XQB2uqxfnzJ55UoXs4cQ4HXZXt5hEg93N35hKvfiOg4DuEZuh7zXYkO2
         UcPCZQQdV9LrhoDsKxVZfRlkVfQIQhNvaW28cqVBs/iLhe8W6kjnAebEoMzxOAbE5d6S
         KuX7oVT30FeYlzk/3fLqj55dL9AGLT6Iz2RDxo8cqqM0uMa6iO20aIL1mSQzluMqds+N
         sxbxohNgxY4eCjzxn3DRKqwQb3O+hxX/2C4beRp0NA1VdQCV6zj/CXyt1rAUXCa2tGKr
         /LNb6KYn/KU4DSIbQgeAs7Eb1/LPbBV4N73TpUtWbwb3d7aixM/CfdB8m6x9u8QoWRLc
         0QoA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have been kicking the tires of nftables and love the structured way
to implement filter/rules and have the following questions?

1) When is the (xt_classify.c and xt_physdev.c) from iptables
extensions going to be implement in nft?  I want to use it to classify
traffic in conjunction with HTB qdisc in a transparent bridge setting.

 2) Is the a schedule anywhere to indicate the approximate time for
all iptables extensions to be ported over?  I guess some will be
dropped or merged and it would be good to know in advance.

3) When would be nftables be good enough to be in production.

Thank you.

Regards,
Albert.
