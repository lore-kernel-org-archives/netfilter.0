From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: INET_IFACE: Secure to allow traffic from 192.168.x.0/24?
Date: Fri, 5 Mar 2004 11:40:54 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403051140.54563.Antony@Soft-Solutions.co.uk>
References: <40472125.4000608@blinkenlichten.de> <200403050129.54915.Antony@Soft-Solutions.co.uk> <40486470.2030700@blinkenlichten.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40486470.2030700@blinkenlichten.de>
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

On Friday 05 March 2004 11:28 am, Carsten Maass wrote:

> Antony Stone wrote:
> >
> > How did you set up IPsec?   Using FreeS/WAN and Linux kernel 2.4.x?  
> > Using the new built-in IPsec in kernel 2.6.x?   Some other method?   It
> > makes a big difference to what you can filter, and how netfilter sees the
> > packets.
>
> Sorry, i should have bin more specific. Both gateways are Linux boxen
> with kernel 2.4.24, using the KAME IPSec-backport from kernel 2.6 in
> tunnel-mode. Both running netfilter on Debian stable with the
> ipsec-tools and racoon coming from testing:
>
> kernel-source-2.4.24          2.4.24-3
> iptables                      1.2.6a-5
> ipsec-tools                   0.2.2-8
> racoon                        0.2.2-8

I have no experience at using Kame (but I have heard that filtering with 
netfilter using the limited access to packets in the new implementation under 
2.6 is "challenging"...)

Can anyone else help with this configuration?

Antony.

-- 
G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

                                                     Please reply to the list;
                                                           please don't CC me.


