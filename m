From: "Yogesh Subhash Talekar" <yogesh@unipune.ernet.in>
Subject: iptables with LDAP authentication
Date: Mon, 28 Apr 2003 18:04:51 +0530 (IST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33580.196.1.114.224.1051533291.squirrel@unipune.ernet.in>
References: <000101c30c8e$1d885870$0200a8c0@klintan.local>
        <1051440156.5938.118.camel@tux.rsn.bth.se>
Reply-To: yogesh@unipune.ernet.in
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051440156.5938.118.camel@tux.rsn.bth.se>
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

hi,

I have a full Class C real IP network. All department have their own Linux
servers and the last IP (X.X.X.254) is given to the CISCO router which is
our gateway to Internet. Currently i have a OpenBSD firewall configured as
bridge with IP-filter.

Now I want to go with Linux firewall, if it will have following features:

1. It will run IP-tables firewall and will authenticate everyone (rather
each session for each type of service .. http, ftp, ssh etc.) against the
central LDAP server which is on some other server.

2. It will put on bandwidth restriction on each campus departmental
server. (it is possible with tc/qdisc)

All I want to know is ... is it possible to authenticate the traffic
flowing thro' a Linux ip-tables bridging firewall against a central
OpenLDAP database?
Will it maintain the sessions for each user separately for HTTP (Squid?),
FTP and telnet or ssh ? Is it possible to log per head traffic and ban
them if the exceed some limit (say 200 MB per month).

Any suggestions/ links / advice will be highly appriciated.

thanks in advance

--yogesh




