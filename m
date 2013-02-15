From: Michael Ludvig <mludvig@logix.net.nz>
Subject: Re: Redirecting DNS Not Working
Date: Sat, 16 Feb 2013 08:15:48 +1300
Message-ID: <F86EAF6A-D26B-4162-8E1A-C3123FB89F31@logix.net.nz>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com> <1360946103.2251.2.camel@andylaptop> <CAFURDX-qor3-w4tVMt-aLfH2_tbNNz1KQwRHMA99MrzZL1UT9w@mail.gmail.com> <1360947911.2251.24.camel@andylaptop> <CAFURDX9==GRygRJNADXJa3zS1qxm1p0xomXGdtFGOOJz-eD2FA@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFURDX9==GRygRJNADXJa3zS1qxm1p0xomXGdtFGOOJz-eD2FA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Corps <envoys@gmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 16/02/2013, at 6:28, John Corps <envoys@gmail.com> wrote:

> Very odd...put on a simple logging of
> iptables -A INPUT -i eth1 -j LOG --log-prefix "DNS TEST INPUT drop: "
> 
> getting nothing in the logs...this is mind baffling. Even with TCPDUMP
> not seeing any packets unless i set client DNS to local ip of server,
> the 192.168.1.2 dns, set it to google for a test of 8.8.8.8 and get
> nothing in logs or with tcpdump.

Let me guess - your DHCP doesn't provide default gw, only client IP and DNS server.

With no default route the requests to 8.8.8.8 don't even make it out from the client (no route to host). With 192.168.1.2 it works because that IP is on the same subnet as the client and doesn't require default route to reach it. 

Could that be the reason? Just a guess...

Michael

