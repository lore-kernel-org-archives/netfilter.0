From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: NAT-PMP connections not tracked with nf_conntrack
Date: Wed, 13 Oct 2010 15:27:13 +0100
Message-ID: <4CB5C1C1.8060809@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=6AIqGBHD0VW52sBUO4vLDQQAA3nQhWAhaTzfOL0hS4Q=;
        b=AjoJpq13TodLPiwU1ZW0Jo8ZTYrLuspoNyOrVe3pcMYvKgeevQqZv6H6c/veQhLxNB
         D/xyqwNOYe15WKcAeaZm6MlXBZR+2v6mlKh3i14h3BUSpqi9orGWWW8cMtQ7g/BVYyjR
         abw2DsGZxcYbOzvZN0YXxoh2l5jb05IdloAZY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have configured a personal vpn with NAT-PMP (which extends from my 
local to the remote vpn endpoints), but that connection does not appear 
to be tracked by the nf_conntrack. I see the connection made in netstat, 
but not in nf_conntrack. Is that a bug or is there any other way I can 
track this connection?
