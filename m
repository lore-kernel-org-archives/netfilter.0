From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: logging to console
Date: Tue, 16 Dec 2003 16:23:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312161623.18146.Antony@Soft-Solutions.co.uk>
References: <AD8D39C727CBD411BB2C0090273A727408F9ED49@mortimer.law.uconn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AD8D39C727CBD411BB2C0090273A727408F9ED49@mortimer.law.uconn.edu>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

On Tuesday 16 December 2003 3:59 pm, Hurley, Michael wrote:

> Using iptables 1.2.8-8.72.3 on Red Hat Linux 7.3, kernel 2.4.20-20.7.
>
> Haven't found a solution to this so far: iptables LOG is logging to
> console. This only occurs on the consoles directly connected to the
> machine. Logging in remotely does not have this problem.

Try using the numeric values in your netfilter LOG rules instead of the words 
notice and warning for the log-level.

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the list;
                                                           please don't CC me.


