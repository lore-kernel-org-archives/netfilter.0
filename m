From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: RE: New connection to windows boxes very slow, very
	fastafterinitial delay
Date: Tue, 16 Mar 2004 12:42:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079458929.2021.133.camel@grendel>
References: <C8DE82BEF24D0146862937D2A9DD0E920C7316@qlmail2.qlogitek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <C8DE82BEF24D0146862937D2A9DD0E920C7316@qlmail2.qlogitek.com>
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
To: Miguel Laborde <Miguel.Laborde@qlogitek.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Greets!

On Tue, 2004-03-16 at 11:06, Miguel Laborde wrote:
>
> 	thanks for the info, appears I probably am climbing up the wrong tree here.

Actually, I think you are on the right track. Its just a matter of
figuring out exactly where its falling apart. ;-)

> Is it possible that as the internal machine tries to establish a new session with the dmz machine, the dmz machine is trying to establish some sort of new connection back to the internal machine

Absolutely its possible. Its been a while since I've been into
NetBIOS/IP, but its possible that as you connect out the DMZ machine
queries back over another set of ports.

Easiest way to figure it out is to check your logs. See if you are
dropping any traffic from the DMZ system and if so, what is it trying to
do. If it is trying to do a call back, opening up the target port in
question between these two systems should fix the problem.

HTH,
Chris



