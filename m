From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: iptables wishes
Date: Tue, 1 Apr 2003 10:35:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304011035.21340.netfilter@newkirk.us>
References: <65F646CE24EBF24AA3714070D537988E017F04@gargoyle.seaan.net> <006c01c2f85b$9b2d8800$1e0110ac@ausland.net.br>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <006c01c2f85b$9b2d8800$1e0110ac@ausland.net.br>
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
To: Ivano Proietti Mucci <ipmucci@yahoo.com.br>, netfilter@lists.netfilter.org

On Tuesday 01 April 2003 09:32 am, Ivano Proietti Mucci wrote:
> like most peaple, i have a gateway to internet, and the thing is: how
> to limit bandwidth per internal-ip?
>
> thanks,
> Ivano

This can be achieved with advanced routing.  The LARTC HowTo has some=20
sections relating to this at:
http://lartc.org/howto/lartc.cookbook.html

If the bandwidth allocation policy is strictly IP-based then the solution=
=20
is routing.  If the policy depends on connection type as well (IE, bulk=20
transfers like P2P prioritized lower than interactive connections) then=20
the solution incorporates the TOS or MARK targets in iptables, in the=20
mangle-PREROUTING and mangle-OUTPUT chains.

Very powerful stuff, but I've yet to find a how-to on it that is both=20
clear AND thorough.  (with a subject so complex, that combination is=20
extremely difficult to achieve...)

j



