From: Stefan Nehlsen <sn@ParlaNet.de>
Subject: Re: iptables with LDAP authentication
Date: Wed, 30 Apr 2003 15:40:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030430154006.A24267@ParlaNet.de>
References: <01CEA3A5B8B2D511890F0002A5870AEC0128AD79@EXCHANGE>
Reply-To: sn@ParlaNet.de
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <01CEA3A5B8B2D511890F0002A5870AEC0128AD79@EXCHANGE>; from khanh@slc.edu on Tue, Apr 29, 2003 at 09:05:32PM -0400
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Apr 29, 2003 at 09:05:32PM -0400, Khanh Tran wrote:
> Check out: 
> 
> http://www.linuxselfhelp.com/HOWTO/Authentication-Gateway-HOWTO/setup.html
> 
> Scroll down to the 3.2 section.  It has a link to a iptables PAM that
> supposedly will insert the proper iptables lines to allow the authenticated
> client access through the firewall.  Hope this helps...

How about using ippool?

Instead of using adding and deleting rules, it seems to be easier to me to
filter on pools.

Modifications will be made to the pools.

What is the status of the pool-stuff?

Does it work?

Is it in use?


cu, Stefan

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
> 

-- 
Stefan Nehlsen | ParlaNet Administration | sn@parlanet.de | +49 431 988-1260

