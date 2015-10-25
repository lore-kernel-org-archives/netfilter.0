From: macach <macachuto@gmail.com>
Subject: Question: Why it is not possible to mark packet BEFORE first "route
 selection" in OUTPUT chain
Date: Sun, 25 Oct 2015 14:40:29 +0300
Message-ID: <562CBFAD.40405@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=wmEXQc4kKJ8XOHqiRgqO0lYk19KtVvRA0kFS0CIE2Zc=;
        b=Uilo+6/2whY6cvvBIBeTUqZKcdTKgjxAuFbQT+pmQQTJTcEJk+vdMGaLXxeQkYkttX
         iAJvhYfHd3ujwoGuwH1U8vBHsT08bJgBzAjzvda9GRxuX+AawdgXdUSk/Cf2Y1x4Mk6P
         RQE+TxNBAoVnt/vlf8oEP3IHLj6Xuyddb+C1P4MEaWG79dl6SAl2/+SX+X0sXdc/AXzg
         RW6PLeiPd2czZs0rlHQbVzduLpKA2eBltl4Gc28X9T4mNvOtJjcn+7lU14jcMIP1apFo
         epzwdbEX+s+t+2PRQBpwT2yogKQ37znR9o9iDQ4hMXylHDWpcpkNwNU4L5BsvLiA/F/M
         4OIw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have a question.

I just want to understand this.

Why it is not possible to mark packet BEFORE "route selection" in OUTPUT chain.
And then choose route by mark
Then change source ip
And then send it to destination

Instead of this packet enter "route selection" where it SHOULD hit default route, otherwise it will never enter "-t mangle -A OUTPUT".
Default route changes it source ip.
"-t mangle -A OUTPUT" adds a mark
Then another "route selection" checks for marked route and redirects packet to appropriate interface, BUT doesn't change source ip (also why?)
Then "-t nat -A POSTROUTNG" changes source ip.


My question is why we can't mark packet BEFORE first "route selection", then choose routing table by mark, then change source ip, and send 
packet to interface.


Thank you for explanations.
