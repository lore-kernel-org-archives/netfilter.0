From: "David Sancho" <dsancho@optenet.com>
Subject: Change outgoing MAC address with libipq
Date: Mon, 21 Nov 2005 11:13:12 +0100
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAJ6f2noM9NtJlAaneu2R8NjCgAAAEAAAAJ/cJZHjMmNDlFTqgnNy0XYBAAAAAA==@optenet.com>
Reply-To: dsancho@optenet.com
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

 
Hello!

 
I have 3 computers: A (client), B Gateway, C Server. I want to intercept A
packets going to C in B, change destination IP to local (B) and process this
packets in B. This is easy. The problem is with the packets originating in
B. I want to change their source IP address and their MAC simulating A IP
and MAC. I want to do a transparent process. B send packets to C but C
thinks that they come from A (IP and MAC)
 

The IP is also easy with libipq but how can I change the source MAC to match
A's MAC?
 

Thanks!

 





