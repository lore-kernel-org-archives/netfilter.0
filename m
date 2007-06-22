From: Deb ian <debian70@gmail.com>
Subject: filter by application name
Date: Fri, 22 Jun 2007 23:54:50 +0200
Message-ID: <467C452A.1050303@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:user-agent:mime-version:to:subject:content-type:content-transfer-encoding:from;
	b=noanPVuqCxxNJZUvv3UNPuBgmisTzkeungMQKPKjdGPNsKK4j3JGwBdYpLjneNSh9KVvgRwYj3QzlLZIEglvJNprhZPxSuUEvH6U70ltUSdWILGS+YCxwB/VqokGQ+htF1Akm9mpzmTHnam8ch5UGZ9Kp8W+/kllrkmD97eYswM=
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

Hello,

I want to build a firewall with iptable, and i need to filtre by 
application name. I see it's possible with

iptables -A INPUT -m owner --cmd-owner sshd

But --cmd-owner is not integred since 2.6.15 kernel, and i'am on debian 
etch (kernel 2.6.18).

How can i do this, a path exist for it? Or over solution?

Thanks you.

PS:Sorry for my bad english.

