From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: XMA, syn, fin etsc scans
Date: Mon, 22 Dec 2003 00:41:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031222004120.3c09f612.arnt@c2i.net>
References: <20031221052832.21599.60293.Mailman@netfilter-sponsored-by.noris.net>
	<20031221165211.62151.qmail@web10102.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031221165211.62151.qmail@web10102.mail.yahoo.com>
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

On Sun, 21 Dec 2003 08:52:11 -0800 (PST), 
madhav bhasin <madhavbhasin@yahoo.com> wrote in message 
<20031221165211.62151.qmail@web10102.mail.yahoo.com>:

> 
> Hi,
>  
> can you please guide me to create rules which can
> prevent XMAS, syn stealth,fin stealth scans 
> against my firewall.how should i block them

..read 'man iptables', search for  "tcp", "state" and "conntrack" in 
"MATCH EXTENSIONS", for responses, consider the friendly 
"--reject-with icmp-host-unreachable", and the less so MIRROR 
and TARPIT from Patch-O-Matic and Patch-O-Matic-ng.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


