From: Bjorn Ruberg <bjorn@ruberg.no>
Subject: Re: nat & ip accounting
Date: 27 Mar 2003 00:50:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048722647.18895.39.camel@mikke>
References: <004401c2f3ce$812d08e0$0200a8c0@lynx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004401c2f3ce$812d08e0$0200a8c0@lynx>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Oops, a little error in my last posting. Do NOT use the RETURN target on
the default chain.

The RETURN target (obviously) returns the packets to the chain that sent
it there. If used in the main chain, it is the same as falling back to
the default behaviour of the chain and will hopefully be denied.
Therefore, a direction to a chain must be done.

        iptables -N count_in
        iptables -A count_in -j RETURN

        iptables -N count_out
        iptables -A count_out -j RETURN

        iptables -A FORWARD -s 192.168.0.4 -j count_in
        iptables -A FORWARD -d 192.168.0.4 -j count_out

will do the trick.

Bj=F8rn


