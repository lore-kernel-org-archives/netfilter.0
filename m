From: DarKRaveR <DarKRaveR@habitat-b.de>
Subject: Re: Bytecount/Packetcount
Date: Tue, 11 Feb 2003 00:46:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2349069347.20030211004613@habitat-b.de>
References: <11247341353.20030211001725@habitat-b.de>
Reply-To: DarKRaveR <DarKRaveR@habitat-b.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <11247341353.20030211001725@habitat-b.de>
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
To: netfilter@lists.netfilter.org

Hello list,

Nevermind, I just realized, that I am too stupid to properly type the
correct length of the netmask ...

Sorry ...

Tuesday, February 11, 2003, 12:17:25 AM, you wrote:

D> Hello list,

D>   I've set up 2 rules for testing, which just matches packets from my
D>   system, to the outside network and packets in the other direction.

D>   For some odd reason, the bytecoutn with iptables -L -v says
D>   something around 15 GB, whereas I know it can't be more than 3 GB.
D>   The funny thing is, it seemed in the beginning, with smaller network
D>   load and less packets/day to be exact.

D>   I assume, there is a problem, either, when a certain byte boundary
D>   is exceeded, or a certain speed, or a certain amount of packets per
D>   minute.

D>   I am using a standard 2.19 kernel if I remember right ...

D>   Any ideas ? anyone with the same problems ?




-- 
Best regards,
 DarKRaveR                            mailto:DarKRaveR@habitat-b.de


