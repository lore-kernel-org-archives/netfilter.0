From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iptables and shutdown trouble
Date: Fri, 13 Sep 2002 19:42:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020913184207.IYEW11421.mta03-svc.ntlworld.com@there>
References: <6873.213.13.176.13.1031933510.squirrel@www.ipatimup.up.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6873.213.13.176.13.1031933510.squirrel@www.ipatimup.up.pt>
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

On Friday 13 September 2002 5:11 pm, Miguel Carvalho wrote:

> Hi,
>
> We are having some troubles when we try to shutdown the system.
> This appens after we put Iptables to work.
> When the shutdown enter the Ethernet interface shutdown( eth0 ), it hangs
> completelly. The solution is to turn-off the server.
> I'm not shure, but it seams to me that something is still using the
> network interface when it reaches the Interfcae shutdown stage.

I'm not sure what you mean by something else 'using' the interface, but then 
again I'm not sure what you're doing to shut it down.   A simple 'ifconfig 
eth0 down' should not get held up by anything, I wouldn't have thought - it 
certainly isn't bothered about any traffic which happens to be going through 
the interface at the time....

What is your interface shutdown procedure doing which might allow it to get 
stuck ?

Antony

-- 

G- GIT/E d- s+:--(-) a+ C++++$ UL++++$ P+(---)>++ L+++(++++)$ !E W(-) N(-) o? 
w-- O !M V+++(--) !PS !PE Y+ PGP+> t- tv@ b+++ DI++ D--- e++>+++ h++ r@? 5? 
!X- !R K--?

