From: "www.piratehosting.net" <webmazter@gmail.com>
Subject: ip_conntrack: table full, dropping packet
Date: Fri, 24 Sep 2004 02:07:52 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <e73cec8004092401074a667c3a@mail.gmail.com>
Reply-To: "www.piratehosting.net" <webmazter@gmail.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

512mb ram
about 150,000 connections
its a ircd server with 15 clients at 1024 users each.
i have to keep moving it up as the conntrack doesnt empty

