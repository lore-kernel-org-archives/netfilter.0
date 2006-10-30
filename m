From: Nathaniel Hall <nathaniel.d.hall@gmail.com>
Subject: Change Source
Date: Mon, 30 Oct 2006 10:36:48 -0600
Message-ID: <45462A20.3040504@gmail.com>
Reply-To: nathaniel.d.hall@gmail.com
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

Is there any way to change the source address of an outbound ICMP packet?

Here is why I am asking.  Instead of dropping packets I reject them with ICMP host unreachable
packets.  If I were to try to initiate a connection to my firewalls outside IP I would get a host
unreachable from the same IP address as the firewall.  I would like to be able to change this
address to be the gateway at my ISP.  That will lesson the chances of recon and mess with a few
heads.  Is there any way?
-- 
Nathaniel Hall, GSEC GCFW GCIA GCIH GCFA

