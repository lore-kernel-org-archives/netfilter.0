From: Atsushi Nakagawa <atnak@chejz.com>
Subject: Liaise with port forwarding proxies?
Date: Fri, 05 Sep 2003 20:13:49 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030905194710.A375.ATNAK@chejz.com>
Reply-To: Atsushi Nakagawa <atnak@chejz.com>
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

Hi,

Is there something that allows iptables to talk with Dante server (the
SOCKS server) to gather which ports it's opened for receiving incoming
connections?  Or maybe a way for iptables to determine and match by
which process an incoming packet will be going to?

Regards,


-- 
Atsushi Nakagawa
<atnak@chejz.com>
Changes are made when there is inconvenience.


