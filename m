From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FTP client behind a gateway
Date: Tue, 29 Oct 2002 13:50:30 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210291350.g9TDobe10143@vulcan.rissington.net>
References: <3DBE7636.6060301@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

On Tuesday 29 October 2002 11:51 am, Julio Cesar Ody wrote:

> Hello. I don't know if anybody else faced this problem, but when I'm
> behind a gateway (using iptables to perform NAT), I can connect to any
> FTP server (using the client machines behind the gate) but when I
> request a directory listing by using the "ls" command, it refuses to
> enter passive mode. The same doesn't happen when I do it with the
> gateway machine. Any solutions or ideas ? Thanks again.

I know you're using passive mode and not active, but have you included 
support (either compiled in or as a module) for ftp connection tracking and 
ftp nat ?

NAT still needs to know the port numbers used in passive ftp, so it needs the 
helper module loaded in order to see the PORT command.

Antony.

-- 

Documentation is like sex:
when it's good, it's very very good;
when it's bad, it's still better than nothing.

