From: xchris <lyra@fastwebnet.it>
Subject: Re: redirection
Date: Wed, 9 Apr 2003 12:25:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304091225.21246.lyra@fastwebnet.it>
References: <7497DCA1C240C042B28F6657ADFD8E09268774@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7497DCA1C240C042B28F6657ADFD8E09268774@i2km11-ukbr.domain1.systemhost.net>
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
To: dhiraj.2.bhuyan@bt.com, netfilter@lists.netfilter.org

On Wednesday 09 April 2003 12:03 pm, dhiraj.2.bhuyan@bt.com wrote:
> try one thing - flush all rules and add the rule
> iptables -t nat -A PREROUTING -p tcp -m tcp --dport 80 -j DNAT
> --to-destination x.y.z.2:80
>
> I have a feeling that you are doing something in the POSTROUTING chain
> which is why you are not getting the right result. Or maybe you have a =
rule
> to drop the packet defined?
>

nope.

i flushed everithing!
all tables cleared.

i added only the DNAT line...
but it still doesn't work.
thank you

P.S.:I don't understand why if i use an ip of another interface it works.=
 (a=20
classic DNAT to dmz)


