From: Linux Query <linux_query@yahoo.com>
Subject: ip + mac authentication
Date: Wed, 19 Jan 2005 02:36:03 -0800 (PST)
Message-ID: <20050119103603.82231.qmail@web30810.mail.mud.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Hi all!

I want to ensure that each of my clients can have
access to the net only with the ip address which is
specifically assigned to him / her. Is the following
going to work ?

iptables -I FORWARD -o externalinterface -s
xx.xx.xx.xx -m mac --mac-source yy:yy:yy:yy:yy -j
ACCEPT

or is it required to be done in some other way ?


thanks and regards to all,
jim.


		
__________________________________ 
Do you Yahoo!? 
The all-new My Yahoo! - Get yours free! 
http://my.yahoo.com 
 


