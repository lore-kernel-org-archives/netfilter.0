From: "GBV" <guilherme@plannercorretora.com.br>
Subject: [expert] Two internet interfaces load balance
Date: Tue, 15 Apr 2003 11:44:42 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <021001c3035d$8cb30450$6800817d@guilherme>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: *netfilter <netfilter@lists.netfilter.org>

Hi all,

I=B4m using Debian 2.4.18, standing to compile 2.4.20 with advanced routi=
ng
options..

I have an ADSL 512/128 connection on eth0 and a dedicated optic fiber
256/256 on eth2 and my local interface is eth1.

I need to load balance or at least use this two internet ifaces at the sa=
me
time. When a bring the two interfaces up I, neither of them works... when=
 I
switch this two ifaces there are DNS problems since this two ifaces uses
different DNS servers..


How can I use this two ifaces at the same time, without errors?
What options should I enable in kernel configuration?
And about the DNS?

Can I do something like use eth2 just for published internet services, an=
d
eth0 for normal internet access?

What Tools I need and how to use then?

Thanks...

Guilherme B. Viebig

 1. manipula=E7=E3o de rede maliciosa: tentativa bem sucedida ou n=E3o de=
 acessar
informa=E7=F5es sigilosas, indisponibilizar servi=E7os, e qualquer tipo d=
e a=E7=E3o
n=E3o documentada e fornecida pela vitima.




