From: Payal Rathod <payal-iptables@staticky.com>
Subject: redirection and nat
Date: Fri, 22 Aug 2003 17:12:35 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030822114235.GA1500@linux.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,
In my friend's office where I am trying to put a Linux server, I am
facing some problems.

They have connectivity from 2 ISPs thru' Router A and Router B.
Now in office people from 192.168.10.1 - 192.168.10.7 use Router B to
reach internet and the rest Router A.

I want Linux to be put in such a way so that it accepts connections from
all machines and redirects them to router A and B. Before this they will
be checked against some rules like whether they are allowed to access
external SMTP or not etc. Is this setup possible?

How will I use redirection here? I can redirect for a particular port
but am not getting the syntax for directing any package to particular
router's ip.

Do I need NAT here? If so, kindly tell the logic I have to use this with
NAT. In NAT I have to specify an interface like,
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

But here I will be using 2 interfaces. What will I use then in above
rule? And what should be my default gateway? Does it bind to a
particular ip? BTW, I will be using squid too here. Please remember this
too.

Thanks a lot and eagerly waiting for any input on this.

With warm regards,
-Payal



