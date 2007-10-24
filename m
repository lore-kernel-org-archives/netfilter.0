From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Packet duplication
Date: Wed, 24 Oct 2007 11:31:28 +0200
Message-ID: <001501c81620$a81ac3b0$0b0ffe0a@NS006819>
References: <47184C6D.40202@netsys.co.za> <47186FC3.6030402@freemail.hu> <471875A4.8010000@netsys.co.za> <471882D0.2060602@freemail.hu> <47188A9A.2080604@netsys.co.za> <003801c81242$c160fec0$0b0ffe0a@NS006819> <471F003A.7090501@netsys.co.za>
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <471F003A.7090501@netsys.co.za>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> i patched the kernel sources with pom and compiled and installed and
> then compiled and installed iptables 1.3.7 but still i get
>
> nst2:~ # /usr/local/sbin/iptables -A PREROUTE -t mangle -p
> udp --dport 9090 -j ROUTE
> iptables v1.3.7: Couldn't load target
> `ROUTE':/usr/local/lib/iptables/libipt_ROUTE.so: cannot open shared
> object file: No such file or directory

So, "locate libipt_ROUTE.so" doesn't return
"/usr/local/lib/iptables/libipt_ROUTE.so".

In that case I suppose there was an error when compiling iptables
(perhaps also when compiling the kernel?) that caused libipt_ROUTE.so
not to be compiled. When you ran "make", did you see any related errors?
Anyway, I don't think I can help you there; I'm not a developer, maybe
someone else can.


Grts,
Rob


