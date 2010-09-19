From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Mon, 20 Sep 2010 00:04:05 +0100
Message-ID: <4C9696E5.4030803@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=iGrEoSWVi6zsEIUvBgC1dfED2oRLT341fpyYRBevj8U=;
        b=B6lg0sDGSesXfXqEUafeXvLPgD1EiM8Zg7ubM/GeJD5JukCJn5xYTuxnkaz2f9JGwS
         lf2WBTkyyj49bu8hqsn3kYoWa3PYZuDrEJE9lm3brEekuwug4ruWbMCird6oK0+7j5gy
         l41kYaU1vCESgP61cPrjYDO8HsCdqIjn3znRQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

When I list my connections with 'cat /proc/net/nf_conntrack' I get the 
SELinux context secmark as a number, like secmark=XXX.

Is there a way I could map that number to the name of the actual context 
when I set it up originally with the --selctx option in iptables? If 
that is not possible do you plan to include such feature in the upcoming 
versions of netfilter?
