From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: macipmap (ipset) matching
Date: Tue, 28 Sep 2010 22:33:47 +0100
Message-ID: <4CA25F3B.2070801@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=PlTtVSGKNppbFZ6MRNMtWkztn+CqOWPwVKEjdFEgi4k=;
        b=Nh0UzF4eIg3ZujfmeF/nQJSDis4GNX9pOyWwj3p6AESYpFlvl3eXv3AI4yqohZ2wF6
         ATgAoOEZIMm6jHIJ8M2EbrZhMamndm4eFuQ96J76uhML5Fu+a6/g13TMa+8+GvhLFWax
         yx3GHcIQGe0TywLzHS+/bcA9ysz71i5VVBg5w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am trying to employ and use this, but am unable to get any match 
whatsoever. I have registered my own (internal) network and the relevant 
mac addresses for each interface, but no joy. What could be the problem? 
Has anybody actually tried this?
