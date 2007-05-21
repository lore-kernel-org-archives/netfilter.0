From: Rohit Grover <rgrover1@gmail.com>
Subject: using packet filtering to discover TCP end-to-end latency
Date: Mon, 21 May 2007 16:05:10 +1200
Message-ID: <C4794891-5098-4238-BC18-2D54D2CB9859@gmail.com>
Mime-Version: 1.0 (Apple Message framework v752.2)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:mime-version:content-transfer-encoding:message-id:content-type:to:from:subject:date:x-mailer;
	b=BdzZ7pL5ml4rRGSg2mR1p9kuVf9w6vMUEbfz4qgfhbyCDHKNfB+zRLEamC6oujN5vKc4VKh3QSp0MXVxy2cT6tzaQccxBMJ8ZXn86A26YRD7mPq64wRiPXY2K1x2T3h3NME36DZ5PzwAy8X+NvbEgBPSQcNxZJk9l44jcWjuN+Y=
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I need to discover the TCP end-to-end latency between web clients and  
servers transparently (i.e. without altering the clients or the  
servers in any way). I have squid running as a proxy server on a  
linux box, sitting between the clients and the servers. I can have  
the clients change their proxy settings to have requests pass through  
squid. Squid can measure latencies between itself and the web  
servers. The problem is to measure the network latency when squid  
tries to forward the server responses back to clients.

Can packet filtering help me with this? Can I, for example, filter  
for the client ACK of the last bit of data sent from squid back to  
the client?

Also, I still need to device a solution to measure network latency  
experienced by the client's SYN sent to the squid box. Any ideas?

thanks in advance,
Rohit Grover.

