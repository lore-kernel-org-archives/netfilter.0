From: BillR <bill@williamrosmus.com>
Subject: info on filtering 4 dynamic IP's and 1 static IP
Date: Mon, 30 May 2005 21:40:34 -0700
Message-ID: <429BEAC2.6050103@williamrosmus.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
    I signed up for a 'small office home office' package from my ISP.  I 
get 4 dynamic IP addresses and 1 static IP address.  I would like to set 
up a box to packet filter (iptables) the 4 dynamic IP addresses which I 
would then like to route on through to actual workstations.  The same 
box that I am filtering on, I would like to set up with the static IP 
address and use as an html/mail server (but also behind the firewall).

I have set up iptables before using a static IP address for the box 
(which also ran an html and mail server), and then NAT to provide 
connections to the boxes behind the firewall.  That was of course, using 
one static IP address.

Can someone give me a clue on how to go about what I would like.  I 
imagine there may be some router software required as well, but I don't 
really know (maybe not).  Please be gentle! :-)

Thanks,

BillR


