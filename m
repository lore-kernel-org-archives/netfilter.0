From: Ben Becker <bbecker2@cfl.rr.com>
Subject: NAT setup
Date: Fri, 19 Dec 2003 17:21:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071872488.2427.76.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello everybody,

I'm trying to figure out a way to set up basic NAT, but with the ability
to allow users on the local side to use any static IP configuration. 
Quick Example: somebody has a static IP configured on their laptop,
stays at a hotel with Internet access, and will be able to browse the
Internet without changing their IP settings.

My first question is: does anybody know what this feature is called? 
Second question: Is it possible to do this with netfilter?  I'm thinking
this would require creating a new virtual interface for each user's
configuration to match their gateway (among other things), but I'm
hoping netfilter has some magical way of doing this (hoping).  If not,
does anybody know of any software that can do this?

	Regards,
	Ben Becker


