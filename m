From: Phil Rhoades <phil@pricom.com.au>
Subject: DHCP & remote ssh logins
Date: Sun, 29 Apr 2007 23:33:58 +1000
Message-ID: <1177853638.11131.46.camel@prix.pricom.com.au>
Reply-To: phil@pricom.com.au
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

People,

If iptables are setup to only accept ssh logins from particular IPs, how
do people login when they are on the move and have a DHCP allocated IP?

I thought I could do this by sending a mail (from the remote DHCP IP)
formatted in a particular way, to a particular user on the destination
server which would then be processed, which would then cause a change to
the iptables setup.  However, I assume other people have had to solve
this problem and I don't want to re-invent wheels . .

Suggestions appreciated!

Regards,

Phil.
-- 
Philip Rhoades

Pricom Pty Limited  (ACN 003 252 275  ABN 91 003 252 275)
GPO Box 3411
Sydney NSW      2001
Australia
Fax:     +61:(0)2-8221-9599
E-mail:  phil@pricom.com.au


