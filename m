From: "G. Georgiev" <ggeorgiev@videotron.ca>
Subject: Fwd: Routing / masqerading advice needed.
Date: Tue, 18 Mar 2003 18:37:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303181837.27322.ggeorgiev@videotron.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

        Hello,

        Have a non-standard routing / masquerading issue to which I still can
not imagine a solution.

        The problem: I need to create several encrypted links to a remote
side - VPN.GALILEO.COM from a single linux machine - a gateway for a new
branch office. The problem comes from the fact that for every link the remote
side assigns me a different address. This way I end up having several
 local interfaces (ppp0,ppp1...) with different addresses that communicate
to the same addres on the other end.

        However, the package (Focalpoint emulator) that I run in several
copies on the SAME computer behind the firewall  has to communicate with the
'SERVER' on the other end every copy via one and only one of those channels,
determined by the login name/address assigned when I create the channel, else
packets are discarded. The emulator uses one port to communicate to the
server, all emulators executing connect() to the same remote port, and of
cource getting an ephemerial port after the connection is accept() ed.

    emulator 1 \          /-gw/ppp0 --encrypted ----\
    emulator 2 -my net--gw/ppp1 -------------------- other end ---- SERVER
    emulator x /         \- gw/ppp* -------------------/


        So, I need to masquerade packets via those interfaces at my gw - no
problem, but how to route them if all they have same destination address, but
packets originating from different copies of the same application should use
different channels?

        In general, I have to make my gateway lie the other end that every
copy of the emulator runs on a different computer. How?

        Any ideas appreciated, George.

-------------------------------------------------------


