From: Ilguiz Latypov <ilguiz@nit.ca>
Subject: Re: Microsoft PPTP VPN server behind FIREWALL
Date: Tue, 25 Mar 2003 10:22:41 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0303251020440.25007-100000@localhost.localdomain>
References: <083201c2f2cf$a4fc85c0$6e69690a@rimas>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <083201c2f2cf$a4fc85c0$6e69690a@rimas>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Remus <rmocius@auste.elnet.lt>
Cc: netfilter@lists.netfilter.org


On Tue, 25 Mar 2003, Remus wrote:

> I tried to use this command to make a forward to itenal IP address:
> iptables -t nat -A PREROUTING -d $EXTERNALIP -p tcp --dport 1723 -j
> DNAT --to 192.168.1.150:1723
> But it doesn't work, I mean I cannot connect to my VPN server from outside.


The FAQ on PPTP NAT suggests to forward all IP packets of protocol 47
(GRE) in addition to the TCP port 1723 packets.

--
Ilguiz Latypov
Net Integration Technologies, Inc

tel. +1 (514) 281 9191 x 117



