From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: curious about address specification and port specification
Date: Wed, 9 Oct 2002 07:14:03 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210090709200.13728-100000@localhost.localdomain>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>


  more annoying questions, before i head out for the day:

1) is there anything meaningful about some sample address filter
   clauses i've seen that read "-s 0/0" or "-d 0/0"?  doesn't 
   this just mean no filtering on either source or destination?
   is there any value to these matches other than making it 
   explicitly clear that no address filtering is being done?

2) in all of the docs i've read, the claim is that port matching is
   an implicit match within either UDP or TCP matching and that you 
   *must* specify a protocol before you're allowed to specify ports.

   however, i've certainly seen and used rules that refer to a port
   or ports without first specifying a protocol.  is the documentation
   just misleading here?

rday


