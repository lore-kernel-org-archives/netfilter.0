From: Daniel David Benson <dan@spoontail.com>
Subject: Leaking ICMP and UDP packets
Date: Mon, 19 Apr 2004 09:17:03 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0404190914120.2276-100000@dudester.spoontail.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I essentially have everything go out as a global nat, but every now and 
then a tcpdump on the frontside interface is showing some ICMP and UDP 
packets not getting natted.  Anyone ever seen this before?  It's not a 
major deal as we are are having our front edge router handle these ugly 
packets, but I'd like to tighten it up.


Thanks!

-Dan



