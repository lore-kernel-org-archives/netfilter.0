From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: open ports
Date: Sun, 16 May 2004 12:03:47 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040516100347.AEFD290A7@sterenborg.info>
References: <BAY15-F22bMcBuxPaYX00067fe4@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F22bMcBuxPaYX00067fe4@hotmail.com>
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

> i m also doing so but there is the problem of some programs 
> that some times use dynamic ports like msn messenger uses 
> dynamic ports for file transfer through it (i think so if it 
> is wrong then tell me please) ad where the log will go and 
> can i specify any file instead of the one default

AFAIK MSN likes to connect to port 1863/tcp by default (it does here) and if
that failes it will try to connect to some servers on port 80/tcp.
So, if you ACCEPT connections for both ports 80/tcp and 1863/tcp you should
be fine. Although some MSN functions like file-transfer might not work.


Gr,
Rob


