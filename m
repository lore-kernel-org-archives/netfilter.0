From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Is there a way....
Date: Mon, 1 May 2006 05:45:09 +0200
Message-ID: <000601c66cd1$a5a31190$0101000a@sterenborg.info>
References: <Pine.LNX.4.58.0604301836350.26623@linux.dpsims.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0604301836350.26623@linux.dpsims.com>
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
To: netfilter@lists.netfilter.org

> Hi,
> 
>   I want to use Linux to do NAT between some 192.168.x.x addresses
> in a routed network on one side and a single 10.0.0.x/24 on the other
> side. I want to do one-to-one NAT but in a dynamic way... such that a
> calling address is NATed into the next available 10.0.0.x/24.... in a
> round robin sort of way... IS there a way to do this using NETFILTER??
> If not NETFILTER, then how?? 
> 
>   This sort of thing is common in many-to-one NAT (port-address
> translation)... but I need each call to come from a separate NATed IP
> address to support my application (TN3270 session)... It's OK to reuse
> addresses after a call (session) is complete, but each session needs
> to come from it's own fixed (for the duration of the session) IP
> address.... 
> 
>   The exact application that I am trying to support is connecting to
> an IBM mainframe from random hosts in a routed network via an
> Attachmate gateway where calling addresses are mapped into terminal
> sessions on a 1:1 basis.... Port address translation won't work
> because all calls appear to eminate from the single IP address.... I
> need to do 1:1 NAT but only on a temporary basis where once a call is
> complete the NAT address can be used by another caller...
> 
>   Clues? Suggestions? Examples?

Have you tried the NETMAP target ? Using NETMAP I don't see a reason to
have to reuse IP addresses for NAT because you can NAT a complete subnet
1:1 with NETMAP.
http://www.netfilter.org/projects/patch-o-matic/pom-base.html#pom-base-N
ETMAP


Gr,
Rob


