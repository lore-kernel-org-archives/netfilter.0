From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: sniffing the forwarded packets
Date: Mon, 10 Mar 2003 17:13:49 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007401c2e752$53e02c10$3864a8c0@discmail.com>
References: <ABEKJILKOKKGGDJKHKDFMECCCAAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ABEKJILKOKKGGDJKHKDFMECCCAAA.patrick@vikus.com>
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
To: 'Patrick Ahler' <patrick@vikus.com>, 'netfilter EMAIL' <netfilter@lists.netfilter.org>

'sniffing' usually refers to listening on a specific interface - that's
why the tools you tried, do that.

I have found that by first declaring what I am looking for, I can
usually get a good idea of it by tcpdump, etc.  In other words - if I
want to know who from my LAN 192.168.0.* is going where, I look at the
internal interface and grep for port 80:
tcpdump -i eth0 port 80

If I need to know why an IPSec tunnel isn't coming up, I look at the
external interface and grep for those packets:
tcpdump -i eth2 port 500

I used to use ksnuffle to dump all the daily packets on the inside LAN
going to 80 to a file and then did some grepping through for a report of
internet usage; now I redirect port 80 to squid and use squid data files
for my reports

aldo

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Patrick Ahler
> Sent: Monday, March 10, 2003 4:05 PM
> To: netfilter EMAIL
> Subject: sniffing the forwarded packets
> 
> 
> What can I use to view the packets passing through my 
> router/firewall? I've tried tethereal but that only seems to 
> be able to capture on the specific devices (eth1 or eth2) not 
> the packets being forwarded, can anyone help?
> 
> 


