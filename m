From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forwarding
Date: Tue, 18 May 2004 16:51:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405181651.16999.Antony@Soft-Solutions.co.uk>
References: <7528A97D83FBD411BEF40003471B905B05D8FEF7@smtp.retecal.es>
Reply-To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7528A97D83FBD411BEF40003471B905B05D8FEF7@smtp.retecal.es>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Tuesday 18 May 2004 4:33 pm, CPD - David Carde=F1osa Rubio wrote:

> HI!
>
> if you add
>
> iptables -t nat -A PREROUTING -d 192.168.0.1 -p tcp --dport 8080 \
>     -j DNAT --to-destination 192.168.0.2:80
>
> you need
>
> iptables -t nat -A POSTROUTING -s 192.168.0.2 -p tcp --dport 80 -j SNAT
> --to 192.168.0.1:8080

No, you don't.

Netfilter handles the reverse-natting of reply packets transparently - yo=
u do=20
not need to specify your own rule for them.

The only reason you would want both the above rules is when you want a ma=
chine=20
accessible on a translated IP address, and you also want *new* connection=
s=20
from that machine to come from the translated address.   In both cases yo=
u=20
specify the rule for the "forward" packets, and the "return" packets get=20
handled by netfilter.

Regards,

Antony.

--=20
"640 kilobytes (of RAM) should be enough for anybody."

 - Bill Gates

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


