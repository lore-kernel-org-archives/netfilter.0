From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: DNS question
Date: Thu, 6 Feb 2003 17:05:48 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0302061700530.18403@dns.toxicfilms.tv>
References: <211E94403B74D211878A0008C71C74DC60DD2E@ip216-50-5-162.z5-50-216.customer.algx.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <211E94403B74D211878A0008C71C74DC60DD2E@ip216-50-5-162.z5-50-216.customer.algx.net>
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
To: Reed Wiedower <rwiedower@peyser.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

> I'm having some trouble with DNS queries making it through the filters...if
> I allow connections out to use udp port 53, that should allow clients inside
> the firewall to query external dns servers for information, correct? Do I
> need to open any other ports? (Of course, I have "related, established"
> open, so I assume the DNS server response will work properly). Am I missing
> somthing?
If a dns query via udp fails (or it has over 512 bytes, and the Trunacated
bit set), the resolver is obligated to commit the query via tcp.

In order to have dns queries working with external DNS servers, the
clients must be able to send tcp and udp with dport 53 to the servers,
and the replies must get back, e.g. using the state mechanism.

If you have a DNS server in your network and want to allow dns queries to
your server you need to allow both tcp and udp with dport 53 to your DNS.

Also, TCP is used for zone transfers.

If you fail to solve your problem, try tcpdumping the traffic on the
firewall, you will know what is being send, what is being block.

Regards,
Maciej Soltysiak


