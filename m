From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Filtering using port+process (i.e. open port 80 for Apache only)
Date: Sun, 29 Feb 2004 13:21:57 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402291321.57965.Antony@Soft-Solutions.co.uk>
References: <20040229122637.79368.qmail@web40101.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040229122637.79368.qmail@web40101.mail.yahoo.com>
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

On Sunday 29 February 2004 12:26 pm, Moath A. Khalaf wrote:

> Hi,
>
> How can I filter using a port and allow some processes
> to pass this filter. For example, I want to add a rule
> that does not accept a connection on port 80 to any process
> other than Apache web server.

Is the Apache web server running on the machine with the filtering rules?

If so, then it will be the only process bound to port 80, and nothing else can 
receive packets to this port anyway.   Therefore you have no problem.

If the web server is running on another machine and you are talking about a 
forwarding (routing) firewall, the only solution to your requirement is a 
proxy server such as Squid.   Netfilter cannot tell what sort of traffic is 
going to port 80 - it operates at the network layer, not the application 
layer.

Regards,

Antony.

-- 
This is not a rehearsal.
This is Real Life.

                                                     Please reply to the list;
                                                           please don't CC me.


