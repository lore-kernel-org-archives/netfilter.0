From: Wladimir Mutel <mwg@mwg.dp.ua>
Subject: Re: iptables PPTP tunneling
Date: Tue, 21 Jun 2005 10:49:04 +0300
Message-ID: <20050621074904.GB5383@mwg.dp.ua>
References: <20050620185220.GA9417@mwg.dp.ua>
	<20050620223526.GC23109@obroa-skai.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050620223526.GC23109@obroa-skai.de.gnumonks.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Harald Welte <laforge@netfilter.org>, Netfilter Mailinglist <netfilter@lists.netfilter.org>

	Dear Mr. Welte,

	Thank you a lot for your explainations. I found that I was wrong
	thinking that client sends GRE packets first. I just looked at
	tcpdump timestamps more closely. So your advices are very useful
	for us.

> If you want to make it work, you have two options
> 
> 1) to configure a DNAT rule for GRE,
> DNAT'ing all incoming GRE packets from the server to your internal PPTP
> client.

	You mean something like this :

iptables -t nat -A PREROUTING -d tag -p gre -j DNAT --to 192.168.58.2

	('tag' is my external IP configured on eth0, under which all is
	masqueraded). I added this rule and it really helped!

> 2) to configure your NAT box to silently DROP incoming GRE packets with
> state "NEW".  This way you basically ignore the first packet(s) from
> server->client and wait for the client->server packet to set up the
> connection.

	Something like this ?

iptables -t nat -A PREROUTING -p gre -m state --state new -j DROP

	May be I should test this rule later, as the first one works
	well now.

