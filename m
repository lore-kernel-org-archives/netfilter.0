From: "Preston Wade" <Preston_Wade@hilton.com>
Subject: RE: block yahoo messenger
Date: Wed, 26 Feb 2003 10:02:27 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0B2759D401C1D211ACA500805FFE2C3F0860BEE1@cmxserv3.hilton.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

I had this same problem and realized that other servers on those nets
provided news articles that some of my users wanted to read.  I feel like
Corp America should ask Yahoo to publish a list of servers used to support
Instant Messaging.  Actually MSN and AOL should do the same.

Just my 2 cents.

Thanks,
Preston

-----Original Message-----
From: Rob Sterenborg [mailto:rsterenborg@xs4all.nl]
Sent: Wednesday, February 26, 2003 8:50 AM
To: netfilter@lists.netfilter.org
Subject: RE: block yahoo messenger


> hi all,
> does anyone have an idea about blocking "yahoo messenger" 
> using iptables? thanks afshin

Maybe it's quite rude to block 4 /24 nets, but Messenger kept connecting
in these ranges and on different ports (5050, 23, 80) so I just did this
:

iptables -A FORWARD -d 216.136.223.0/24 -j REJECT --reject-with
tcp-reset
iptables -A FORWARD -d 216.136.224.0/24 -j REJECT --reject-with
tcp-reset
iptables -A FORWARD -d 216.136.227.0/24 -j REJECT --reject-with
tcp-reset
iptables -A FORWARD -d 216.136.233.0/24 -j REJECT --reject-with
tcp-reset

Of course you are welcome to find out exactly what servers Messenger
using to block them individually ; I didn't take the time to do that.


Gr,
Rob




