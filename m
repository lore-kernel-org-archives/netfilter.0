From: "Mark Weaver" <mark@npsl.co.uk>
Subject: RE: ssh gets cut off
Date: Sat, 31 Jan 2004 18:49:07 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GFEPJIHHFOJDOFDMNAJDKEBKFEAA.mark@npsl.co.uk>
References: <200401302055.i0UKtMu17779@neo1.neolabs.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401302055.i0UKtMu17779@neo1.neolabs.be>
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

> Hi,
>
> I found some new info...
>
> short description of problem : replaced SNAT-ing ipfilter (solaris) by an
> SNAT-ing netfilter (linux) three days ago and since then people are
> complaining that ssh-session that are left alone for a while tend to die.
> MUST be a difference between ipfilter and netfilter.
>
I'm not sure what that would be, but here is something related from man
ssh_config:

KeepAlive
Specifies whether the system should send TCP keepalive messages
to the other side.  If they are sent, death of the connection or
crash of one of the machines will be properly noticed.  of the
machines will be properly noticed.  This option only uses TCP
keepalives (as opposed to using ssh level keepalives), so takes a
long time to notice when the connection dies.  As such, you prob=AD
ably want the ProtocolKeepAlives option as well.  However, this
means that connections will die if the route is down temporarily,
and some people find it annoying.

So there are a number of things that you can do with SSH itself.  I would
check into these for a solution.  TBH I can't see what ipfilter would have
done differently in this situation: it's not possible for a NAT device to
track connections indefinitely -- maybe the timeout was just large enough
that your users didn't notice before?


