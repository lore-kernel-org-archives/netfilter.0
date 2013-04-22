From: nakulgoud <nakulgoud@gmail.com>
Subject: Multihoming : Dynamically decide interface, for sending packet
Date: Mon, 22 Apr 2013 09:27:56 +0530
Message-ID: <5174B544.70000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=iHBEbLu/RGKwOyjNUQ1w+sZRJZXZ/oT+OfdnSb7/e2w=;
        b=TS+OYmxqELGuLKvOpiffN6PuO1Os9GJzun+5yFYzgzX96jEXtm8RI0cr2k9/Uc/Oet
         JpcV8eHj5zaYmJ9Ol6fSUoPsI797L7M2k8K+Qkwc0Inivgf+j0DmLzT6s07KcZZLduAy
         1kXKt2d0jEDkLrUfNrLArFLyYD1gTUStQw2HQB8t1IecmEssHEDG2ceqvyw5tErtqqnx
         CBJaC8RFVF0neAXPpPylsAwsPQOAWiFdqZHjSMgZK6UC2UD8bzUSbDyb1AdZoMBrhvvg
         uZr+Q5+vdT56lOSoZah8SIK9Lgq0Z3v05aBxZy5TBwrfuTmWfYH5YxlMC8szP30NQa52
         R03Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,
   I have a system with multiple interfaces. Based on some rule I want 
to dynamically decide the interface from which packet should be routed. 
Please help me how should I do this?
   Thanks in anticipation.
