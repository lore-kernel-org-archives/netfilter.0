From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: FQDN filtering
Date: Tue, 30 Aug 2005 10:22:28 -0300
Message-ID: <43145D94.40707@solutti.com.br>
References: <20050830125809.68053.qmail@web52505.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050830125809.68053.qmail@web52505.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: rockey dada <rockeydada@yahoo.com>
Cc: netfilter@lists.netfilter.org


    Well .... yes it can and no it cannot.

    All rules can have FQDN instead of IPs. But FQDNs will be solved to 
IPs and rules will be created using IPs.

Rule:
iptables -A INPUT -s www.microsoft.com -j DROP

is completly valid, but will be translated to:

iptables -A INPUT -s 207.46.198.30 -j DROP
iptables -A INPUT -s 207.46.198.60 -j DROP
iptables -A INPUT -s 207.46.199.30 -j DROP
iptables -A INPUT -s 207.46.225.60 -j DROP
iptables -A INPUT -s 207.46.18.30 -j DROP
iptables -A INPUT -s 207.46.19.30 -j DROP
iptables -A INPUT -s 207.46.19.60 -j DROP
iptables -A INPUT -s 207.46.20.60 -j DROP

    when you hit the ENTER key or execute your firewall script. You will 
not see 'www.microsoft.com' if you do 'iptables -nL -v', you will only 
see the translated IP addresses. If FQDN changes IP addresses, iptables 
will not see that change because DNS query for searching IPs is done 
only when the rule is created.

    I think there's a limit on how many IPs iptables can handle for a 
single FQDN, but I dont know what this limit is.

    iptables seems to CANNOT have rules with FQDN and keep the FQDN 
instead of IPs.

    Anyway, filtering FQDNs seems to be nice on application level and 
not always on IP level. Are you thinking on web filtering ??? Why not 
using a http proxy (squid) for doing that ?? Are you thinking on SPAM 
fighting ?? Why not using your MTA capabilities for that ??

    Sincerily,
    Leonardo Rodrigues


rockey dada escreveu:

>Is there any way one can use IPTABLES to filter traffic based on "Fully
>Qualified Domain Names".
>
>Rgds
>
>  
>

