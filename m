From: Reuben Martin <reuben.m@gmail.com>
Subject: ipsets: examples?
Date: Sun, 19 Dec 2010 22:37:43 -0600
Message-ID: <201012192237.43878.reuben.m@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :user-agent:mime-version:content-type:content-transfer-encoding
         :message-id;
        bh=4NBQH6BK7RLURJaDJbh1evi/H1MOXU/fH7VJgU62jpw=;
        b=cRHAN7G8lg+tFnsB31oIEKeoDVHJS42oO2WzOTga0RDNZxED4n1DrKVuuEfCsn9B/Q
         wq4+chyrxOlwdQVeD0Npf1F6sdrDgDcbQ5mlNhTDUSw3Xnc61vv/zEi4sr4PK8pp34Tz
         gMorSdQnnxbeBhRCgH//3H7IdPoLf4FWDHvFI=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


I'm trying to put together an extension to forward udp packets to an arbritary set of destinations using ipsets. Specifically I want the extension to be able to take either an ipmap or iphash as a set of destinations for the forwarded udp packets. (I'm starting with the rawdnat, stripping out the tcp code, and changing it so that it duplicates the packet as needed for destinations instead of changing the dest address in the origional packet.

But I'm having a hard time finding code examples of how to use ipsets. How do I take an ipset as an argument for an extension? How do I test the set type to make sure it's an ipmap or iphash? How do I iterate over the set? Is it an array, linked list, etc?

I've only been poking around for a couple hours with the xtables code, so I am by no means very familiar with the API.

-Reuben
