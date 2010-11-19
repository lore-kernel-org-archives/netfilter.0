From: "liu" <liu@5bamboos.com>
Subject: which traffic scheduler can achieve SP QoS effect, using TC
Date: Fri, 19 Nov 2010 22:42:18 +0800
Message-ID: <201011192242182505082@5bamboos.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s0907;
	t=1290178254; bh=jVoF3W63KguHlvxDQKb0N/JPfKTh9n6MVJ4TR0O7x5o=;
	h=X-QQ-mid:Received:X-QQ-SSF:Date:From:To:Subject:Message-ID:
	 X-mailer:Mime-Version:Content-Type:Content-Transfer-Encoding;
	b=PgWonj96PX8ELe6GV2Po4/3MpoKkBpTabUyjooPoTWBZ1POACBQZtTe6AQR/GdE4r
	 JPM3o+DFxWmfIrCpubYLEjUqB6JrYaM06Zc1WYcl//nPNx86PlS9kWkgzFQOM/4
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

For example, 8 queues is configed in a router, q1 have the highest priority to xmit packet, and q2 can get chance to xmit packet just when q1 has no packet to send, and q3 can get chance to xmit packet when q1 and q2 have no packet to send, the rest of other queues is simily.

Can TC achieve this effect, and how could I configure my router, which is using kernel 2.6.30.

Thanks for any help!
 				
--------------
ronliu
2010-11-19
h
