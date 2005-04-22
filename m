From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ddos / no connection tracking / tarpitting
Date: Fri, 22 Apr 2005 08:50:02 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0504220847580.28527@blackhole.kfki.hu>
References: <BAY104-F417A02D74275560AA714548B2D0@phx.gbl>
	<42688A26.9000705@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42688A26.9000705@riverviewtech.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Taylor Grant <gtaylor@riverviewtech.net>
Cc: Vic N <vic778@hotmail.com>, netfilter@lists.netfilter.org

On Fri, 22 Apr 2005, Taylor Grant wrote:

> > So my question is, is this the basic element of building a good
> > anti-ddos solution wtih iptables to address a *large* volume of ddos
> > traffic to build iptables w/o connection tracking?
>
> Yes this is possible and (I think) fairly easy to do.  As I have never done this I can not tell you for sure, but this is what I would do if I were to do such a thing.
>
> I will presume that you are wanting to drop all traffic to a specif port on an IP address for the sake of this discussion.
>
> iptables -t raw -A PREROUTING -d 1.2.3.4 -p tcp --dport 5678 -j NOTRACK
> iptables -t filter -A FORWARD -d 1.2.3.4 -p tcp --dport 5678 -j TARPIT
>
> This will cause any traffic that comes in that is distend to 1.2.3.4 on port 5678 to  NOT be tracked with the connecting tracking sub system and to subsequently be redirected to the TARPIT target.

You *must* use the rule

iptables -t raw -A PREROUTING -s 1.2.3.4 -p tcp --sport 5678 -j NOTRACK

as well, otherwise conntrack will pick up the reply packets from the
TARPIT target.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

