From: Henry Baxter <henrybaxter@shaw.ca>
Subject: tracking usage by mac address
Date: Sun, 29 Aug 2004 19:42:27 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41329413.3080407@shaw.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

I have been reading this list for several months, and I've really 
enjoyed learning all that I have, thank you everybody for the 
opportunity to listen:)

Ultimately I am hoping to track the bandwidth usage of about 50 client 
computers through my router based on their MAC address. I understand 
that by simply writing a rule that does nothing to the packet, such as 
'iptables -A FORWARD -m <mac address>' I can parse the netfilter log and 
find out what I need. This seems rather convoluted though - getting 
netfilter to create a basically human readable log file, and then 
parsing it.

All of the network traffic is passing through unmanaged switches until 
finally hitting the interface on the router.

I'm sure this must have been done by many others before, so could 
anybody give me some idea of what the most common way to handle this 
situation would be?

I appreciate any input.

Henry Baxter

