From: "Martijn Lievaart" <netfilter.at.list.samba.org@rtij.nl>
Subject: Re: z-newnat16 - Implementation of the new nat API for 
     kernel2.4.19-pre4 and above.
Date: Wed, 23 Oct 2002 16:14:15 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <11127.212.136.9.239.1035382455.squirrel@webmail.xs4all.nl>
References: <000a01c27a00$26e18de0$3200a8c0@dualcon.com.br> 
     <1035325948.10494.24.camel@elendil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1035325948.10494.24.camel@elendil>
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
To: Juliano Dapper <juliano@dualcon.com.br>, netfilter@lists.netfilter.org

Cedric Blancher zei:

> Le mar 22/10/2002 =E0 21:20, Juliano Dapper a =E9crit :
>> I Have problems after compile kernel 2.4.19 with patch-o-matic20020825=
,
>> option z-newnat16.
>> After compile and restart my linux box, i try insert basic rule:
>> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE and result is:
>> ARGUMENT INVALID
>> My iptables is version 1.2.7a and kernel 2.4.19.
>

I had the same problem. Turned out I did not compile the userspace tools
against this new kernel. Doing so solved the problem.

HTH,
Martijn Lievaart


