From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Routing Public IPs over NAT Address Space
Date: Mon, 14 Jul 2003 16:35:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307142037.h6EKbDjk022585@discmail.com>
References: <1058214190.24132.113.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1058214190.24132.113.camel@localhost>
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
To: 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

Read the Tutorial - anyone who configures a firewall and doesn't know the
firewalling technology that he/she is implementing is asking for problems,
to say the least.

Google iptables tutorial and spend some time understanding it.

Soap box: 90% of the questions posed to this group are answered in the
tutorial.  It would make this list much less chatty to hear a lot less
questions about people's 'unique' setups...

"You are as unique as everyone else...just remember that"



-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Shawn
Sent: Monday, July 14, 2003 4:23 PM
To: techlists@alberni.net
Cc: Netfilter Mailing List

Please describe precisely, what you want to accomplish. An example:

I would like for hosts out on the public internet to be able to connect
to my nnn.nnn.nnn.0/24 through my router, whose internet facing
interface is responsible for routing said nnn.nnn.nnn.0/24, but where
nnn.nnn.nnn.0/24 lies across some 10.0.0.0/24 which is "directly
connected" to the other interface of said router.

There are folks out there that would like to help you, but if you can't
be bothered to take the time to describe your question with enough
specificity (and with correct terms), no one can help.

On Mon, 2003-07-14 at 12:52, Aaron Clausen wrote:
> Just like the subject says; is there any way to route a public IP/subnet
over a NAT address space?


