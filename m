From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Native support of counting rules?
Date: Wed, 2 Jan 2013 21:48:35 +0800
Message-ID: <20130102134421.GA17997@devnull>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:date:from:to:subject:message-id:mime-version
         :content-type:content-disposition:user-agent;
        bh=UFrM7dWsI4+UN2hNNjrtEJECQy8DmtysMLEL33d7Oyc=;
        b=VGCvDSPw0vl3r3tq5y9MjpPK7RXeDnMtrY3ENu3Zp8Rjs3wF1mhHDZsSqr+K6QEgqj
         YXZB0AsltzjQ/x1ZEjsUZMs9+WwtZOmesMHlbyxLDIjMB6Pndy/mhxVbfOpfOB3QmIn4
         whMbqupbK230SBjnyHocse8ReJjB7f4qj4qR9f5hcpfYYxI0Zc5nBwdypJAKQsImJqBF
         Du2XpPRCX3EvY4t4RH0itHTnVSVOrXVzVk3tvbos+syMZoG6hGyehCIMO91quFNEZjhQ
         fqHjsBu7lhqk2QMLYJjbHixMmZ10kBjf8igVtNIgzbgO9+iOp7LGgjwITEH+5VHZmtNO
         Uvcw==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

Hi,
    I want to know if I could get how many rules are present, i.e in
    filter table?

    Now I do `iptables -L | wc -l` like stuff, I know it's not right,
    but iptables itself doesn't seem to count rules anyway.

    I need this just to let user to know how many rules are present,
    without root privileges, and now being able to view actual rules.

-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://pgp.mit.edu/ )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
