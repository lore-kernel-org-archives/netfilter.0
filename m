From: Mattia Martinello <m.martinello@iol.it>
Subject: Nat
Date: Sun, 08 Sep 2002 22:43:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7BB687.6010300@iol.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi.

I wish to create a nat with masquerading to allow my LAN to access to 
Internet.
I have two LANs: 192.168.1.x and 192.168.2.x. The server wich will make 
the masquerading has both two LANs with two ethernet card.
How I can allow only one LAN to access Internet with ppp0 on the server?
I tried these lines, but it doesn't work:

iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -j DROP
iptables -t nat -A POSTROUTING -s 192.168.1.0/255.255.255.0 -o ppp0 -j 
MASQUERADE

What I can do?

Thank you very much
Bye
Mattia Martinello


