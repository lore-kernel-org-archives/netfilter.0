From: Michael Gale <michael.gale@utilitran.com>
Subject: Squid with iptables
Date: Thu, 4 Mar 2004 09:58:59 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040304095859.4b996ae6@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

	I have recent installed squid on my firewall box to act as a proxy server for
HTTP, HTTPS, and considering FTP.

I have added in iptable rules for squid redirecting 80 to 3128 and 443 to 3128
but I have a question. My default --policy is DROP ... so in order for squid to
work I need to allow outbound 80 traffic and not forwarded 80 traffic like
before .. but if I want squid to also allow ftp should I not just allow the
process ID of squid to make outbound connections ?

Thanks.


-- 
Michael Gale
Network Administrator
Utilitran Corporation

