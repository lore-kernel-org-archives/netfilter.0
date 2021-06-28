From: Kerin Millar <kfm@plushkava.net>
Subject: Re: IP Addresses Changed to Hostnames in IPTables
Date: Mon, 28 Jun 2021 21:36:43 +0100
Message-ID: <20210628213643.468805a4c8f262984ee530a6@plushkava.net>
References: <bda96448-fbd7-0c99-1bff-c3776bdfafff.ref@att.net>
        <bda96448-fbd7-0c99-1bff-c3776bdfafff@att.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        kSl+eux1TQcSNVvuVwYUdv42ihZRK8uXwU9VqgwE6eY=; b=stpKWbb30Mv3zyeu
        ZbGRXkruScbwy1G5FxEYZyXrY8HV2OhYTo8GbrLYfr0BOAx8hjA3jTFdBEOGclfc
        CsOYCdGlRh7zj4rTO/jTHjcM7U5OztcriS2xmBaYhWGZG+k2DIVtuR6pqNQ+ve0i
        GCbob8S5QgMBA3KT3UuwpCHZeFckB4CdOChFSxQLCKhAOkMOUgOEY6kp6e84qBGA
        /TD+uSc0ijMxAaMlVocogFB81y0LlKwJKXoq4LE9GRP/vUnyOb2w3Ly8Bm1GwBFz
        44lWBNxjxq5wY1/0q0fqGZ8oFND/5OMrGVwPYfddlgP0AwamIEG3FLuZx5m0N4qs
        U4VFvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=kSl+eux1TQcSNVvuVwYUdv42ihZRK8uXwU9VqgwE6
        eY=; b=qbudhrlbyyKY1HqX8Fz+QrGS13gwYcmsMrKUed0MdyAVRwZ+RsaJ67pzF
        YkChP5I04Ben2wQSsrXgwLt/09MoCpavVKL1luquSrcPlsJqARci81qJWtqgfv+n
        FYrpp4TCVSHCf3c6BEJk8mdA6piBfR0Q7YDsdtgg/qKLEtE0pKsMOBU3/x0xOhCY
        gnAA58WSZMTV8CBoWjx8G/na4CCycL6L+YRaZufMXoVHAIoIqGLDzsaTFN4h/vwQ
        QIfEIor72kjuB8Q287OJ+Kjk3kfHICy739ieAJegkeuNgECNVC6e11dNxipBwSFt
        zlwv2oTQyiRkf91ZCEPAeMC2/xCHA==
In-Reply-To: <bda96448-fbd7-0c99-1bff-c3776bdfafff@att.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: slow_speed@att.net
Cc: netfilter@vger.kernel.org

On Mon, 28 Jun 2021 15:57:30 -0400
slow_speed@att.net wrote:

> I created a ruleset in iptables and it was saved in 
> /etc/iptables.up.rules as expected.  However, when viewing the file, all 
> IP addresses had been translated to hostnames.
> 
> Why would it ever do such a thing, when I had entered them as IP 
> addresses and they would have to be converted to IP addresses anyway?

Here's how it works. One may supply hostnames to iptables/iptables-restore but they will be resolved at the point that the rule/ruleset is loaded into the kernel. If using `iptables -L` to list the currently loaded ruleset, reverse DNS lookups will be performed upon IP addresses before displaying. This behaviour can be suppressed by also using the -n option. As for `iptables -S` and `iptables-save`, neither of these will perform reverse DNS lookups.

In summary, it's not at all clear how you ended up with hostnames in your iptables.up.rules file. Can you reduce this phenomonen to a simple, well-defined test case?

-- 
Kerin Millar
