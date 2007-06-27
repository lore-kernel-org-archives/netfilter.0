From: Ditro - BipinDas <bipindas.k@ditro.com>
Subject: Block an IP if there is number of connection within a time limit ??
Date: Wed, 27 Jun 2007 10:42:30 +0530
Message-ID: <4681F1BE.6000108@ditro.com>
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

Dear List,

I do have a Exim mail server with IPTABLES and TCP WRAPPER as firewall. 
Yesterday I had noticed that,there is continuous smpt connection from an 
IP. I would like to block these IP,if there is more than 10 connection 
in 30 second. Is this possible using IPTABLES command. If yes,Please 
guide me.

Thanks in Advance
-- 

