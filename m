From: "Mark Weaver" <mark@npsl.co.uk>
Subject: RE: Bridging firewall setup
Date: Tue, 16 Dec 2003 19:31:46 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GFEPJIHHFOJDOFDMNAJDAEAGEKAA.mark@npsl.co.uk>
References: <3FDF465A.2020103@wavetex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FDF465A.2020103@wavetex.com>
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
To: Netfilter List <netfilter@lists.netfilter.org>

>
> This is a production machine so leaving logging on for extended periods 
> isn't an option since it would quickly fill up the logs. However I 
> turned in on briefly and even though using tcpdump I see constant 
> traffic through the bridge the logs only show traffic going in and out 
> to the bridge's IP that I have setup for maintenence, mostly my SSH 
> session. Any ideas how I can get it to see the traffic going through?
> 
You can filter tcpdump, e.g.:

tcpdump port not ssh

tcpdump -i eth0 port 135 and host a.b.c.d

tcpdump -p tcp -i any net a.b.c.d/e

Also man tcpdump, for more detail than you probably ever wanted.

