From: "Michael T. Halligan" <michael@halligan.org>
Subject: How to contact NAT ip address from NAT box?
Date: Tue, 29 Oct 2002 17:01:09 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210291659190.6853-100000@arrakis.halligan.org>
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

I'm setting up an SSL proxy that proxies to an ip that I'm controlling
with LVS .. So I need to be able to contact my outside IP address
from inside..  How would I go about this? I've tried doing something like

# iptables -t nat -A POSTROUTING -d 216.38.142.76 -s 192.168.1.0/24 \
               -p tcp --dport 80 -j SNAT --to 192.168.1.20

 but that doesn't work.. Any thoughts?

-- 
---------------------------
Michael T. Halligan
Chief Geek
Halligan Infrastructure Designs.
2250 Jerrold Ave #11
San Francisco, CA 94124
(415) 824.4453


