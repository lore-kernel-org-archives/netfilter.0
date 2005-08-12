From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Persistence in connection tracking for port forwarded traffic?
Date: Fri, 12 Aug 2005 00:22:12 -0500
Message-ID: <42FC3204.6030900@riverviewtech.net>
References: <20050810161546.63554.qmail@web30507.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050810161546.63554.qmail@web30507.mail.mud.yahoo.com>
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
To: netfilter@lists.netfilter.org

ng techorder wrote:
> Hello Everyone, 
>    If I am double posting to the list, my apology.  I
> seem to not see my previous post within the archive.
>    I need some assistance in getting this Multi-WAN'ed
> linux box working correctly.  The box is multi-WAN'ed
> because I want to only present a single gateway to the
> machines on the LAN, yet take advantage of always
> having a path to the internet if one of the ISP goes
> down.
>    Onward to the problem.  From the LAN side, I can
> surf the internet with no problem.  However, I am
> encountering issues when I try to provide
> port-forwarded services like FTP, HTTP to servers
> located on the LAN side.  
>    For example, I am port forwarding all HTTP request
> from the WAN to 99.134.126.45 to an internal server
> located at 192.168.10.24.  About 50% of the time, that
> worked normaly.  192.168.10.24's reply packets went
> back out on the 99.134.126.40/29 interface.  However,
> on the other 50% of the time, the reply packet went
> out on the 219.225.92.96/28 interface, and the
> client's web browser just timed out because it ignored
> this "unrelated" reply packet.  
>    This can happen on the start of the new connection
> (where the client's browser never got the correctly
> sourced initial reply packet), or midway throught the
> webpages access session.
>    How do I get the system to send the reply back on
> the correct interface all the time?  A big thank you
> in advance.

I could be wrong about this.  I have not tested any of what I am about to propose so take it with a grain of salt or two...

I would be tempted to see if I could not get the connection marking extensions to help you out in this endeavor.  As I understand it the connection marking will recognize the traffic for a connection in either direction and thus be able to mark it accordingly.  With this in mind I would be tempted to connmark the packets that come in one interface with a mark value that you associate with said interface and then mark connections that come in another interface(s) with another mark value that you associate with the other interface(s).  I believe you could then use some ip rules to determine the correct routing table to use based on the connection mark and thus ensure that traffic will go out the correct interface.  Again this is just and idea and is far from working but it is also where I would start.

Can any one else comment on CONNMARK?



Grant. . . .

