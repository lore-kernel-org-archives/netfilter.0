From: Andreas Grabner <andi@vnc.at>
Subject: Re: nat/masquerade with kernel 2.6.x
Date: Sat, 11 Dec 2004 14:31:45 +0100
Message-ID: <20041211133145.GA3027@utanet.at>
References: <41BAEBD4.8080401@alu.umh.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41BAEBD4.8080401@alu.umh.es>
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

Hi

On Sat, Dec 11, 2004 at 01:45:08PM +0100, Antonio P=E9rez wrote:
>    iptables --table nat --append POSTROUTING --out-interface=20
> $ifc_internet -j MASQUERADE
> the hosts of the internal network can do ping to internet, and this is=20
> normal, but they can not open any web or conection the msn , they
> only can do ping. This is very stranger. I try the kernels=20
> 2.6.7,2.6.7,2.6.8 and 2.6.9 and they do no work.
You can ping so NAT and routing seems to work.
Are there any other rules in the FORWARD chain?=20

<try>
maybe you should check if DNS is working?
</try>

> Can somebody help me, please?
send more Info e.g. output of=20
iptables -L -nvx
iptables -t nat -nvx

> Sorry for my bad english.
me too ;-)


Andreas Grabner

