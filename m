From: "Jet" <yenjet.chan@eglobal.com.my>
Subject: IP alias and NAT
Date: Mon, 27 Jan 2003 19:31:01 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c2c5f8$bc5d7d40$0bc8c80a@dolphin>
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
To: netfilter@lists.samba.org

Greeting all,

I just got a strange setup on a client site.
It is a standard network setup, from Internet-> router->firewall->DMZ

The firewall is doing NAT for the servers at DMZ.

The strange part is they always do a IP alias at the firewall external
interface when creating a NAT rule (either preroute or post-route).
If I remove the ip alias, then the connection will never work.

My question is, is this the right setup?

To my understanding, it should be just doing NAT with pre-route or
post-route, and then creating the policy using FORWARD chain.
Using IP alias never seems make sence to me here (what if there is 1000
servers in DMZ).

Anyone have any idea here?


 - Jet
Security Analyst



