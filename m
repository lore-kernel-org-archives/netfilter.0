From: Miguel Angel Amador L <amador@puc.cl>
Subject: Re: Max Concurrent Session
Date: Wed, 15 Dec 2004 17:37:49 -0300
Message-ID: <1103143069.4123.13.camel@JOKER.INFOWORLD.CL>
References: <1102705899.4516.50.camel@JOKER.INFOWORLD.CL>
	<1102796799.29423.2.camel@nostromo.bgsecm.com>
Reply-To: amador@puc.cl
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1102796799.29423.2.camel@nostromo.bgsecm.com>
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
To: Jose Maria Lopez <jkerouac@bgsec.com>
Cc: NetFilter Users <netfilter@lists.netfilter.org>


> In theory you should have no problems or netfilter limitations on
> that matter. What you will need it's enough memory and a powerful
> CPU. It's very important that you optimize the rules as much as
> you can, having in mind how the packets traverse the chains and
> the rules and trying that the sessions traverse the minimum number
> of rules. You should also use connection tracking so related and
> established connections are accepted with just a few rules.

Gracias necesitaba corroborar esto para poder cambiar un fw comercial
que no me aguantaba esta capacidad y requeria estar seguro que esto
funcionaria.

Saludos 
__
Miguel Angel Amador L          
  fono: +562  204 8611 #231
  fax:  +562  204 8603
e-mail: amador@puc.cl


