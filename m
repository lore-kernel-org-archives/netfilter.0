From: Steve Mickeler <steve@neptune.ca>
Subject: Re: Single IP firewall help...
Date: Thu, 12 Sep 2002 12:31:34 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209121224420.17354-100000@triton.neptune.on.ca>
References: <3D80B62C.7060807@canada.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D80B62C.7060807@canada.com>
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
To: Chris Poupart <cpoupart@canada.com>
Cc: netfilter@lists.netfilter.org


This should work for you.


$IPTABLES -A INPUT -d 192.168.0.10 -p tcp --dport 22 -j ACCEPT
$IPTABLES -A INPUT -d 192.168.0.10 -p tcp --dport 80 -j ACCEPT
$IPTABLES -A INPUT -d 192.168.0.10 -p tcp --dport 443 -j ACCEPT
$IPTABLES -A INPUT -d 192.168.0.10 -p tcp --syn -j REJECT
$IPTABLES -A INPUT -d 192.168.0.10 -p udp -j REJECT


> Hello,
>
> I have been having a heck of a time getting a IPTables firewall working
> (directly) on our future webserver.
>
> Essentially, it should be easy, I want to accept SSH, HTTP and HTTPS and
> deny everything else (incoming) and, at least for the moment, allow all
> outgoing.
>
> I am sure that this can be done in about 4 lines, and yet all that I
> have tried has ended in me getting locked out (and having to go to the
> console).  So I am stuck, and I have to have this ready to go live by
> friday.
>
> Assuming that the IP address was (we will give a nice private one)
> 192.168.0.10 does anyone have any ideas?
>
> Thanks for any help that you guys can offer on this.
>
> -- Chris Poupart
>
>



[-] Steve Mickeler [ steve@neptune.ca ]

[|] Todays root password is brought to you by /dev/random

[+] 1024D/9AA80CDF = 4103 9E35 2713 D432 924F  3C2E A7B9 A0FE 9AA8 0CDF


