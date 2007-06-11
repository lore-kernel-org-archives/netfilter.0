From: Andrea <andang76@gmail.com>
Subject: multiple routing tables for internal router programs
Date: Mon, 11 Jun 2007 16:42:22 +0200
Message-ID: <466D5F4E.3010605@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:content-type:content-transfer-encoding;
	b=Y/VxYr42vRfDFmdQ5Wq2Vg6CNelZCmKYikR0NZF71prRzXYoxl+3jfppDy93gAvkCiQDAz/Z67Uc42/pxSCsKdZWgsn0jWvk7jkytkPRLidKwhHXqJ1wxKXRX5dqJx+rLEQgkO5zGgLZEA1Blc16nAXk05SnKZG+e/7ahKhU5XA=
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Maybe a strange request, I'll try to explain this as clearer as I can 
(forgive my bad english, please :-) ).

I'm setting a linux box as a router. My router uses multiple routing 
tables, so I can address the traffic from specific ip addresses of my 
lan to distinct ISPs providers (specifying a different default gateway 
fo r each table), marking packets with iptables (prerouting marks).

This works with the forwarding traffic (lan-ISPs) that crosses my router.

But how can I reach the same result for programs that are working INTO 
the linux box? All I want is that a program (ping, for examples, or a 
VOIP server, better) uses a secondary routing table in the same machine. 
In this mode, I can manipulate route settings for different classes of 
program in my router.

Is it possible?

Thanks

