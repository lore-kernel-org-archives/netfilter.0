From: Fabrice MARIE <fabrice-marie-sec@ifrance.com>
Subject: Re: IPSEC and other non tcp/udp/icmp blocking
Date: Mon, 14 Oct 2002 19:17:39 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210141917.40231.fabrice-marie-sec@ifrance.com>
References: <41791.64.86.49.17.1034369123.squirrel@www.icafe.co.tz>
Reply-To: fabrice-marie-sec@ifrance.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41791.64.86.49.17.1034369123.squirrel@www.icafe.co.tz>
Content-Disposition: inline
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
To: murli@icafe.co.tz, netfilter@lists.netfilter.org

Hello Cyberdude,

On Saturday 12 October 2002 04:45, Mitesh P Choksi wrote:
> Dear All,
> How does netfilter work with other protocols apart tcp/udp/icmp?
> I am trying to either block or account IPSec traffic.
> Regards,
> Cyberdude Murli
> The Earth

to block ipsec (IIRC):
# iptables -A FORWARD -p 50 -j DROP
# iptables -A FORWARD -p 51 -j DROP
# iptables -A FORWARD -p tcp --dport 500 -j DROP

(to block ah&esp as well as the IKE daemon).

Have a nice day,

Fabrice.
--
Fabrice MARIE

"Silly hacker, root is for administrators"
       -Unknown

