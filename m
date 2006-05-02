From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Obtain original address from redirected connection
Date: Tue, 02 May 2006 08:36:35 +0200
Message-ID: <e36ulj$omu$1@sea.gmane.org>
References: <20060502025450.73457687.pedro.werneck@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060502025450.73457687.pedro.werneck@terra.com.br>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Pedro Werneck wrote:
> I have a daemon, a sort of proxy, written in Python, who receives
> redirected connections with a rule like this:
> 
> iptables -t nat -A PREROUTING -j DNAT -p TCP -s source --to-destination host:port
> 
> The problem is that I need access to the original destination address,
> but I could not find a way to do that when I wrote the daemon.
[...]
> Is it possible to do this with SO_ORIGINAL_DST, or is there any other
> approach for obtaining the original address ?
> 

SO_ORIGINAL_DST works only on local REDIRECT. If you do NAT and run
proxy on the same machine use REDIRECT instead. Otherwise you need an
silly side channel for delivering original address. (Maybe create IP
tunnel betwean NATing machine and proxy machine and then REDIRECT this
traffic on proxy machine.)

- -- Petr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEVv3zuR4f4nEwzHIRArLeAKCAKSVvmKaQCe/pE5HDeHFc/Vw0swCfdy9Q
t8czUPh+btwIf1dEGKlp9/M=
=TbTl
-----END PGP SIGNATURE-----


