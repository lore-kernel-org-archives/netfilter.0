From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Filtering MAC addresses and Multicast
Date: Wed, 02 Aug 2006 14:12:44 +0200
Message-ID: <44D096BC.2030102@freemail.hu>
References: <44CF1266.5090109@estudiants.urv.cat>
	<44CFB3EE.2010007@rtij.nl>	<44D05188.3040506@estudiants.urv.cat>	<44D052DD.3060103@rtij.nl>
	<44D0731A.4070507@freemail.hu> <44D09298.20503@estudiants.urv.cat>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44D09298.20503@estudiants.urv.cat>
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
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Gerard Par=EDs Aixal=E0 wrote:
> I tried this.
> And this:
> iptables -t mangle -I PREROUTING -d 225.0.0.4 -j DROP       #=20
> 225.0.0.4 is the multicast address
> iptables -t mangle -I PREROUTING -j DROP
> But the multicast traffic still arrives at the destination computer.
How do you know that the traffic arrives ??? :) If you see it with some=20
sniffer programs (tetheral) then that is fake because those programs see=20
the packets BEFORE they reach the filtering system.
You can not tell a packet not to enter your network card... :D

BTW.: What does the counters of the packets matching your rules says ???=20
(iptables -L -v -n -t mangle)

