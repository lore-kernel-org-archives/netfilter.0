From: Rayed <rayed@saudi.net.sa>
Subject: Forking inside netfilter queue
Date: Mon, 30 Apr 2007 16:18:06 +0300
Message-ID: <4635EC8E.4090905@saudi.net.sa>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi,

I am building netfilter queue application, that implement simple HTTP 
filter.

It basically will capture the packet, extract the URL, and issue MySQL 
lookup to see if the address is permitted or blocked.

My only fear that address lookup will block the traffic until I get the 
lookup reply, so I am thinking of using preforking model to fork 10-20 
processes to handle the same queue.

Has any one done multi prcoess handling of the queue, is it even doable?

Rayed

