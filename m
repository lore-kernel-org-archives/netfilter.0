From: "Zhang, Peng" <pzhang@hsph.harvard.edu>
Subject: using nfs server
Date: 01 May 2003 21:52:04 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051840324.19244.81.camel@sph184-76.harvard.edu>
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

Hi,

I want some help from you since I do have no experience about iptables.
The situation is that we have a cluster, which has ip called IP_MAIN. We
also have a inside node whose ip is 192.168.0.2. I setup nfs server on
the 192.168.0.2 and the /etc/exports is /aaa IP_CLIENT(rw)
I set up IP masquerade on IP_MAIN so that the inside node can access
outside network. (I tested it and it is OK) and then I add some iptables
rules in IP_MAIN:
iptables -A PREROUTING -t nat -p tcp -d IP_MAIN --dport 2049 -j DNAT
--to 192.168.0.2:2049
iptables -A PREROUTING -t nat -p udp -d IP_MAIN --dport 2049 -j DNAT
--to 192.168.0.2:2049
iptables -t nat -I POSTROUTING -s 192.168.0.2 -p tcp --sport 2049 -j
SNAT --to IP_MAIN
iptables -t nat -I POSTROUTING -s 192.168.0.2 -p udp --sport 2049 -j
SNAT --to IP_MAIN
Now it doesn't work and I really don't know what's wrong. Need I also
create /aaa on in IP_MAIN which is the directory I want to share in the
192.168.0.2 and need I also open the nfs service on IP_MAIN?

Thank you for your help!

-- 
Best wishes,
Peng

*******************************
Peng Zhang
Department of Biostatistics
Harvard School of Public Health
655 Huntington Avenue
Boston, Massachusetts 02115
*******************************

I believe I can fly
I believe I can touch the sky


