From: Les Mikesell <les@futuresource.com>
Subject: GRE over IPSec?
Date: Thu, 06 Jan 2005 10:51:58 -0600
Message-ID: <1105030318.14796.9.camel@moola.futuresource.com>
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

This may be off-topic for this list but perhaps someone could at least
point me to a better source...  When doing IPSec tunnels between Cisco
routers it works nicely to first make a GRE tunnel which gives you
a fairly normal interface that can run routing protocols, etc., then
use 'crypto map' to push the GRE packets through IPSec encryption.

Are there any examples available that would match this setup with
Linux on one end, Cisco on the other?  A Linux<->Cisco GRE is easy
enough and zebra/quagga should run rip or ospf over that, but then
I'd like to pass the GRE packets though IPSec before sending.

-- 
  Les Mikesell
   les@futuresource.com



