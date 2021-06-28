From: slow_speed@att.net
Subject: IP Addresses Changed to Hostnames in IPTables
Date: Mon, 28 Jun 2021 15:57:30 -0400
Message-ID: <bda96448-fbd7-0c99-1bff-c3776bdfafff@att.net>
References: <bda96448-fbd7-0c99-1bff-c3776bdfafff.ref@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024; t=1624910257; bh=mxbG2/sOv0mEoOOjN/vlvQibFzBPl0KCoaHHruPaHWE=; h=To:From:Subject:Date:References:From:Subject:Reply-To; b=xgrTkGq83RgLN5WROMb+9vu47I0IjJfxUJ1zLgkMjDI5OQFpx4NN+rt0yvk69C3O/v6YA7ZOGEU6GqrnJovcvTynLgjFC7pdxfKY+CKq2UvdJ9lkxcUSl3gx4ZP69+CLm1iP0zVZI2hFdhUa9Ca65X4nEkFZLbjegQ0YQpz0DeE=
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I created a ruleset in iptables and it was saved in 
/etc/iptables.up.rules as expected.  However, when viewing the file, all 
IP addresses had been translated to hostnames.

Why would it ever do such a thing, when I had entered them as IP 
addresses and they would have to be converted to IP addresses anyway?
