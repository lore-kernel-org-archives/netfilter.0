From: "Leonardo Rodrigues" <leolistas@solucoesip.net>
Subject: Re: IP Traffic Accounting
Date: Sat, 22 Jun 2002 11:58:16 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <002d01c219fd$b2035ba0$3201a8c0@leonardo>
References: <NFBBLDBMIDIOFPBNLEAJCEIOCHAA.yomega@wahooo.net> <20020622100049.32188874.eelf@sympatico.ca> <20020622140903.YSRU2755.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org


    Usually, when you need to read traffic counters on iptables/ipchains,
you create what we called an 'accounting rule', that means, a rule that
matchs what you need it to match but it has NO action.

    example: iptables -A forward -p tcp --dport 25

this will create a rule that will only count packets/bytes and does not with
it. Of course if you need to allow/deny it, you'll need to deny/allow it
latter on another rule.

    So, if person has one rule for accounting and other for allow/deny the
packet, it can be counted YES in two different places. But this will happen
ONLY IF we have an accounting rule for it, that means, a rule that does
nothing but count the packet.

    If you're getting the counters directly on the ACCEPT/DENY rule, you'll
really dont have problems on packets being counted twice, because after
reaching the accept/deny rule packet will stop trying to be matched on other
rules.

    Sincerily,
    Leonardo Rodrigues

----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.samba.org>
Sent: Saturday, June 22, 2002 11:09 AM
Subject: Re: IP Traffic Accounting


>
> I'm not sure I agree with this - I believe the byte / packet counters only
> count packets matched by the rule, so that if you have the rules:
>
> iptables -A FORWARD -p tcp --dport 25 -j ACCEPT
> iptables -A FORWARD -p tcp --dport 110 -j ACCEPT
>



