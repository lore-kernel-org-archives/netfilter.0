From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Argh!  I'm kicking myself
Date: Fri, 19 Dec 2003 15:59:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312192059.hBJKxgYg009761@discmail.com>
References: <015b01c3c670$99b77600$3dc2a70a@melita.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <015b01c3c670$99b77600$3dc2a70a@melita.com>
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
To: 'Ian Hunter' <ihunter@hunterweb.net>, netfilter@lists.netfilter.org

I KNOW you can have always used the PROTOCOL numbers but the names may have
been recently implemented...as far as where it is documented - in the
frees/wan docs - it talks about the types of rules which you will need in
iptables..

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Ian Hunter
Sent: Friday, December 19, 2003 3:42 PM
To: netfilter@lists.netfilter.org
Subject: Argh! I'm kicking myself

For days now I've been trying to figure out how to recompile my Redhat
2.4.20-24.9 kernel to allow masquerading IPSec ESP traffic.  I ran the
much-vaunted "grep -i masq /proc/ksyms" and to my chagrin got nothing back,
but on a lark decided I'd try "iptables -A FORWARD -t nat -i ppp0 -p esp -j
ACCEPT" just to see if it would fly and it did.  Of course.  And now you're
all laughing at me.

Where is this documented, that gre, esp, ah, and the like are acceptable
protocols?  The docs mention icmp, tcp, and udp only.

Is there such a document, or have I discovered a particular cover of the
netfilter doc-hole?

Ian



