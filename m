From: Jamie McParland <jamie@listserv.newberg.k12.or.us>
Subject: Bypass transparent proxy in iptables?
Date: Thu, 05 Jan 2006 17:37:06 -0800
Message-ID: <BFE309C2.4DB92%jamie@listserv.newberg.k12.or.us>
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

This is probably the wrong place to ask this but i don't know where else to
turn. I'm using IPCOP as my distro and we use iptables to do transparent
proxy with squid.

I have one site that is balling up in squid and need to totally bypass
squid. Doing an ACL in squid doesn't work.

I know i could somehow put some rule before the transparent rule and bypass
it that way but i can't seem to figure it out. I asked the ipcop list but
didn't have any luck there. I thought the IPTable gurus might have an idea.

Thanks, 
Jamie



