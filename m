From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Path to configure stateless DNAT with iptables ?
Date: Wed, 2 Oct 2002 22:10:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021002211008.SCLE28874.mta06-svc.ntlworld.com@there>
References: <20021002203429.512C2681B4@engenho.terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021002203429.512C2681B4@engenho.terra.com.br>
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
To: netfilter@lists.netfilter.org

On Wednesday 02 October 2002 9:34 pm, Rodrigo Senra wrote:

>  I need to do DNAT changing destination to a single
>  ip-address for every non-marked packet.

Sounds easy enough...

>  I mark the packets in mangle table, I DNAT in nat table...
>  that would suffice but I need it to be stateless instead of
>  stateful! Tolerating conntrack overhead (in my case) is too
>  expensive.

Why do you say that ?

1. What overhead is connection tracking adding to simple stateless DNAT ?

2. How do you propose to handle SNAT of reply packets if you turn off 
connection tracking (is the overhead of this acceptable) ?

3. What sort of machine do you have and what volume of packets are you trying 
to shovel through it ?

>  The question is...how can I disable conntrack for DNAT ?

Well, you can simply disable connection tracking, but that will affect more 
than just DNAT...

>  (a) there is a secret switch ? (not very likely ;o)

Yes - the switch is whether you say Yes or No to the question "Connection 
Tracking ?" when you comple your kernel :-)

I'm intrigued as to what you are doing and why you think connection tracking 
is generating too much overhead on your machine to be acceptable.

Antony.

-- 

G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

