From: Raviv <raviv.haim@gmail.com>
Subject: Setting NOTRACK on all tcp connections
Date: Wed, 01 Dec 2010 16:35:01 +0200
Message-ID: <4CF65D15.3060109@trego.co.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=RcFWbwVZfuHPeOUTYYh8UZB+9Weo2jJ0I42UHOYK2wo=;
        b=AyyB8ZibZbk5cw7HZNqE7xZI57pdrCXEH0sC5gIVaIv6MTYrzhHt6vjYhQF46jYSDJ
         YOiiMc+bnyFWJT3oswyRSfTuetwvld79jpq5hNIJDKri53nWBYbyDn68FpmgEqRetqlf
         sE2Jk6u1hIHo0QPmPV7Oxsbw8m4FY698zF594=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I'm developing a module that should mark DSCP values on SIP and related 
RTP connections.
For that task i have created the relevant rules.
However i would to use the conntrack only for theses udp (SIP and RTP) 
connections.When testing in heavy TCP load environment i got the 
conntrack table full.
I tried to setup a rule for notracking TCP connections as follows:

iptables -t raw -A  PREROUTING -p tcp -j NOTRACK

but stiil i can see a lot of tcp connections in /proc/net/nf_conntrack.

How do i set the rule for tcp NOTRACK?

Thanks,

Raviv

