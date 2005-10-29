From: Lore <skizzo82@yahoo.com>
Subject: libipq: problems changing destination port
Date: Sat, 29 Oct 2005 14:59:53 +0200 (CEST)
Message-ID: <20051029125953.41594.qmail@web52810.mail.yahoo.com>
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

Hi...
I'm trying to change the destination port of some
packets I receive through ipq.

I used the following chain:
  iptables -A OUTPUT -p "tcp" --dport 2022 -j QUEUE
and in the code I change the tcphdr->dest to 2021, do
a new checksum and verdict it with NF_ACCEPT.

The packet get's silently dropped and I don't know
why... 
I tried to change the data and everything worked but
when I tried to change the destination port nothing
went out of the box.

Can anyone help me?
thanks in advance
Lore


	

	
		
___________________________________ 
Yahoo! Mail: gratis 1GB per i messaggi e allegati da 10MB 
http://mail.yahoo.it

