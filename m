From: "Arnoud" <a.buurman@wxs.nl>
Subject: Help needed on multicast and iptables.
Date: Sat, 8 Feb 2003 14:03:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c2cf72$8b8bc6d0$0c00a8c0@nt.klote.com>
Reply-To: <a.buurman@wxs.nl>
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

Gents! & Ladies?!

Can someone comment on this?

I figgured that multicast with PIM should work while working with iptables:

We need to allow for IGMP to reach the PIM deamon, the PIM deamon needs to
communicate and we need some ip traffic to allow from normal IP to multicast
adresses and or ranges.
Anyone who got experience with it? Can't find any usefull info in FAQ and
Google, but maybe I'm googleing the wrong way?

Maybe someone from the developers who can tell how iptables handles IGMP &
multicast IP.


Kind regards,


Arnoud Buurman


