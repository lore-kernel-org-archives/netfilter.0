From: netfilter-maillist <vlad@fakt.tazovsky.ru>
Subject: time modules
Date: Tue, 18 Mar 2003 12:24:25 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <10112294515.20030318122425@fakt.tazovsky.ru>
Reply-To: netfilter-maillist <vlad@fakt.tazovsky.ru>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hello

iptables -I INPUT 1 -p tcp -s 192.168.1.2/32 -m time --timestart \
11:00 --timestop 17:00 --days Sun,Mon,Tue,Wed,Thu,Fri,Sat \
-d 192.168.1.1/32 --j DROP  
Defaul policy in INPUT chain - DROP
But... packets allows to 192.168.1.240 (server) in this
time --> 11:00-17:00.

Why?

-- 
With best wishes,
 netfilter-maillist                          mailto:vlad@fakt.tazovsky.ru


