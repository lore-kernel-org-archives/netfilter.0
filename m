From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Proxy/Web Server
Date: Sun, 11 Jul 2004 08:54:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407110854.59786.Antony@Soft-Solutions.co.uk>
References: <000e01c466d5$27a3cd10$0e07a8c0@maxwellsda.com>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000e01c466d5$27a3cd10$0e07a8c0@maxwellsda.com>
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

On Sunday 11 July 2004 12:25 am, Junel Solis wrote:

> Is it possible to configure iptables so that packets destined for squid
> running on the same server are delivered as well as packets running on a
> separate web server within the local network?

I can't quite work out what you're asking...

If you're asking for packets to be split and delivered to two destinations, 
then no, you can't.

If you're asking for some packets to be redirected to Squid, and others to be 
sent to the local server, then yes, you can do this provided the packet types 
can be distinguished by IP address (and not, for example, by domain).

Please explain more clearly (some examples might help?) quite what you want to 
do so we can suggest some possible solutions.

Regards,

Antony.

-- 
Microsoft may sell more software than any other company, but McDonald's sell 
more burgers than any other company, and I think the other similarities are 
obvious...

                                                     Please reply to the list;
                                                           please don't CC me.


