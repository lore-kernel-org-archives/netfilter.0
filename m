From: seberino@spawar.navy.mil
Subject: IDS better than hardcore iptables rules?
Date: Thu, 3 Feb 2005 15:03:55 -0800
Message-ID: <20050203230355.GA31433@spawar.navy.mil>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org, opie@817west.com

Many people on this list including Jason O. are masters
at creating very detailed careful iptables rules that
DROP packets that have anything peculiar about them.

(e.g. FIN without ACK, etc.)

My iptables script just filters based on port
number and protocol.  I was wondering if instead
of diving into TCP education to duplicate the
fine work Jason and others have done,
if an IDS (Intrusion Detection System)
like Snort would serve the same purpose???

I assume Snort **ALSO** knows what TCP flag combos
typically signify a port scan and other nasties?

Chris

--
_______________________________________

Christian Seberino, Ph.D.
SPAWAR Systems Center San Diego
Code 2872
49258 Mills Street, Room 158
San Diego, CA 92152-5385
U.S.A.

Phone: (619) 553-9973
Fax  : (619) 553-6521
Email: seberino@spawar.navy.mil
_______________________________________

