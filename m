From: Jason Opperisano <opie@817west.com>
Subject: Re: Resend: MASQUERADE: Route sent us somewhere else.
Date: Tue, 5 Apr 2005 13:03:49 -0400
Message-ID: <20050405170349.GA3033@bender.817west.com>
References: <200504051035.j35AZn2H025714@osprey.tkevans.com>
	<20050405145028.GA2620@bender.817west.com>
	<20050405161238.M71851@tkevans.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050405161238.M71851@tkevans.com>
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
To: netfilter@lists.netfilter.org

On Tue, Apr 05, 2005 at 12:12:38PM -0400, Tim Evans wrote:
> Thanks, again.
> 
> Please see the attached outputs of each of these commands.

you have two default routes, one pointing out the external interface and
one pointing out the internal interface:

  default via 69.251.48.1 dev eth1 
  default via 192.168.252.254 dev eth0

get rid of the second one.  if you have networks beyond 192.168.252.254
that you need to reach, then add routes for those networks specifically.
IIRC, you're running RedHat, in which case you can add your routes
to the /etc/sysconfig/static-routes file so that they are restored at
each reboot.

the problem here is that it ever worked in the first place, not that it
doesn't work now.

-j

--
"Brian: Ah, if my memory serves me, this is the physics department.
 Chris: That would explain all the gravity."
         --Family Guy

