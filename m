From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT matching question
Date: Sun, 29 Sep 2002 18:18:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020929171804.GPIU2092.mta07-svc.ntlworld.com@there>
References: <Pine.GSO.4.44L-027.0209291259220.1180-100000@unix4.andrew.cmu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.44L-027.0209291259220.1180-100000@unix4.andrew.cmu.edu>
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

On Sunday 29 September 2002 6:09 pm, Mohan Khurana wrote:

> On Sun, 29 Sep 2002, Antony Stone wrote:

> > Reply packets should not be a problem unless your ISPs block packets with
> > source addresses which don't match the network range you have from them.
>
> This is also true, but what if they do block?  I was hoping there was a
> way to maintain connection tracking such that if there is a machine on the
> internet that connects to an internally hosted server, it would maintain
> the incoming gateway and interface, and then ensure that the equalize
> command would ensure that the outgoing packet going to the right gateway.

I do not know enough about equalise-routing to know how to do this.

> Lets say some internet machine contact my webserver, which happens to be
> at 1.2.3.33.  It would come in on 1.2.3.4.  Now the webserver needs to
> send IP packets back out to the internet, so it does a routing table
> lookup.  Because ISP1 would block ISP2 traffic and vice-versa, if the
> selected gateway (as a result of the equalize statement above) is 5.6.7.8,
> then the only way to get that IP packet out would be to NAT it on an IP
> from ISP2.  Post-NAT, this would change the source field of the IP packet,
> and break communication (the machine on the internet wanted a source of
> 1.2.3.33).

Correct.   If that happened, the communication would break.

> I think the solution is for incoming packets destined to servers marked as
> state NEW to have their gateway and source address placed in a table.
> When 1.2.3.33 wants to go out, the equalize flag should look up the table,
> see if the destination host is in there, and if it is, it should return
> the proper corresponding gateway.

If you can implement such a table then yes I agree this system should work.

There is an alternative, and that is to run your web server with two private 
IP addresses, and have the public address from ISP 1 translate to private IP 
1, and the public address from ISP 2 translate to private IP 2.   The web 
server is configured to provide precisely the same content for either IP 
address.

If you do that, then the web server will reply from the same source address 
as the original request used for its destination address, and you can use 
source-based routing in iproute2 to make sure that replies from private IP 1 
always go via ISP 1, and replies from private IP 2 always go via ISP 2.

Antony.

-- 

Normal people think "if it ain't broke, don't fix it".
Engineers think "if it ain't broke, it doesn't have enough features yet".

