From: Rob Verduijn <rverduij@dds.nl>
Subject: Re: nfs
Date: Tue, 05 Aug 2003 11:02:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060074177.2848.3.camel@rincewind>
References: <1060065419.3395.1.camel@rincewind>
	 <20030805081723.GD11849@localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030805081723.GD11849@localnet>
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
To: sr@gimp.org
Cc: netfilter@lists.netfilter.org

Hi there,

I do have some influence over the nfs server, (it's my backup server) so
that wouldn't be a big problem.

My second question would be what the IP table rule settings would be on
the server :)




On Tue, 2003-08-05 at 10:17, Sven Riedel wrote:
> On Tue, Aug 05, 2003 at 08:36:59AM +0200, Rob Verduijn wrote:
> > What would be the rule setting I need to mount a remote nfs share when I
> > am using connection tracking and a default DROP policy?
> 
> First, since NFS uses RPCs you need to know what ports rpc.mountd,
> rpc.statd and maybe rpc.lockd are running on. If you have influence over
> the server, try setting the ports explictly (invoke the daemons with the
> -p flag. Works with statd and mountd, lockd is a bit more tricky). 
> 
> Otherwise the ports are
> allocated dynamically and the client has to ask the remote portmapper
> where the daemons are listening. Any rules in this case are only valid
> as long as the rpc-services on the nfs-server aren't restarted.
> 
> You'll have to allow the following ports:
> udp/2049: nfs 
> tcp/2049: nfs, if you're using nfs over tcp, nfs v3 and up
> udp/111: portmap/sunrpc
> tcp/111: portmap/sunrpc
> udp/<rpc.statd>
> tcp/<rpc.statd>
> udp/<rpc.mountd>
> tcp/<rpc.mountd>
> and maybe:
> udp/<rpc.lockd>
> tcp/<rpc.lockd>
> 
> Regs,
> Sven
> 


