From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: state --string
Date: Tue, 29 Jul 2003 11:22:47 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0307291121390.23491@dns.toxicfilms.tv>
References: <3F2598BD.6050302@sat.com.py> <1059429064.6146.11.camel@localhost>
 <3F25C294.1090506@4linux.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F25C294.1090506@4linux.com.br>
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
To: Ralf Braga <ralf@4linux.com.br>
Cc: Shawn <core@enodev.com>, juanca <juanca@sat.com.py>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

> iptables -A FORWARD -p tcp -m state --state NEW -m string --string
>
> Have you what compile the module string ?
Take a look at patch-o-matic, patch your kernel, compile the module,
compile iptables sources to get the userspace module. Use the rules.

Regards,
Maciej


