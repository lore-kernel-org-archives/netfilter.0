From: Victor Julien <victor@nk.nl>
Subject: How to use the the mark match with a mask?
Date: Tue, 29 Mar 2005 21:44:52 +0200
Message-ID: <200503292144.52789.victor@nk.nl>
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
Content-Type: text/plain; charset="us-ascii"
To: Netfilter <netfilter@lists.netfilter.org>

Hello list,

I have a question about the mark match. The manpage states that mark match can 
be used with a mask, e.g. '-m mark --mark 1/1'. However, i don't understand 
how to use it.

Say i want one rule to match marks 0-999, how can i accomplish this? I tried 
various settings, but i can't get it to work.

Thanx for your time,

Regards,
Victor

