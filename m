From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: RTSP
Date: Fri, 3 Oct 2003 13:56:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031003144814.000291B8D7@smtp.ttp.nl>
References: <20031003102707.GX5758@sunbeam.de.gnumonks.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031003102707.GX5758@sunbeam.de.gnumonks.org>
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
To: 'Harald Welte' <laforge@netfilter.org>, netfilter@lists.netfilter.org

> This is not possible.  The netfilter coreteam strongly 
> opposes including conntrack/nat helpers for protocols where 
> there is not at least one free software client and server 
> implementation.  AFAIK, there is no free RTSP server 
> implementation so far.  Please inform me, if I'm wrong.

Is this what you are looking for ?

Server :
http://developer.apple.com/darwin/projects/streaming/
Not GPL, but APSL. Don't know if that's enough.

Actually, here is a list with multiple servers and clients :
http://www.cs.columbia.edu/~hgs/rtsp/implementations.html
I didn't check on all of them for licensing.


Gr,
Rob


