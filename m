From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Why are XMAS and NULLS scans not filtered with these rules?
Date: Sat, 26 Oct 2002 12:46:59 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210261240140.13106-100000@dns.toxicfilms.tv>
References: <20021026011329.71679.qmail@web40707.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021026011329.71679.qmail@web40707.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tasha Smith <natasha3641@yahoo.com>
Cc: netfilter@lists.netfilter.org

Hi,

Try -j REJECT --reject-with tcp-reset
This way you'll tell nmap: go away, the port is closed.
normal REJECT will issue an ICMP error message:
destination unreachable/port unreachable.

If you use DROP or simple REJECT nmap will say: filtered
If you use REJECT --reject-with tcp-reset it will say closed.

Note that, if you use any REJECT and not DROP, nmap will get the packets
and will try OS fingerprinting on them.
Also note that it does not really give a scanner anything. I recommend
using DROP and not caring about the nmap results.

NMAP also sends a ping and then a TCP ACK packet with --dport 80, just
before it starts scanning. You may want to track down the UNRELATED TCP
ACKs with -p tcp and -m state --state NEW together.

Regards,
Maciej Soltysiak



