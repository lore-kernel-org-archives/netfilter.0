From: "Bailey Kong" <bailey@tgpsolutions.com>
Subject: Simultaneous VPN connections
Date: Tue, 4 Mar 2003 10:45:15 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1668.64.81.237.3.1046803515.squirrel@mail.tgpsolutions.com>
Reply-To: bailey@tgpsolutions.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi, I've tried googling to see if I could find anyone that discuss this
before, but without success. I'm not sure if I google with the wrong
words, or I'm just not looking hard enough.

Any how, my problem is that I'm using iptables on my gateway box to do
SNAT, and when I connect to a company's VPN the first connection is fine.
But all the other fail. When I say fail, I mean they get the initial
connection but fail to setup the connection it seems.

My network setup is this:

LAN ---------> Iptables/GW ------> Router ------> INET -----> VPN Server
(192.168.1.0)  SNAT                NO NAT

Now I just want to confirm that its not iptables that's having the
problems before I start blaming the people setting up the VPN Server.

The one way right now that we get more than 1 connection to the VPN Server
is to by pass the Iptables/GW.

Host1 ---------> Iptables/GW ------> Router ------> INET -----> VPN Server
(192.168.1.10)   SNAT                NO NAT
                                       ^
                                       |
Host2 ---------------------------------|
(INET IP different from the one Iptables/GW uses)

This is how we are able to get 2 connections to the VPN Server, now the
people that setup the VPN Server claim that there aren't any limits like 1
connection per IP or anything like that, I'm also wondering, if you ever
could make more than 1 connection to a VPN Server from the same IP. I'm
not very familiar with VPNs.

Any information would be apprciated.
Bailey

-- 
bailey@tgpsolutions.com

Administrator, tgpsolutions
http://www.tgpsolutions.com

