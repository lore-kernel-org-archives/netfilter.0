From: Jason Opperisano <opie@817west.com>
Subject: Re: NAT  ONE-TO-ONE or FULL NAT
Date: Wed, 15 Jun 2005 13:57:16 -0400
Message-ID: <20050615175716.GA24316@bender.817west.com>
References: <963D966FFE3FA84FA239605E9E0297FC02CE896F@SPEMEN08.icetel.ice>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <963D966FFE3FA84FA239605E9E0297FC02CE896F@SPEMEN08.icetel.ice>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Wed, Jun 15, 2005 at 09:35:17AM -0600, Gonz=E1lez Sandoval Luis Roland=
o wrote:
> =20
> I'm looking information about one to one NAT and his configuration whit=
 IPTABLES v1.2.7a.=20
> =20
> My requirements are:
> 1.	Map IP address for the segment 10.129.41.0/24 for an IP address of 1=
92.168.20.0/24

have you looked at the NETMAP target from PoM?

  http://netfilter.org/patch-o-matic/pom-base.html#pom-base-NETMAP

-j

--
"Lois: So he just left without saying anything?
 Peter: All I asked him to do was buy some peanuts and cracker jacks.
 Brian: I don't care if he ever gets back. I wasn't being cute. I
 really hope he's dead."
        --Family Guy

