From: Peter Frischknecht <peter@empoweringsolutions.com>
Subject: IMQ Replacement
Date: 17 Jan 2004 10:15:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1074352525.4761.1389.camel@peterlaptop>
References: <1068652569.27810.450.camel@cumulus>
	 <Pine.LNX.4.58.0311131244400.13900@fhynpb.envafyvqr.arg>
Reply-To: peter@empoweringsolutions.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0311131244400.13900@fhynpb.envafyvqr.arg>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

I have been using IMQ with great success for the last few months.  The
particular network where this is used has 400+ nodes, and IMQ performs
flawlessly.

As anyone who uses IMQ will tell you, the only alternatives are:
1 - Install another router, just to perform NAT
2 - Install 2 additional NICs in the Linux gateway with a Xover cable
between them

Is there another piece of software that performs the job of IMQ?
It is great being able to shape traffic AND masquerade packets in one
box.  How else can it be done?

We shape traffic individually for each client.  Generic traffic shapping
rules that regulate the entire pipe would not work for us.

The fact that IMQ is unmaintained is nerve wrecking.  It is difficult
enough to install the thing with the sources and documentation
available.  It will only become more difficult as the kernel evolves and
we move to 2.6.x.

I don't think I have the knowledge to mainatin the source code.  But I
believe in the concept so much that I might just take up the code
maintenance.  Hoepefully some other folks will join in.  Maybe we can
convince enough folks to incorporate it into 2.6.x.

Any help, comments or even flames will be appreciated.  It is time for a
solution to this problem.

Peter

