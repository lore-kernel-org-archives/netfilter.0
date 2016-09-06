From: "Walter H." <walter.h@mathemainzel.info>
Subject: Rule for PROTO=139?
Date: Tue, 6 Sep 2016 12:58:59 +0200
Message-ID: <562f1fbc3e658613eafdd2c6f5200be4.1473159539@squirrel.mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:To:From:Subject:Date:Message-ID; bh=oF5cWDaI4q3MOeaLReQbDdWIFIJnIeGG/PzWIRLqXG8=;
        b=ABXBV8zsPeoOYKvrI4MkNI/RbvlCGhJgq/fVBxVmc9JkM82Y5DxiBYr2JDAmZP9D2ZhO5dCLxt6QnW9YduMzRbsiZ5DhKt7qvcDvZInQ/MKcX8ogMgwFoO0GFknXyF3yfa2mBFlmw9PVFui3MPReTbpyaDKHE9eAiB8y6iYL3OI=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

does anybody know with which rule I can catch these entries:

[317607.438061] IN=br0 OUT= MAC=ff:ff:ff:ff:ff:ff:4c:72:b9:56:16:3e:08:00
SRC=0.0.0.0 DST=255.255.255.255 LEN=72 TOS=0x00 PREC=0x00 TTL=255 ID=1624
PROTO=139

Thanks,
Walter

