From: Pablo Allietti <pablo@lacnic.net>
Subject: Re: block nmap info
Date: Thu, 27 Jan 2005 19:09:28 -0300
Message-ID: <20050127220928.GA27921@omega.lacnic.net.uy>
References: <20050127200622.GA23921@omega.lacnic.net.uy>
	<41F96615.9010701@skynet.be>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41F96615.9010701@skynet.be>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xmaillist <xmaillist@skynet.be>
Cc: netfilter@lists.netfilter.org, Pablo Allietti <pablo@lacnic.net>

On Thu, Jan 27, 2005 at 09:07:17PM -0100, xmaillist wrote:
> Hi,
> nmap man page:


ok. then it is impossible to block nmap and portscanning? 


> [...]
> -sT
> TCP connect() scan: This is the most basic form of TCP scanning. The 
> connect() system call provided  by  your operating system is used to 
> open a connection to every interesting port on the machine. If the port 
> is listening, connect() will succeed, otherwise the port isn't 
> reachable. One strong advantage to this technique is that you don't need 
> any special privileges. Any user on most UNIX boxes is free to use this 
> call. This sort of scan is easily detectable as target host logs will 
> show a bunch of connection and  error messages for the services which 
> accept() the connection just to have it immediately shutdown.  This is 
> the default scan type for unprivileged users.
> [...]
> 
> -sT scan is a full TCP handshake (SYN -> SYN/ACK -> ACK), so you just 
> have to forbid TCP connection on open ports...
> But, if you block tcp accesses for anybody, nobody could connect to the 
>  service associate with the corresponding port.
> So, you have to use rules that grant access for allow machine, and drop 
> it for the others.
> Nevertheless, other scans like -sS, -sF, -sX, -sN can still work...
> 
> 
> Pablo Allietti wrote:
> >hi all (again), how can i made a rules for block nmap information?
> >
> >if i do nmap -sT myhost.com from a cybercafe for example,   nmap display
> >all ports open. exist any way to block this? something like block
> >scanports?
> 
---end quoted text---

-- 


Pablo Allietti
LACNIC
--------------


