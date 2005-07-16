From: Trevor Cordes <netfilter@tecnopolis.ca>
Subject: Re: Netfilter and IPSec interaction
Date: Sat, 16 Jul 2005 12:34:03 -0500
Message-ID: <20050716173403.GA16509@pog.tecnopolis.ca>
References: <20050714122109.bl71ded9gkkoc0c4@www.milivojevic.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Aleksandar Milivojevic <alex@milivojevic.org>, netfilter@lists.netfilter.org

On Thu, Jul 14, 2005 at 12:21:09PM -0500, Aleksandar Milivojevic wrote:
> I'm writing set of firewall rules for IPSec based VPN, and have couple of
> questions.
> 
> I know that packets are supposed to go through Netfilter tables twice (as
> received from the wire, and than as outputed by IPSec module).  However, what I
> noticed is that this seems to be true only for incomming packets.  The outgoing
> packets seems to go through Netfilter tables only once.

It drove me batty when I first ran into it... you are not alone.

> So, my question is, is something going wrong here, or is this asymetry by
> design?

No, it's a serious shortcoming of the design of the NAT/IPSEC code and 
needs to be addressed in the mainstream kernel yet no one AFAIK knows how 
to do it cleanly yet.  See my RH bugzilla post and make some noise:

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=143374

Grant's post gives an excellent summary.  As per his hints, I'm going to 
try to get the ipsec/nat patches into the latest FC3 kernel (2.6.12) and 
see if I can get that working.  My old patched 2.6.10 is getting long in 
the tooth and another old 2.6.10 mem leak bug is killing me once in a 
while.

I'll report back.

(Grant, are you for sure saying you got the patches to go into 2.6.12 and 
compile?)

