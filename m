From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Fwd: Re: Ports closed in spite of opening them?
Date: Fri, 2 Apr 2004 16:28:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404021628.38527.Antony@Soft-Solutions.co.uk>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

On Friday 02 April 2004 4:09 pm, Hurley, Michael wrote:

> Trying to write an iptables script to open ports 22, 25, 80, and 443 on a
> little testing box. The problem is, when I scan for open ports, 25 and 443
> report they are *closed*. Any idea what might be going on here?

Do you have services actually listening on those ports?   Can you connect to
them from a suitable client running on the machine you did the port scan
from?

Regards,

Antony.

--
RTFM may be the appropriate reply, but please specify exactly which FM to R.

                                                     Please reply to the list;
                                                     please don't CC me.



