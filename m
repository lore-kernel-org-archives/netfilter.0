From: <skmail@mcewen.wcnet.org>
Subject: Forward rule can't specify destination address?
Date: Thu, 6 Jun 2002 15:10:14 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.LNX.4.33.0206061501450.2909-100000@mcewen.wcnet.org>
References: <00ed01c20d13$2402faf0$8201a8c0@adserver.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <00ed01c20d13$2402faf0$8201a8c0@adserver.local>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org


Hi all-

I have a linux box with 1 network card connected the internet with 7
internet IP's, and 1 network card and internal ip.  I'm trying to forward
a port from one of the internet ip's aliased to it across the firewall to
internal.  Here's the forward rule that I use:

$IPTB -A FORWARD -d 1.2.3.4 -p tcp --dport 3389 -j ACCEPT


When I connect to the specified IP address it doesn't work.  If I take the
destination IP out it works fine.  Any ideas as to why it won't work with
the destination IP?


Thanks!


