From: "azeem ahmad" <azeem484@hotmail.com>
Subject: RE: open ports
Date: Mon, 17 May 2004 00:55:40 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY15-F36xiW2wqUjfg0006b834@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

but its not the soulution to just leave the programs that have dynamic 
ports. there must be a solution for them in netfilter

Regards
Azeem


>From: "Rob Sterenborg" <rob@sterenborg.info>
>To: <netfilter@lists.netfilter.org>
>Subject: RE: open ports
>Date: Sun, 16 May 2004 12:03:47 +0200
>
> > i m also doing so but there is the problem of some programs
> > that some times use dynamic ports like msn messenger uses
> > dynamic ports for file transfer through it (i think so if it
> > is wrong then tell me please) ad where the log will go and
> > can i specify any file instead of the one default
>
>AFAIK MSN likes to connect to port 1863/tcp by default (it does here) and 
>if
>that failes it will try to connect to some servers on port 80/tcp.
>So, if you ACCEPT connections for both ports 80/tcp and 1863/tcp you should
>be fine. Although some MSN functions like file-transfer might not work.
>
>
>Gr,
>Rob
>
>

_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*. 
http://join.msn.com/?page=features/virus


