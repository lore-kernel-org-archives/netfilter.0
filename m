From: "Hurley, Michael" <MHurley@law.uconn.edu>
Subject: RE: logging to console
Date: Tue, 16 Dec 2003 11:45:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AD8D39C727CBD411BB2C0090273A727408F9ED4A@mortimer.law.uconn.edu>
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
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Thanks for your reply, Antony. Changing the log-level to 7 seems to have
done the trick. 

The question then is:
How do I now capture iptables messages to their own log (/var/log/firewall)?

I suppose I could grep for the log-prefix and redirect the output into
/var/log/firewall, but if there's a simpler way, that'd be swell.

Thanks!


-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Tuesday, December 16, 2003 11:23 AM
To: Netfilter (E-mail)
Subject: Re: logging to console


On Tuesday 16 December 2003 3:59 pm, Hurley, Michael wrote:

> Using iptables 1.2.8-8.72.3 on Red Hat Linux 7.3, kernel 2.4.20-20.7.
>
> Haven't found a solution to this so far: iptables LOG is logging to
> console. This only occurs on the consoles directly connected to the
> machine. Logging in remotely does not have this problem.

Try using the numeric values in your netfilter LOG rules instead of the
words 
notice and warning for the log-level.

Antony.

-- 
"Note: Windows 98, Windows 98SE and Windows 95 are not affected by [MS
Blaster].   However, these products are no longer supported.   Users of
these
products are strongly encouraged to upgrade to later versions."

(which *are* affected by MS Blaster...)

http://www.microsoft.com/security/security_bulletins/ms03-026.asp

                                                     Please reply to the
list;
                                                           please don't CC
me.


