From: Ilguiz Latypov <ilguiz@nit.ca>
Subject: Re: Interesting request. block x.x.0.0
Date: Thu, 23 Jan 2003 13:54:06 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0301231348570.13099-100000@localhost.localdomain>
References: <200301220116.18451.danielf@supportteam.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200301220116.18451.danielf@supportteam.net>
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
To: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>
Cc: netfilter <netfilter@lists.netfilter.org>


On Thu, 23 Jan 2003, Daniel F. Chief Security Engineer - wrote:

> Anybody know of a way to block this traffic. Notice it's comming from just the
> 0.0 addresses obviously spoofed. But can you block x.x.0.0 with out blocking
> every thing else in the range with out a rule per IP.

Can the CIDR approach to networking be of any help?  I heard that the
traditional imaginary separation of networks into classes A, B, C,... is
not quite useful, so it is now possible to specify network numbers in
format

   X.X.X.X/N

where N is the number of most significant bits.

Based on the above, will the 45.208.0.0/32 notation in an iptables rule
filter the unwanted packets without rejecting any other possible valid
packets coming from 45.208.0.0/16?

--
Ilguiz Latypov
Net Integration Technologies, Inc

tel. +1 (514) 281 9191 x 117



