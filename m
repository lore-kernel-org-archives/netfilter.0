From: "Jan Kaastrup" <jka@protego.dk>
Subject: PPTP and NAT
Date: Mon, 22 Dec 2003 13:52:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005801c3c88a$7d599210$2d64a8c0@pcjka>
References: <20031222104912.GH5058@obroa-skai.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031222104912.GH5058@obroa-skai.de.gnumonks.org>
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
To: 'Netfilter Mailinglist' <netfilter@lists.netfilter.org>

Hi
Are there anybody who has tried to connect with more than one client to
a poptop VPN server, where the clients come from the same global
ipadress? (doing SNAT)

There seems to be a problem when i do that.
I have solved the problem by putting another virtuel Ipaddress on the
Poptop server and then make the client connect to each individuel
Ipaddress, but it would really be nice if i could use the same.

Does anyone now where the problem is - on the poptop servers firewall
running iptables? or on the clients firewall (also running iptables)? . 
 
Maybe it is the protocol that doesn't allow it, but I am not sure?

Thanks a lot

Regards
Jan K


