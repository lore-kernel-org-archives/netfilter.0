From: Bjorn Ruberg <bjorn@ruberg.no>
Subject: RE: Ip Forwarding
Date: 23 Feb 2003 04:43:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045971783.7040.16.camel@mikke>
References: <000501c2da82$bc93ed50$0200a8c0@grandaddy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c2da82$bc93ed50$0200a8c0@grandaddy>
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

On Sat, 2003-02-22 at 15:57, William Olbrys wrote:
> Was this too complicated? Heh that's why I wrote such a generic
> questions
>=20
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of William Olbrys
> Sent: Friday, February 21, 2003 7:48 PM
> To: netfilter@lists.netfilter.org
> Subject: RE: Ip Forwarding
>=20
> Well I want to put a windows 2000 domain controller behind my
> iptables-enabled redhat 8 box. The domain controller had a static ip
> before it went behind the firewall and for Active Directory to work
> correctly it HAS to stay that way. I spent days and days trying
> otherwise but windows is far too stubborn. AD plus legacy support for
> WINS makes nat translation a living hell. So I simply set up all my
> rules as default accept and let it fly, hoping that the forwarding would
> take care of itself. Essentially it did! I could perform simple function
> like connecting to the internet but I couldn't do more important
> functions like cruise the windows network or have things join/leave/see
> the domain behind this iptables enabled box.  I thought it had something
> to do with routers not seeing the right ip address as it leaves the
> iptables box or the routers not being able to find its way back to this
> box behind the firewall.
>=20
> It struck that while I wrote this complicated email I may have come up
> with a solution. Since the static IP of the win2k box is the same and
> only the gateway has changed, then the data it sends will be legitimate
> concerning it's IP address(not an internal IP). Could I create an alias
> at the outbound NIC level for the win2k's IP address and SNAT packets
> leaving the outbound NIC that originated from the win2k box?

Generic questions get generic answers, and that is not what you need.

Your questions are not complicated (and the email is definitely not),
just obscure.

To cut to the chase:

You do not say anything about what kind of network you use behind your
Linux firewall.

If we assume you use a private network (192.168.*.*, 172.16.*.*,
10.*.*.* or similar) of course nothing on the outside will be able to
connect to your Windows server - simply because they don't know they
need to connect to it through your Linux server. This is a routing
issue. A significant fact about NATed networks is that there are no way
anything on the outside will know that given resources are behind the
NATing firewall.

If you are still using an IP dedicated to your Windows server but on
another IP network, consider it pure luck that anything works at all.

If you want to get serious answers from this list, you need to distinct
between what matters (e.g. your IP network and your routing tables) and
what does not matter at all (e.g. how many days you tried beating sense
into Microsoft products). Provide a network diagram explaining your
configuration and any problems related to it. Trying to parse your
message, however, makes me think that you need to read up on IP routing
before you try anything more complicated.

And, by the way, please read the netfilter documentation. It's available
on http://www.netfilter.org/documentation/.

Bj=F8rn


