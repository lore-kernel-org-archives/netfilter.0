From: "Travis Bell" <travis@dptexas.net>
Subject: ARP traffic on a large-ish network
Date: Tue, 15 Mar 2005 10:24:01 -0600
Message-ID: <42B3C34A03A8FC4BB0A80082CE8993F31C1C25@onstopnt.onestop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

I wasn't clear on my question yesterday.  Here's what I'm trying to do:

We've got a /19 block of public IPs from our provider to give to
customers.
Because we want customers to have a public IP, as opposed to NATing a
private IP, they are essentially just plugged into my switch just on the
other side of the Cisco router from our T1s.

Our Cisco router is ARP who-has'ing for the entire block of IPs (as it
should).

I'd like to stick something between the Cisco router and the customers
that keeps them from getting so much ARP traffic.  It seems like it's a
lot of traffic going through.  Ethereal captured 1260 ARP packets in 10
seconds.

So is there anything I can do?  Or is that much ARP traffic reasonable?

Thanks,
Any advice is appreciated.

Travis Bell


