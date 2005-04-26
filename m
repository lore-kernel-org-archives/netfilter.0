From: Jason Opperisano <opie@817west.com>
Subject: Re: define what to nat
Date: Tue, 26 Apr 2005 14:32:02 -0400
Message-ID: <20050426183202.GA18758@bender.817west.com>
References: <200504261317.29179.gnicolax@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200504261317.29179.gnicolax@gmail.com>
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

On Tue, Apr 26, 2005 at 01:17:28PM -0500, Nicol=E1s Vel=E1squez O. wrote:
<--snip-->
> So I was wondering if there is a way to do something like:
> iptables -t nat -A POSTROUTING -o eth0 -d 192.168.0.0/24 -j "DO NOT NAT=
"

yes:

  iptables -t nat -A POSTROUTING -o eth0 -d 192.168.0.0/24 -j ACCEPT

> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

-j

--
"Brian: Peter, did you read the fine print on this loan contract?
 Peter: If by "read", you mean "imagine the naked lady", then yes."
        --Family Guy

