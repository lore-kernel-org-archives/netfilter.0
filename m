From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: bridge + nat
Date: Mon, 19 Jul 2004 08:46:01 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3063e5040718224645349687@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hello, i am trying to make a linux machine as both router and bridge.
The linux machine will be connected to internet and to the lan. One of
the LAN machines will get public ips, and the rest, including the
linux bridging interface will have ips from private space. How do i
share internet to those computer? the public ip will be on some
windows machine which has voip, and i'm not sure just forwarding ports
to that machine will make voip working, so i am thinking to do this
bridge. Thank you for any suggestion/hint

