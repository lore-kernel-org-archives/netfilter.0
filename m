From: xchris <lyra@fastwebnet.it>
Subject: Re: redirection
Date: Wed, 9 Apr 2003 11:13:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304091113.48665.lyra@fastwebnet.it>
References: <7497DCA1C240C042B28F6657ADFD8E09268773@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7497DCA1C240C042B28F6657ADFD8E09268773@i2km11-ukbr.domain1.systemhost.net>
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

On Wednesday 09 April 2003 10:40 am, you wrote:
> You do infact need DNAT and not SNAT
>
> iptables -t nat -A PREROUTING -p tcp -m tcp --dport 80 -j DNAT
> --to-destination x.y.z.2:80
>
> this should work.


I tried but all connections go in timeout.
I first flushed every chain,set default policy everywhere,and then added =
DNAT=20
rule...

no result...

The strange thing is :
if i DNAT on another interface everything is ok.
if i DNAT through the incoming connection interface... it fails.

strange...
I think i miss something..
Thank you
Chris

