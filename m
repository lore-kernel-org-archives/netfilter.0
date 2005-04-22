From: Mariusz Kruk <Kruk@epsilon.eu.org>
Subject: Re: route all internet traffic through dummy device?
Date: Fri, 22 Apr 2005 09:59:14 +0200
Message-ID: <20050422075914.GA27193@epsilon.rdc.pl>
References: <21722.212.18.18.20.1114156139.squirrel@212.18.18.20>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <21722.212.18.18.20.1114156139.squirrel@212.18.18.20>
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

On Fri, Apr 22, 2005 at 09:48:59AM +0200, Andreas Mimz wrote:
> I'm trying to route all internet traffic through a dummy network device=
.
> Unfortunately, I wasn't able to do that yet :-(

I used a tunnel between dwo different addresses on loopback device (ie.
127.0.0.2 and 127.0.0.3) and policy routing which puts everything from
outside to one end of the tunnel and from the inside into another end
(in my setup it works bi-directionaly - another hop is added for packets
traveling both ways).
If anyone is interested in more detailed description, I will gladly
provide info.

--=20
/\-\/\-\/\-\/\-\/\-\/\-\/\ Bie=BF=B1cy dysk nie jest ju=BF by=E6 prawid=B3=
owy(MS-
\  Kruk@epsilon.eu.org   / DOS7.0)
/ http://epsilon.eu.org/ \=20
\/-/\/-/\/-/\/-/\/-/\/-/\/=20

