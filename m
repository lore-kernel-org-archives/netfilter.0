From: David Garamond <davegaramond@icqmail.com>
Subject: disallow normal users from bind()-ing to ports
Date: Wed, 11 Dec 2002 00:03:21 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DF6E339.3000403@icqmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hi,

i want to regulate local users on our non-firewalled machines:

+ normal, non-system users (uid >= 500) shall not be able to bind to any 
port (so that they cannot run file-sharing applications, bypass company 
proxies/mailservers and what not);

+ there are certain IP aliases (say: 12.34.56.78 and 12.34.56.79) and of 
course 0.0.0.0 that should be able to be bind()-ed by normal users at all.

seeing that iptables now has --*-owner options, is it possible to 
achieve this goal with iptables? or do i still have to trap the bind() 
(or accept(), or listen()) syscall somehow?

--
dave


