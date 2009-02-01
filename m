From: Grant Coady <gcoady.lk@gmail.com>
Subject: 2.6.28 breaks ipt_recent timing??
Date: Mon, 02 Feb 2009 09:48:30 +1100
Message-ID: <3g9co4h95og90qdgj9a270j3267ajqsjuc@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:subject:date
         :organization:message-id:x-mailer:mime-version:content-type
         :content-transfer-encoding;
        bh=3oG2I7vG9GgF3OZ2AT/IWAsFjENCxeTwTof0ElFS69k=;
        b=dnwJiRMMThPIHA4mcinrPH7HGfTY4m+AXu3Z8Wrd2VtoHMjZIxmr/1iUqvLQTLLefG
         FEmeg15s592v9HPSzhrvi/Y7kj3Zy9Qd9RC2yoeTKVXVhQF7q2IAFyMx+TCksyJLf+eU
         zVeiY6p51ReiSe8uxWwzMYKC6PwAH8t3mk4gk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi there,

Just tried 2.6.28.3-rc1 on the firewall box and noticed the ipt_recent 
timing seems to have changed from jiffies to ??  Something other...

Is this breakage documented anywhere?

What other breakage should I expect when changing the firewall to 
use ipt_recent's replacement?

Thanks,
Grant.
-- 
http://bugsplatter.id.au
