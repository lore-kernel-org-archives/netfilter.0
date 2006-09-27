From: gabrix <gabrix@gabrix.ath.cx>
Subject: ftp passive ports and their state
Date: Thu, 28 Sep 2006 00:12:35 +0200
Message-ID: <451AF753.4020703@gabrix.ath.cx>
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

I have a debian sarge kernel 2.6 stable and proftpd as ftpd ... .My ftpd 
is open to internet users and i accept passive ftping.I have inserted a 
PassivePorts 60000 65534 directive in proftpd.conf for passive 
connections which it's still a hole of 5534 ports in my firewall.Could i 
accept connections to this ports  in a state ESTABLISHED,RELATED in my 
iptables script ?

Thanks !

