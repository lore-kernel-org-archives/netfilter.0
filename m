From: "dizma" <nick@riskeng.bg>
Subject: Re: Strange problem with iptables IP Masq
Date: Mon, 16 Sep 2002 14:25:11 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <007e01c25d73$b8cb0410$37d2a8c0@nikodimov>
References: <002001c25dc4$69549800$6400a8c0@hammer1>
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

I think that the problem should be in the DNS resolving not in the iptables
rules.

NN

----- Original Message -----
From: "Lior Hammer" <lior@typo.co.il>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, September 17, 2002 12:02 AM
Subject: Strange problem with iptables IP Masq


> Hello,
> I'm using the IP Masq script from the IP masq howto from TLDP.
> The connection sharing is fine except for one thing:
> in some of the sites (for example: http://httpd.apache.org or DynDNS.org
> members area) my browser keep's searching and searching without any result
> (or other response) or it just print few lines and that's it.
> I thought it's a problem with my browser, so i tryed to get the page
> directly with telnet.
> i got the HTTP Headers, and the first lines, and that's it, it didn't
> disconnect or somthing, just waited.
> Everything is ok when i'm trying to get this page directrly with lynx from
> the computer that shares the conection.
>
> Thank you very much for your help,
> Lior.
>
>


