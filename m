From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables rules do not work
Date: Mon, 5 Apr 2004 18:51:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404051851.52998.Antony@Soft-Solutions.co.uk>
References: <B1A93958FC04D311B0240008C7F9DD2416227399@nalgexc1.nalg>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B1A93958FC04D311B0240008C7F9DD2416227399@nalgexc1.nalg>
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

On Monday 05 April 2004 4:51 pm, Montreuil, Scott NALG-CA wrote:

> Hello,
>
> I have the exact same rules here for the exact same machine.

Please can you show us the full ruleset with the interfaces listed as well 
(ie: post "iptables -L -nvx" instead of just "iptables -L")?

> I can connect internal to this machine on the ports specified but the rules
> are not working for the IMAP server, they work no problem for the SMTP
> server.

Do you see the packet counters from "iptables -L -nvx" incrementing when you 
try to connect, indicating that packets are matching the rules?

> ACCEPT     tcp  --  anywhere             10.10.10.2         tcp dpt:smtp
> DNAT       tcp  --  anywhere             static-89-102.dsl.tht.nettcp
> dpt:smtp to:10.10.10.2:25
> DNAT       udp  --  anywhere             static-89-103.dsl.tht.netudp
> dpt:smtp to:10.10.10.2:25
> DNAT       tcp  --  anywhere             static-89-103.dsl.tht.nettcp
> dpt:smtp to:10.10.10.2:25
> SNAT       tcp  --  10.10.10.0/24        10.10.10.2         tcp dpt:smtp
> to:10.10.10.1
>
> ACCEPT     tcp  --  anywhere             10.10.10.2         tcp dpt:imap
> DNAT       tcp  --  anywhere             static-89-102.dsl.tht.nettcp
> dpt:imap to:10.10.10.2:143
> DNAT       tcp  --  anywhere             static-89-103.dsl.tht.nettcp
> dpt:imap to:10.10.10.2:143
> DNAT       udp  --  anywhere             static-89-103.dsl.tht.netudp
> dpt:imap to:10.10.10.2:143
> SNAT       tcp  --  10.10.10.0/24        10.10.10.2         tcp dpt:imap
> to:10.10.10.1
>
>
> Any dieas why I can't connet to IMAP?

Is your IMAP server configured to accept connections from the address/es 
you're trying to connect from?

What do your system or mail server logs say when a connection is attempted?

Regards,

Antony.

-- 
G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

                                                     Please reply to the list;
                                                           please don't CC me.


