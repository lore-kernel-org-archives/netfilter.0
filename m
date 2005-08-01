From: Bryan Christ <bryan.christ@filefront.com>
Subject: Setting up a local firewall
Date: Sun, 31 Jul 2005 21:24:07 -0500
Message-ID: <42ED87C7.207@filefront.com>
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

I locked myself out of  my server until I rebooted it.  My goal was to lock down everything and allow only SSH connectivity.  Can anyone show me where my logic went wrong?  Here was the fatal script which I wrote:

/sbin/iptables -F INPUT
/sbin/iptables -A INPUT -s 0/0 -j DROP
/sbin/iptables -A INPUT -s 0/0 -m state  --state NEW,ESTABLISHED -p tcp --dport 22 -j ACCEPT

My guess is that I missed accepting syn packets, but I'm not ready to "try" again.

Thanks in advance,
Bryan


