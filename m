From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: icmp type error message
Date: Sat, 24 Apr 2004 18:31:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404241831.01573.Antony@Soft-Solutions.co.uk>
References: <KHEPIJJDEJGPDCBOMGKAKEJBCDAA.arentz@ameritech.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <KHEPIJJDEJGPDCBOMGKAKEJBCDAA.arentz@ameritech.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

On Saturday 24 April 2004 5:52 pm, Steve Arentz wrote:

> I upgraded my Redhat based linux firewall (netfilter) system from
> iptables v1.2.8, kernel v2.4.23 to iptables v1.2.9, kernel v2.4.25.
> (Trustix v2.0 to Trustix v2.1 just in case its important.)
>
> Using the same rule set, all my icmp rules now get the following error =
-
> iptables v1.2.9: Unknown arg =91--icmp-type=92
>
> A simple command line rule entry like the following gets the same error=
 -
> iptables -A INPUT -p ICMP -s 0/0 --icmp-type 8 -j ACCEPT

What do you get in response to "iptables -p icmp -h"?   Does it tell you =
what=20
type names are supported?

Do you get the same error if you specify the ICMP type by name instead of=
=20
number (ie: 'echo-request' instead of '8')?

Regards,

Antony.

--=20
"640 kilobytes (of RAM) should be enough for anybody."

 - Bill Gates

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


