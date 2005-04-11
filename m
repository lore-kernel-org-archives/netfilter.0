From: Christian Seberino <seberino@spawar.navy.mil>
Subject: TCP packets with RST flag set but **not** ACK flag OK??
Date: Mon, 11 Apr 2005 12:18:41 -0700
Message-ID: <1113247121.3544.118.camel@seberino.spawar.navy.mil>
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

I think RFC 793 requires TCP stacks to send RSTs if they
get packets not meant for them in some cases.  Anyone know which
cases?

For example, I think closed ports must send RSTs if they
get stuff.

This is basis for bare FIN and Xmas tree scans IIRC.

Is this right??

Even if YES, it seems a firewall could drop any RSTs that
don't have ACK set without damage right?

Chris


