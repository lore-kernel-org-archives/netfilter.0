From: Nox <pheusion@snet.net>
Subject: Re: why must linux for halted firewall?
Date: Tue, 16 Sep 2003 15:33:36 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063740816.11520.29.camel@shaolin.gridlocksecurity.com>
References: <BAY8-F93kuutSgcOrBL0000ec1b@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY8-F93kuutSgcOrBL0000ec1b@hotmail.com>
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
To: Chua Boon Ping <nitb@hotmail.com>
Cc: netfilter@lists.netfilter.org

For us,
We have a runlevel 0 firewall, from Debian
it was developed in house, fine tuned by this article:

http://www.samag.com/documents/s=1824/sam0201d/0201d.htm

For us, this FW protects a Bioinformatics cluster,
which rarely changes on the rules side of things,
the benefit form our standpoint is the non-access into the machine,
(No user priv escalation due to no logon)
the drawback is we currently have no logging enabled.
(We are working on it.

Hope that helps

Nox
GenMicro systems
Bioinformatics applications and devices
(Website in development)

On Sun, 2003-09-14 at 23:16, Chua Boon Ping wrote:
> dear all,
>    I am newbie in open source and recently i am busy on some assignment 
> concerning "why opts for Linux(netfilter/iptables) rather than OpenBSD to 
> implement a Halted Firewall". actually, can OpenBSD be halted just like 
> Linux kernel do? As i mentioned, i am newbie and would like have some 
> guidance from you guys. Thanks.
> 
> Chua
> 
> _________________________________________________________________
> Using a handphone prepaid card? Reload your credit online! 
> http://www.msn.com.my/reloadredir/default.asp
> 
> 


