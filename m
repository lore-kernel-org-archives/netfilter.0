From: YongHan Lee <y_h_lee@yahoo.com>
Subject: extract or manipulate packets at POST ROUTING
Date: Thu, 25 Aug 2005 09:39:14 -0700 (PDT)
Message-ID: <20050825163914.75008.qmail@web34212.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


I create a TCP packet and pass to kernel space (LOCAL
OUT). After routing at POST-ROUTING I send it back to
user space. 
How can I extract informations (the result of the
kernel routing) from the packet and maybe manipulate
some packet information. Is it possible?


		
____________________________________________________
Start your day with Yahoo! - make it your home page 
http://www.yahoo.com/r/hs 
 

