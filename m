From: "Hurley, Michael" <MHurley@law.uconn.edu>
Subject: RE: Re: Ports closed in spite of opening them?
Date: Fri, 2 Apr 2004 11:04:17 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AD8D39C727CBD411BB2C0090273A727408F9F137@mortimer.law.uconn.edu>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Yes, sendmail is listening on port 25; apache on port 443. However, I am not
able to connect to them. Here is what nmap reports:
Interesting ports on x.x.x.x:
(The 1597 ports scanned but not shown below are in state: filtered)
Port       State       Service
22/tcp     open        ssh
25/tcp     closed      smtp
80/tcp     open        http
443/tcp    closed      https

Nmap run completed -- 1 IP address (1 host up) scanned in 235 seconds


-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Friday, April 02, 2004 10:29 AM
To: netfilter@lists.netfilter.org
Subject: Fwd: Re: Ports closed in spite of opening them?


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

                                                     Please reply to the
list;
                                                     please don't CC me.



