From: Steve Mickeler <steve@neptune.ca>
Subject: Re: Display active NAT connections?
Date: Sun, 8 Sep 2002 20:49:38 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209082047060.26706-100000@triton.neptune.on.ca>
References: <000001c25798$e03413b0$d201a8c0@hornet>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c25798$e03413b0$d201a8c0@hornet>
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
To: Raj Wurttemberg <rajw@c64.us>
Cc: 'Netfilters Mailing List' <netfilter@lists.netfilter.org>


They are listed in /proc/net/ip_conntrack. Use your favorite parsing utils
to get the desired results.

You might also want to check out the iptstate util available at
http://home.earthlink.net/~jaymzh666/iptstate


On Sun, 8 Sep 2002, Raj Wurttemberg wrote:

>
> Simple question...
>
> How do you display the active NAT connections?
>
> Thanks,
> /*Raj*/
>
>



[-] Steve Mickeler [ steve@neptune.ca ]

[|] Todays root password is brought to you by /dev/random

[+] 1024D/9AA80CDF = 4103 9E35 2713 D432 924F  3C2E A7B9 A0FE 9AA8 0CDF


