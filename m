From: gui <whereisgui@gmail.com>
Subject: Re: Protecting multiple webservers
Date: Wed, 19 Jan 2005 14:35:00 -0800
Message-ID: <48be50bb050119143595e54d2@mail.gmail.com>
Reply-To: gui <whereisgui@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

>uh--where are the "allow incoming connections to my web servers" lines?

> -A FORWARD -i eth0 -o eth1 -p tcp --syn -d 192.168.0.2 --dport 80 \
>   -j ACCEPT
>
>-A FORWARD -i eth0 -o eth1 -p tcp --syn -d 192.168.0.3 --dport 80 \
>   -j ACCEPT
>
>make sure you also enabled IP forwarding:
>
> sysctl -w net.ipv4.ip_forward=1

The iptables start up script enables forwarding, but you were right I
was missing the  "allow incoming connections to my web servers" lines.
 Thanks James!

>are these webservers goingto be part of a cluster or do they need to
have there own resolved >hostnames?
>are they to be part of virtual hosting scenario ?

No, they are not in a cluster or anything fancy like that. These are
just stand alone web servers serving their own content that need to be
isolated from the rest of our network, but need to have their own
(current) hostnames resolved. I don't see what more information I can
provide.

The set up seems to be working fine after I added the lines suggested
by James. I'll report back if I encounter problems.

piranha,
Would you mind telling what are the other ways to do this?  Keep in
mind that I can't touch the DNS server.

Thanks again.

-gui

