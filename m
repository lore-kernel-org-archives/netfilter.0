From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: udp port 135
Date: Thu, 14 Aug 2003 10:38:53 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0308141031330.12085@dns.toxicfilms.tv>
References: <001201c36225$e166d270$0401000a@sterenborg.info>
 <3F3B404A.7060400@belfordhk.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F3B404A.7060400@belfordhk.com>
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
To: cc <cc@belfordhk.com>
Cc: Rob Sterenborg <rob@sterenborg.info>, 'Netfilter Group' <netfilter@lists.netfilter.org>

> > No. I am interested too in why udp shows "open" from a foreign host,
Because it received no response.
> > while tcp shows filtered.
Because it received no response.

> > How can I check if an udp port is really closed/filtered or opened ?
For UDP, remotely you can only find out if it is closed (ICMP response
for close port) or filtered/open (No response at all)

> I'm completely stumped on this issue.
To completely graps it, you would have to make tests with tcpdump while
scanning your host with different decisions: REJECT, DROP , --reject-with
tcp-reset, etc...

I did it once, and I know exactly what will nmap say for what it receives.

Regards,
Maciej


