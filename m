From: Ludo Stellingwerff <ludo@protactive.nl>
Subject: Some more IPSec - IPTables issues?
Date: Thu, 27 May 2004 10:55:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085648121.3864.58.camel@laptop.stwerff.xs4all.nl>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi all,

I have a similar question about the combination Netfilter and in-kernel
IPSec. Most of the discussion about this combination is focussed on
filtering incomming and/or outgoing traffic, both encrypted and
decrypted. But my issue is about SNAT. I've googled around for an
answer, but beside some people mentioning the problem I have not found a
proper solution, yet.

The problem is about SNAT'ing traffic originating in the LAN, and being
send out a IPSec tunnel at the gateway-router. With the current
implementation of both IPSec and Netfilter this doesn't work, because
POSTROUTING is applied only after the SPD gets a chance to decide on the
pakket.

Can anybody give some hints or inside on this subject? Is there a known
work-around or a road-map to a solution?

I need this functionality to be able to create a VPN-tunnel between to
networks, one of which is behind a dynamic IP-address. I have a working
solution by (dirty)-hacking Racoon, but that hack is unmaintainable.

What I like to build looks like this:

|    /---\       /---\     |
|----| A |--//---| B |-----|
|    \---/       \---/     |

Where host B has a dynamic IP-Address. The network behind B should be
able to enter network A, but the IPSec tunnel will only see a
road-warrior host B:

|    /---\       /---\
|----| A |--//---| B |
|    \---/       \---/


Thanks in advanced,

Ludo Stellingwerff.




