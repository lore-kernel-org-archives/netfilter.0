From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: FTP client behind a gateway
Date: Tue, 29 Oct 2002 16:09:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001d01c27f5d$34ac5330$0401000a@robbysan.org>
References: <3DBE7636.6060301@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DBE7636.6060301@bol.com.br>
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
To: 'Julio Cesar Ody' <julioody@bol.com.br>, netfilter@lists.netfilter.org

> Hello. I don't know if anybody else faced this problem, but when I'm
> behind a gateway (using iptables to perform NAT), I can connect to
any
> FTP server (using the client machines behind the gate) but when I
> request a directory listing by using the "ls" command, it refuses to
> enter passive mode. The same doesn't happen when I do it with the
> gateway machine. Any solutions or ideas ? Thanks again.

If you compiled these as modules ;
do you have the ip_nat_ftp and ip_conntrack_ftp modules loaded (lsmod)
?


Rob


