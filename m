From: "Carlo Florendo" <carlo@hq.astra.ph>
Subject: local DNAT with bind,postfix,and iptables
Date: Thu, 16 Oct 2003 08:55:42 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009c01c39406$55f57490$200aa8c0@thorin>
References: <007401c3929f$6d0deb70$200aa8c0@thorin>
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

Hello,

I have a box which runs bind, postfix, and iptables.  (Box A)
This box has 2 interfaces.  One facing the net and the other the internal
network

There's another box behind the firewall that runs postfix and is part of the
internal network.  (Box B).

Here's the setup.

-------------
|    Internet   |
--------------
        |
        |
        |             host: my.company.org
-------------  Pub. IP: 219.21.114.33
|    Box A    |  runs bind, iptables, postfix
--------------  Pri. IP: 192.168.0.1
        |
        |
------------- host: mx.my.company.org
|    Box  B   | runs postfix
------------- Pri. IP 192.168.0.3

There is an mx entry in bind, in box A, which maps the IP address
219.21.114.34 to mx.my.company.org (Box B).  Although Box B has no interface
that listens as 219.21.114.34, I've done a DNAT from Box A to Box B
so that, when Box A receives a request for 219.21.114.34, it does a DNAT to
192.168.0.3.  With this way, Box B can
receive mails which it's supposed to receive.

This is how it worked:

iptables -t nat -A PREROUTING -i <public_iface> -d 219.21.114.34 \
    -j DNAT --to 192.168.0.3

Now, here's my problem:

Since the internal network have their mail clients configured to use Box A
as their smtp server, there should be a way
for Box A to communicate with Box B using 219.21.114.34.

I cannot use Box B's IP 192.168.0.3 since this would break bind.  If I do
this, mail from outside would not reach Box B.
Since mx requests for mx.my.company.org would return 192.168.0.3 which is
invalid within the internet.

The only way to do this is for Box A to be able to DNAT to box B using
locally generated connections (that is, connections that would be initiated
by Box A's smtp server).

The howto says that DNAT for locally generated packets is not possible in
2.4 kernels.  Does this still hold true?

Is it possible to DNAT 219.21.114.34 to 192.168.0.3 if connections originate
from 219.21.114.33 (DNAT for locally generated packets)?

This solution obviously does does not work:

iptables -t nat -s 127.0.0.1 -d 219.21.114.34 -j DNAT --to 192.168.0.3

Any workarounds?  Thanks!

Thanks!

Best Regards,

Carlo
------
Carlo Florendo
Astra Philippines Inc.
www.astra.ph



