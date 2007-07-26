From: lising <xing.starwill@gmail.com>
Subject: [Fwd: Questions about the netfilter_queue]
Date: Thu, 26 Jul 2007 19:10:38 +0800
Message-ID: <1185448238.4506.11.camel@lising-desktop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-+Z9wJ7r0Z1pDwECl/7vs"
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:subject:from:to:content-type:date:message-id:mime-version:x-mailer;
	b=uKTXUbAIdHOGd9gy9HlCtFIvVbRdbPsSeGC2c7IcHGe7vnfseQYYoiAQvpUxMhMJ5hI4xE0kxGtKDhJV8L3ODSvw5Pi82JgBdTZUyvFKUibDTtZMnEY3FZ8Jz3fOD5HIm4u6h98nIBEVtODws6c+oil527JCwNL0H0f0lkZXTaY=
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
To: netfilter@lists.netfilter.org


--=-+Z9wJ7r0Z1pDwECl/7vs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



--=-+Z9wJ7r0Z1pDwECl/7vs
Content-Disposition: inline
Content-Description: Forwarded message - Questions about the netfilter_queue
Content-Type: message/rfc822

Subject: Questions about the netfilter_queue
From: lising <xing.starwill@gmail.com>
To: netfilter@lists.netfilter.org
Content-Type: text/plain
Message-Id: <1185445508.4506.7.camel@lising-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
Date: Thu, 26 Jul 2007 18:25:17 +0800
Content-Transfer-Encoding: 7bit

hi, 

  I wrote some code to parse the packets captured by the
netfilter_queue. I used the following the iptables rules on my PC:

 iptables -A OUTPUT -p tcp --dport ${PORT} -j NFQUEUE --queue-num 0
 iptables -A INPUT  -p tcp --sport ${PORT} -j NFQUEUE --queue-num 0

When I try to transfer a file about 500M to the server, after several
seconds, the capturing process can't capture any more packets.

Do you all encounter the same problem? Thanks a lot.

Lixing
July.26 2007


--=-+Z9wJ7r0Z1pDwECl/7vs--


