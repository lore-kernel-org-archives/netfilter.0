From: "Brad Morgan" <B-Morgan@concentric.net>
Subject: RE: Single IP firewall help...
Date: Thu, 12 Sep 2002 12:24:58 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NABBJOOEOFODEALNMJAJGEFMGLAA.B-Morgan@concentric.net>
References: <Pine.LNX.4.44.0209121224420.17354-100000@triton.neptune.on.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209121224420.17354-100000@triton.neptune.on.ca>
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
To: Steve Mickeler <steve@neptune.ca>, Chris Poupart <cpoupart@canada.com>
Cc: netfilter@lists.netfilter.org

Don't forget to change the default policy on INPUT to be DROP.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Steve Mickeler
Sent: Thursday, September 12, 2002 10:32 AM
To: Chris Poupart
Cc: netfilter@lists.netfilter.org
Subject: Re: Single IP firewall help...



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




