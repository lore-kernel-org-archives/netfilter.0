From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Redirecting outgoing SMTP from LAN to another LAN server
Date: Thu, 29 Apr 2004 10:59:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040429095949.GB22172@acentral.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hullo :)

I'd like to do $SUBJECT, but after much playing with commands like

iptables -t nat -A PREROUTING -p tcp -i eth1 --dport 25 -j DNAT --to 10.0.0.253:25

I have given up and have come to you fine people for help...

My LAN is on eth1, with WAN on eth0. The gateway machine is 10.0.0.254 doing masq for 
LAN clients, but I'd like to send any outgoing SMTP connections to 10.0.0.253 - alas 
any time I've tried, I just end up killing ALL outgoing SMTP :(

Any suggestions warmly received!

Cheers,
Gavin.

