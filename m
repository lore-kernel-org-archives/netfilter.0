From: Wim Ceulemans <wim.ceulemans@able.be>
Subject: Re: netfilter before routing for local outgoing packets ?
Date: Fri, 26 Sep 2003 09:36:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F73EC72.2060809@able.be>
References: <7C9884991ADAE0479C14F10C858BCDF5122E52@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----------=_1064561774-18437-14"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122E52@alderaan.smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Daniel Chemko <dchemko@smgtec.com>
Cc: jt@hpl.hp.com, netfilter@lists.netfilter.org

This is a multi-part message in MIME format...

------------=_1064561774-18437-14
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Daniel

See recent discussion about the routing decision in the netfilter-devel 
archive.
As I understood it:

The first routing decision is taken only for packets originating from an 
unbound socket. If the source ip address is determined (by the routing 
decision), then the packet travels through the output chains and only if 
it is changed in the mangle table it can be re-routed.

For packets originating from a bound socket, no routing decision is 
taken before the output chain, only the routing decision after is taken.

Regards
Wim

Daniel Chemko wrote:

>If you mark a packet in the OUTPUT table, the routing algorithm should
>re-run and decide the path that was defined in the routing policy, so
>here is the order of relevant events:
>
>Program Send Packet
>Routing Decision - Go out normal Interface
>MANGLE: OUTPUT - Mark packet as fwmark 1
>Routing Decision - Choose route as usual, but include fwmark 1 in
>equation.
>
>
>Warning: That is supposedly the behavior, but I have yet to get it
>working properly.
>
>
>
>  
>


-- 
Wim Ceulemans
R&D Engineer

Secure Internet Communication with aXs Guard

Able NV
Leuvensesteenweg 282 - B-3190 Boortmeerbeek - Belgium
Phone: + 32 15 50.44.00 - Fax: + 32 15 50.44.09
E-mail: wim.ceulemans@able.be



--
Security check on this e-mail has been done by aXs GUARD
(http://www.axsguard.com)


------------=_1064561774-18437-14--

