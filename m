From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: dnat question
Date: Tue, 24 Feb 2004 08:56:15 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402240856.15465.Antony@Soft-Solutions.co.uk>
References: <403a6f6e.ec2.0@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <403a6f6e.ec2.0@arbbs.net>
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

On Monday 23 February 2004 9:23 pm, John Black wrote:

> Since i'm  running separate servers for FTP, Mail, and Web, and using dnat
> to port forward to these machines. Do i need these ports open on the
> firewall?

No.   You are not running the services on the firewall, therefore you don't 
need the ports open on the firewall.   The firewall is simply passing the 
packets on to somewhere else.

Antony.

-- 
Documentation is like sex.
When it's good, it's very very good.
When it's bad, it's still better than nothing.

                                                     Please reply to the list;
                                                           please don't CC me.


