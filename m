From: "Alex Nee" <hard__ware@dynamicaccess.biz>
Subject: Re: iptables with LDAP authentication
Date: Tue, 29 Apr 2003 13:54:15 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001301c30e03$00a267c0$7b7b10ac@hardware>
References: <000101c30c8e$1d885870$0200a8c0@klintan.local>        <1051440156.5938.118.camel@tux.rsn.bth.se> <33580.196.1.114.224.1051533291.squirrel@unipune.ernet.in>
Reply-To: "Alex Nee" <alex@dynamicaccess.biz>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "lists.netfilter" <netfilter@lists.netfilter.org>

Would It be possible to maybe get an LDAP server to Inject
Rules as needed via a SSH Tunnel into the Gateway as people were
authenticated ...

then as for quotas use the ipt_quota PoM patch (works well for me)
there is also talk on the developer IRC channels that ipt_quota maybee
getting
a hard & soft limit options aswell, so established & related connections
wont be hard cut off at the limit
effectivelly allowing 'allot' of clients to finnished there web surfing ect
before they get cut off permantly .(until a quota resets or an admin renews
it for them)

----- Original Message -----
From: "Yogesh Subhash Talekar" <yogesh@unipune.ernet.in>
To: <netfilter@lists.netfilter.org>
Sent: Monday, April 28, 2003 10:34 PM
Subject: iptables with LDAP authentication


> hi,
>
> I have a full Class C real IP network. All department have their own Linux
> servers and the last IP (X.X.X.254) is given to the CISCO router which is
> our gateway to Internet. Currently i have a OpenBSD firewall configured as
> bridge with IP-filter.
>
> Now I want to go with Linux firewall, if it will have following features:
>
> 1. It will run IP-tables firewall and will authenticate everyone (rather
> each session for each type of service .. http, ftp, ssh etc.) against the
> central LDAP server which is on some other server.
>
> 2. It will put on bandwidth restriction on each campus departmental
> server. (it is possible with tc/qdisc)
>
> All I want to know is ... is it possible to authenticate the traffic
> flowing thro' a Linux ip-tables bridging firewall against a central
> OpenLDAP database?
> Will it maintain the sessions for each user separately for HTTP (Squid?),
> FTP and telnet or ssh ? Is it possible to log per head traffic and ban
> them if the exceed some limit (say 200 MB per month).
>
> Any suggestions/ links / advice will be highly appriciated.
>
> thanks in advance
>
> --yogesh



