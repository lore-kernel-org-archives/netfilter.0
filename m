From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Iptables rule on span traffic
Date: Mon, 23 Apr 2007 07:25:11 +0200
Message-ID: <462C4337.1060508@rtij.nl>
References: <E8AFFEFDBE97C94E9297963F0527A07B01DFAED8@pmi00exf00.us.packetmotion.com>	<1177172639.25008.1.camel@anduril.intranet.cartel-securite.net><E8AFFEFDBE97C94E9297963F0527A07B01DFB0EC@pmi00exf00.us.packetmotion.com>	<462A8014.6000105@plouf.fr.eu.org>
	<E8AFFEFDBE97C94E9297963F0527A07B01DFB16F@pmi00exf00.us.packetmotion.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E8AFFEFDBE97C94E9297963F0527A07B01DFB16F@pmi00exf00.us.packetmotion.com>
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
To: "Krishnamoorthy (Siva) Sivakumar" <ksivakumar@packetmotion.com>
Cc: netfilter@lists.netfilter.org, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>

Krishnamoorthy (Siva) Sivakumar wrote:
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-bounces@=
lists.netfilter.org] On Behalf Of Pascal Hambourg
> Sent: Saturday, April 21, 2007 2:20 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Iptables rule on span traffic
>
> Hello,
>
> Krishnamoorthy (Siva) Sivakumar a =E9crit :
>   
>> When I run this rule, and try to access a .txt file (with a web
>> browser on a different machine) on the machine running the iptables, =
I
>> get a log message and the file access is blocked. However, if I try t=
o
>> do the same but for a .txt file residing on a third machine (machine
>> running iptables is able to see the related packets on its interface
>> connected to the span port), I see no log or blocking. 
>>     
>
> As C=E9dric said, packets which are not destined to the box do not go 
> through the INPUT chains. And since the box is not forwarding traffic,=
 
> these packets are dropped at the input routing decision stage and do n=
ot 
> go through the FORWARD chains either.
>
> [Siva:] 
> Then is it true that for iptables rules to be effective (fwsnort gener=
ated or otherwise), the machine must be "inline". Is there no way to imp=
lement iptables rules on "mirrored" traffic. 
>
> Siva
>
>   

You could try to turn on forwarding and block all traffic that makes it 
through the snort rules.

HTH,
M4


