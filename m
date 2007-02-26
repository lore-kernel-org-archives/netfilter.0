From: "Chris Nighswonger" <cnighswonger@foundations.edu>
Subject: Port redirection failover
Date: Mon, 26 Feb 2007 15:07:26 -0500
Message-ID: <cdae243a0702261207oad161base1d24682d3a3a728@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

Some background:
  We have redundant broadcast servers for our webradio stream. One of
the types of streams we use is a "pull" where a remote Windows Media
Server "Pulls" the stream from our broadcast server. This is
accomplished by doing a DNAT so that the pull request from the WMS is
directed to the broadcast server. It works great.

Issue:
  I need some type of failover configuration where when one of the
broadcast servers is not available the DNAT will forward traffic to
the other broadcast server.

Question:
  Is this possible using iptables? (OS is Fedora Core 6)

Thanks,
Chris

-- 
Chris Nighswonger
Network & Systems Director
Foundations Bible College & Seminary
www.foundations.edu
www.fbcradio.org

