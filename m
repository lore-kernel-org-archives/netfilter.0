From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Various questions
Date: Mon, 28 Jul 2003 08:36:39 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E0D@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: =?iso-8859-1?Q?Ant=F3nio_Godinho?= <to@mail.isec.pt>, netfilter@lists.netfilter.org

=09
>	Is it possible to DROP all those IP's in one rule? ( I don't
>need to log them since they are invalid anyway )


Ideally this is done for you with /proc/sys/net/ipv4/conf/*/rp_filter =
=3D=3D 1 or 2. Basically it says that if a packet enters the interface =
with an ip address that is not on the subnet associated with it, then =
just drop the packet. That said, I don't see how these rules would =
seriously determent performance that much.

>	RETURN isn't a user defined chain, and I don't see any info
>about this on the how-to's, can someone explain me what that does?

RETURN means return to the chain that called it, so

iptables -A INPUT -j MYCHAIN=20
iptables -A MYCHAIN -j RETURN (Returns back to the INPUT chain)


>	3. This is defining priority ports? Like shaping the traffic?

yes

>	3. Since all my traffic from intranet to gateway loc2fw chain
>it's from trusted ip's ( it's from me or any member of my famely ),
>that's one of the things I can remove, anyone has any other advice or
>improvent to the listo f rules I've bellow?

If you are memory bound, these will not help you much. If your memory is =
really the contention, then try lowering the timeouts for things like =
established or unreplied connections, etc.. these things are what takes =
up the memory.

