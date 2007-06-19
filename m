From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: syn DDoS attack solution
Date: Wed, 20 Jun 2007 01:02:52 +0200
Message-ID: <4678609C.7020505@plouf.fr.eu.org>
References: <465EF582.4070904@bgs.hu>	<015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>	<465FEA82.709@bgs.hu>	<007101c7a45d$bc50e380$34f2aa80$@COM>	<466090CA.2050806@rtij.nl>	<Pine.LNX.4.64.0706191422070.29334@darkstar.sysinfo.com>
	<f59kpi$1vs$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f59kpi$1vs$1@sea.gmane.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Robert Nichols a =E9crit :
> R. DuFresne wrote:
>>
>> On Fri, 1 Jun 2007, Martijn Lievaart wrote:
>>>
>>> An connection is in the ESTABLISHED state once a packet has been=20
>>> seen. So once the SYN is seen, the state is ESTABLISHED.
>>
>> No, it is in state "new" with a mere syn sent.

Correct.

> You have to specify whether you are talking about the TCP connection
> status or the conntrack status.  A mere SYN is sufficient to make an
> ESTABLISHED status in conntrack.

Nope. The ESTABLISHED state is reached when traffic has been seen in=20
both "directions" (original and reply).

> If that were not true, then when
> I send a TCP SYN packet the SYN/ACK would never make it back through
> my firewall.

Why not ? The connection goes into the ESTABLISHED state as soon as the=20
SYN/ACK is seen, and this state applies to the SYN/ACK packet itself.

