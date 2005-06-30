From: <vincent.panel@chello.be>
Subject: connection tracking and DNS
Date: Thu, 30 Jun 2005 2:43:37 +0200
Message-ID: <20050630004337.OEHG11566.amsfep12-int.chello.nl@localhost>
Reply-To: vincent.panel@chello.be
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

Hi !

I had a look at the site and did not find a lot of documentation about connection tracking. I only found modules for ftp, mms, talk, sip, quake and a few others : does it mean that other protocols are not conntracked ?

Then, I'm wondering how connection tracking is dealing with DNS (and more generally UDP) requests and replies : is it based on ports (when a connection from port 3350 to 53 occurs, iptables expect an answer from port 53 to port 3350) ? is it based on any magical number inside the packet header ?

Thanks.

PS : if this such a documentation already exists, could you please send me the link ?


