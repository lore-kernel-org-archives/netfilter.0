From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: time-based IP accounting
Date: Sat, 22 Jan 2011 17:42:18 +0000
Message-ID: <4D3B16FA.2040209@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=avV0CkpX+8T8QgueZHtr4FxZOHoijvJSe2w2svLroko=;
        b=lPMW753TcNTFLYf7Y0aCVWa+tj4Euv2wuzpCc/gTwiB7L/IhXtqnB4gY/2UvNjrpug
         xHYGIIRNEi11p5XmoZIUWlbcrEtBx/GbwKVahYVBTKQwZV30ngu/tWT9b3TgRuWaHOy6
         SFVKZwuschYxwh+3xttpObjtgLYc1O5C1Rbjw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Is that possible?

I would like to be able to define various accounts for different parts 
of the day/week and track the amount of traffic passing through 
particular interface/IP address(es) and ports. I would also like to be 
able to reset these after certain period (say 6 hours after the account 
time has ended), but I guess I could do that via a cron job and by using 
iptables.

Any suggestions?
