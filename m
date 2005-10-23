From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: LAN Port forwarding with a dynamic IP address
Date: Sun, 23 Oct 2005 00:19:18 -0500
Message-ID: <435B1D56.5060704@riverviewtech.net>
References: <7f6703390510210400n3ea01619p3e46ee81bd7badc3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7f6703390510210400n3ea01619p3e46ee81bd7badc3@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Zac Hansen <xaxxon@gmail.com>
Cc: netfilter@lists.netfilter.org

Zac Hansen wrote:
> I have a single, dynamic IP address. I have multiple boxes behind a linux
> router, one of which runs a web server on port 80. I have set up rules (a
> PREROUTING and a FORWARD rule) to let people outside my LAN deal see my web
> server. The problem is that the boxes on my LAN can't see them.
> 
> I really don't want to hardcode my external IP address into any rules and I
> don't want to do any DNS work to make the LAN boxes look up the actual
> server's LAN IP address directly.
> 
> Can I get my LAN boxes to see my web site and not do the things I don't want
> to do?

You might be able to use one of the Layer 7 filters to match the traffic that is actually destined for your server via the HTTP get line but I think this would be after the connection is made.

The other option that comes to mind would be to set up some sort of proxy (Squid in reverse proxy mode) server that your clients or the world would issue the request to and have it handle the routing of sending the request to the box that is really servicing the request.



Grant. . . .

