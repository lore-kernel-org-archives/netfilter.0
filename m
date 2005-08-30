From: InfoMail <infomail@nobarrier.co.za>
Subject: Re: FQDN filtering
Date: Tue, 30 Aug 2005 17:22:17 +0200
Message-ID: <431479A9.40105@nobarrier.co.za>
References: <20050830125809.68053.qmail@web52505.mail.yahoo.com>
	<43145D94.40707@solutti.com.br>
Reply-To: infomail@nobarrier.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43145D94.40707@solutti.com.br>
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
To: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solutti.com.br>
Cc: rockey dada <rockeydada@yahoo.com>, netfilter@lists.netfilter.org


this is the rule and below is the error .. is this ment to work

$IPTAB -A OUTPUT -p tcp -o eth0 -s 0/0 -d www.microsoft.com -j DROP
##$IPTAB -A FORWARD -s 0/0 -d www.microsoft.com -m state --state NEW -j D=
ROP


starting rules for NATing
iptables v1.2.11: host/network `www.microsoft.com' not found
Try `iptables -h' or 'iptables --help' for more information.


Leonardo Rodrigues Magalh=E3es wrote:

>
>    Well .... yes it can and no it cannot.
>
>    All rules can have FQDN instead of IPs. But FQDNs will be solved to=20
> IPs and rules will be created using IPs.
>
> Rule:
> iptables -A INPUT -s www.microsoft.com -j DROP
>
> is completly valid, but will be translated to:
>
> iptables -A INPUT -s 207.46.198.30 -j DROP
> iptables -A INPUT -s 207.46.198.60 -j DROP
> iptables -A INPUT -s 207.46.199.30 -j DROP
> iptables -A INPUT -s 207.46.225.60 -j DROP
> iptables -A INPUT -s 207.46.18.30 -j DROP
> iptables -A INPUT -s 207.46.19.30 -j DROP
> iptables -A INPUT -s 207.46.19.60 -j DROP
> iptables -A INPUT -s 207.46.20.60 -j DROP
>
>    when you hit the ENTER key or execute your firewall script. You=20
> will not see 'www.microsoft.com' if you do 'iptables -nL -v', you will=20
> only see the translated IP addresses. If FQDN changes IP addresses,=20
> iptables will not see that change because DNS query for searching IPs=20
> is done only when the rule is created.
>
>    I think there's a limit on how many IPs iptables can handle for a=20
> single FQDN, but I dont know what this limit is.
>
>    iptables seems to CANNOT have rules with FQDN and keep the FQDN=20
> instead of IPs.
>
>    Anyway, filtering FQDNs seems to be nice on application level and=20
> not always on IP level. Are you thinking on web filtering ??? Why not=20
> using a http proxy (squid) for doing that ?? Are you thinking on SPAM=20
> fighting ?? Why not using your MTA capabilities for that ??
>
>    Sincerily,
>    Leonardo Rodrigues
>
>
> rockey dada escreveu:
>
>> Is there any way one can use IPTABLES to filter traffic based on "Full=
y
>> Qualified Domain Names".
>>
>> Rgds
>>
>> =20
>>


______________________________________
XamimeLT - installed on mailserver for domain @nobarrier.co.za
Queries to: postmaster@nobarrier.co.za

