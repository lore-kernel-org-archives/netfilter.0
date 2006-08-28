From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: conntrack questions
Date: Mon, 28 Aug 2006 15:27:56 +0200 (CEST)
Message-ID: <61547.193.173.147.3.1156771676.squirrel@webmail.sterenborg.info>
References: <2100.192.168.150.209.1156766973.squirrel@www.zhnet.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2100.192.168.150.209.1156766973.squirrel@www.zhnet.hu>
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

On Mon, August 28, 2006 14:09, kako@zhnet.hu wrote:
...
> 1, Can I somehow limit every clients to establish (for example) only 30
> active connections?

If I remember correctly, you can do that using the connlimit patch :
http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-co=
nnlimit

"This adds an iptables match which allows you to restrict the number of
parallel TCP connections to a server per client IP address (or address
block)."

I'm not sure if, when you specify an address block, it still limits
connections per source IP.. Maybe someone else knows this for sure or you=
 can
try it yourself.


Gr,
Rob



