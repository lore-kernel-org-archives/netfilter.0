From: "Ed _" <ed_b_71@hotmail.com>
Subject: netfilter - Dual NIC configuration
Date: Wed, 28 May 2003 11:10:44 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law14-F35SZMhRjX9kH00052c58@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Any one have any pointers as how to configure the system for a firewall - 
using two NIC cards.

Does the stream of data in the request/outgoing and the incoming/response 
path get accumulated in the same queue in the kernel and available thru the 
same interface in user space via libipq ?
or
Do the  two separate interfaces => two different queues and having to have 
two different interfaces in the user space?

thanks,

ed

_________________________________________________________________
The new MSN 8: smart spam protection and 2 months FREE*  
http://join.msn.com/?page=features/junkmail


