From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Netfilter and IPSec interaction
Date: Fri, 15 Jul 2005 09:55:12 -0500
Message-ID: <42D7CE50.1000904@riverviewtech.net>
References: <20050714122109.bl71ded9gkkoc0c4@www.milivojevic.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050714122109.bl71ded9gkkoc0c4@www.milivojevic.org>
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

Aleksandar Milivojevic wrote:
> I'm writing set of firewall rules for IPSec based VPN, and have couple of
> questions.
> 
> I know that packets are supposed to go through Netfilter tables twice (as
> received from the wire, and than as outputed by IPSec module).  However, what I
> noticed is that this seems to be true only for incomming packets.  The outgoing
> packets seems to go through Netfilter tables only once.

What kernel are you running and have you applied the (4) Patch-o-Matic (NG) IPSec patches that are meant to address this very issue?  Word to the wise, I've had problems applying said patches in such that I had to edit the info file inside of the <pom root>/patchlets/ipsec-0<number>-<rest of patch name>/ directory and remove the dependencies on other patches.  I've found that patch 01 would not apply b/c it was looking for a different patch that does not exist as it has already been applied to the 2.6.10 and 2.6.12.2 (other unknown) kernel.  Once patch 01 has been applied 02, and 03 should go ok, but 04 does not see that 03 has been applied.  If you remove the dependency (or require word (what ever)) on patch 03 then patch 04 will (test and) apply cleanly to a kernel with patches 01, 02, and 03 already in place.

Has any one else experienced such problem with applying the IPSec-0x patches?



Grant. . . .

