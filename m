From: "Joel n.solanki" <zealous@bonbon.net>
Subject: Re: [squid-users] squid iptables snmp
Date: 22 Oct 2004 21:18:57 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098460137.5034.23.camel@linux.d2visp.com>
References: <1098440013.4380.40.camel@linux.d2visp.com>
	<20041022152806.GA14687@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041022152806.GA14687@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Yes I can ping mikrotik router from mrtg server when squid + netfilter
box is between them

I can even trace them.
Yes IP forwarding is enabled on squid + netfilter box

No i m not doing NAT coz i have public ip addres so i m using that.

I have my setup with current scenario in other city and it is working
fine.
yes I have recompiled my kernel ...can kernel could be reason for this ?

Regards,

On Fri, 2004-10-22 at 20:58, Jason Opperisano wrote:
> On Fri, Oct 22, 2004 at 03:43:34PM +0530, Joel n.solanki wrote:
> > 
> > Dear all,
> > 
> > I dont know wheather this problem is related to squid or iptables
> > netfilter.
> > But let me specify my problem. I tried my lots but i cant solve this
> > problem. 
> > 		
> > 		
> > Mrtg server	Squid + Netfilter box	Mikrotik Router
> > 
> > When I try to create mrtg for mikrotik router which is behind Squid +
> > netfilter box, it gives me this error.
> 
> can you ping "Mikrotik Router" from "Mrtg server" when "Squid +
> Netfilter" is between them?
> 
> is IP forwarding enabled on "Squid + Netfilter" box?
> 
> what is the default gateway of "Mrtg server"?
> 
> what is the default gateway of "Mikrotik Router"?
> 
> are you trying to NAT the traffic to "Mikrotik Router"?
> 
> -j
-- 
Joel N.Solanki
Network Administrator
Mobile: 91-9426353268
Phone No: 0265-550001/2/3/4/5 Ext: 211/212
Digtial 2 Virtual Internet Service Provider.
http://www.packetraptor.com/
http://www.d2visp.com/
Gujarat (India)



