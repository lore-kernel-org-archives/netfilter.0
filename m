From: "Adam Kennedy" <akennedy@niesc.k12.in.us>
Subject: Having NAT issues
Date: Thu, 1 Apr 2004 14:30:38 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040401192728.M69316@niesc.k12.in.us>
References: <20040401192505.3100.69461.Mailman@vishnu.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040401192505.3100.69461.Mailman@vishnu.netfilter.org>
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

This is driving me up a wall.
I have a NAT entry such as thus:

iptables -t nat -A PREROUTING -d 1.2.3.4 \
        -p tcp --dport 5631 -j DNAT --to 192.168.1.1


The thing doesn't work. If I run a telnet session from the NAT box to the
internal machines port of 5631, it responds. But, when doing that from the
outside world, it doesn't. And yes the outside IP is bound to the NAT box, as
eth0:2 actually. This is a pcAnywhere connection, but I doubt that pcAnywhere
cares as it works on other servers, just not this one.

Some stats of the server:
iptables 1.2.9
kernel 2.6.3 (also tried 2.4.25)
gcc 3.2.3
libc 2.3.2


Any ideas?

--
Northern Indiana ESC
Adam Kennedy - akennedy@niesc.k12.in.us
Linux Specialist / Network Administrator
Phone: (574) 254-0111 x113
Toll Free: 800-326-5642
Fax: (574) 254-0148


