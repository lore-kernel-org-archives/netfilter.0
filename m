From: "Mario Antonio" <dino@webjogger.net>
Subject: alias interfaces
Date: Fri, 18 Oct 2002 12:20:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <03c701c276c2$388fb3f0$13c01dd0@shadowfax>
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

Dear List,

I have configured eth0(10.10.10.2) and the alias interface eth0:0
(10.10.10.3)

do I have to specify both interfaces in my set of rules to allow traffic in?

something like:

/usr/local/sbin/iptables -A INPUT -i eth0    -s 0/0 -d 10.10.10.2 -p tcp -m
tcp --dport 80 -j ACCEPT
/usr/local/sbin/iptables -A INPUT -i eth0:0  -s 0/0 -d 10.10.10.3 -p tcp -m
tcp --dport 80 -j ACCEPT

How shoud I handle the alias interfaces?

Regards

Mario

---
[This e-mail was scanned for viruses by Webjogger's AntiVirus Protection System]


