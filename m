From: "Joel n.solanki" <zealous@bonbon.net>
Subject: Re: [squid-users] squid iptables snmp
Date: 22 Oct 2004 16:04:42 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098441282.5037.1.camel@linux.d2visp.com>
References: <1098440013.4380.40.camel@linux.d2visp.com>
	<01a701c4b820$d626ae60$18e021c3@tolga>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01a701c4b820$d626ae60$18e021c3@tolga>
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
To: squid <squid@alanyatirim.com.tr>
Cc: netfilter <netfilter@lists.netfilter.org>, squid <squid-users@squid-cache.org>

Hi..

Well u didnt undertood my problem plz read it again.
But yes  i m in problem so i tried your solution.

service snmpd stop
edited the /etc/snmpd/snmp.conf and made that line rocommunity public
service snmpd start 

But still the same error :(

Any other Ideas.

Regards,

On Fri, 2004-10-22 at 15:51, squid wrote:
> step 1
> service snmpd stop
> step 2
> pico /etc/snmp/snmp.conf
> 
> step 3 change line
> #       sec.name  source          community
> #com2sec notConfigUser  default       public
> rocommunity public
> 
> step 4
> service snmpd start
> 
> :)
> 
> ----- Original Message ----- 
> From: "Joel n.solanki" <zealous@bonbon.net>
> To: "netfilter" <netfilter@lists.netfilter.org>; "squid" 
> <squid-users@squid-cache.org>
> Sent: Friday, October 22, 2004 1:13 PM
> Subject: [squid-users] squid iptables snmp
> 
> 
> >
> > Dear all,
> >
> > I dont know wheather this problem is related to squid or iptables
> > netfilter.
> > But let me specify my problem. I tried my lots but i cant solve this
> > problem.
> >
> >
> > Mrtg server Squid + Netfilter box Mikrotik Router
> >
> > When I try to create mrtg for mikrotik router which is behind Squid +
> > netfilter box, it gives me this error.
> >
> > ---------------------------------------------------------------------------
> > -base: Get Device Info on public@202.202.202.202:
> > SNMP Error:
> > no response received
> > SNMPv1_Session (remote host: "202.202.202.202" [202.202.202.202].161)
> >                  community: "public"
> >                 request ID: 1723286139
> >                PDU bufsize: 8000 bytes
> >                    timeout: 2s
> >                    retries: 5
> >                    backoff: 1)
> > at /usr/bin/../lib/mrtg2/SNMP_util.pm line 450
> > SNMPGET Problem for sysDescr sysContact sysName sysLocation sysObjectID
> > on public@202.202.202.202:
> > at /usr/bin/cfgmaker line 657
> > --base: Vendor Id:
> > --base: Populating confcache
> > ---------------------------------------------------------------------------
> >
> >
> > If I removed squid + netfilter box then I tried to create mrtg for
> > mikrotik router then i can easily do it. It doesnt give me any error.
> >
> >
> > Now i dont know wheather Is this problem related to Netfilter Iptables
> > OR squid proxy server ????
> >
> > I thought this might be iptables firewall problem so I just made the
> > netfilter + squid box iptable rules to INPUT OUTPUT FORWARD to ACCEPT.
> > So now it should work but it didnt.
> >
> > Now i cant sort out where is the problem lying ...with iptables or with
> > squid or any thing else ...
> >
> > Awaiting for Ideas to get the solution in urgent.
> >
> >
> > -- 
> > Joel N.Solanki
> > Network Administrator
> > Mobile: 91-9426353268
> > Phone No: 0265-550001/2/3/4/5 Ext: 211/212
> > Digtial 2 Virtual Internet Service Provider.
> > http://www.packetraptor.com/
> > http://www.d2visp.com/
> > Gujarat (India)
> >
> >
> > 
-- 
Joel N.Solanki
Network Administrator
Mobile: 91-9426353268
Phone No: 0265-550001/2/3/4/5 Ext: 211/212
Digtial 2 Virtual Internet Service Provider.
http://www.packetraptor.com/
http://www.d2visp.com/
Gujarat (India)



