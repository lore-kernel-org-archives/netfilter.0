From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: iprange match processing overhead
Date: 05 May 2003 10:23:55 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052144634.1861.16.camel@jasiiitosh.nexusmgmt.com>
References: <Pine.LNX.4.33.0305051004570.607-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0305051004570.607-100000@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

	Thanks for the reply.  If that's the only overhead, I don't think we'll
notice it.  Is that all the additional overhead incurred?
	I don't mean to be insulting.  I ask the question for two reasons.  We
are looking to develop our products for use in a carrier environment so
we may have devices with many thousands of users behind them. We are
also looking to use it in server farm environments where we will need
Gigabit throughput at times.  We had developed a simple routine that
took a range and divided it into a series of subnets and then created
iptables rules using standard source and destination addresses. 
However, we noticed that this sometimes created many rules and thus
deemed the use of ranges to be less efficient than the use of subnets.
	Does the iprange patch in effect create multiple standard
source/destination rules or is its processing as efficient as the
standard source/destination rules once it has passed the any address
evaluation? Thanks in advance for the clarification - John

On Mon, 2003-05-05 at 04:17, Jozsef Kadlecsik wrote:
> On 30 Apr 2003, John A. Sullivan III wrote:
> 
> > We've done some initial testing of the iprange patch and are thrilled
> > with it.  However, is it any more processing intensive to use an iprange
> > match than to use the standard source or destination match, i.e., -s
> > rather than -m iprange --iprange --src/dst-range? Thanks- John
> 
> Yes.
> 
> The iprange match is an extension, which means that it's preceded by an
> implicit match against the any address (as if -s 0.0.0.0/0 -d 0.0.0.0/0
> were specified).
> 
> But I don't think you'd notice the extra overhead. :-)
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


