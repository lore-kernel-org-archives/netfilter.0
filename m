From: Sebastian Docktor <sebi@tux-labor.de>
Subject: Dynamic DNS
Date: Wed, 9 Mar 2005 07:25:42 +0100
Message-ID: <20050309062542.GA27660@gw.home.tux-labor.de>
Mime-Version: 1.0
Content-Disposition: inline
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

Hi,

I want to allow a Dynamic DNS Client to Access the SSH-Server 
on my Firewall. But I don't want to open SSH for all IPs,
Is it possible that iptables always looks up the ip address from the 
hostname, so that only the ip has access which is registrated under
the dyndns?


-- 
Sebastian Docktor <sebi@tux-labor.de>

