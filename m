From: Matthias Mueller <mueller@rz.uni-karlsruhe.de>
Subject: netfilter on ia64
Date: Thu, 23 Jun 2005 07:07:55 +0200
Message-ID: <200506230707.56224.mueller@rz.uni-karlsruhe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I'm currently setting up a natting router (simple setup: 1:1 for about 25 
host, routing the other traffic, no filters) and got an itanium 2 box for 
that job.
As I have no experience on using iptables on ia64, I'm looking for some 
advice: is it as stable and tested as on x86 or should I exchange that box 
and use a normal x86-system?
I know there are some issues with network cards on ia64 (one of our fibre 
gigabit cards, doesn't get link on that ia64 box, but works fine in a x86 
box...).

Bye,
Matthias

