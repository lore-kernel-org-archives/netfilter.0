From: "Simon Lodal" <simonl@mirrormind.com>
Subject: Re: Netfilter in an HA-Enviroment
Date: Tue,  7 Oct 2003 01:37:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310070137.AA367067176@mirrormind.com>
Reply-To: <simonl@mirrormind.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Harald Welte <laforge@netfilter.org>, netfilter@lists.netfilter.org


Hello

Harald, I read your paper, and I'd love something like this. As I understand it, you imply a one master / multiple slaves model. However, what would prevent your protocol from being used in a master/master setup?

That would be much better, sometimes one fast machine is not enough. Each master could have a lighter load, and therefore more ressources to communicate with the others. And when one master goes down, only a group of users will be bothered by the delay before the others catch up it's traffic.

Simon


---------- Original Message ----------------------------------
From: Harald Welte <laforge@netfilter.org>
Date:  Fri, 3 Oct 2003 13:05:43 +0200

>On Mon, Sep 22, 2003 at 09:04:49AM +0200, Marc Hansen wrote:
>> Hello,
>> how is it possible to have two firewalls in an HA-Enviroment?
>
>only if you do stateless packet filtering and no NAT. 
>
>> Does somebody have a hint or a link for me?
>
>There is an ongoing implementation for conntrack state synchronization,
>but it's not finished or public yet.
>
>For the design paper, please
>see
>http://cvs.gnumonks.org/presentation/netfilter-failover-ols2002/netfilter-failover-ols2002.tex?rev=1.1&content-type=text/x-cvsweb-markup
>
>> Marc 
>
>-- 
>- Harald Welte <laforge@netfilter.org>             http://www.netfilter.org/
>============================================================================
>  "Fragmentation is like classful addressing -- an interesting early
>   architectural error that shows how much experimentation was going
>   on while IP was being designed."                    -- Paul Vixie
>
>

