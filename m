From: "Joel n.solanki" <zealous@bonbon.net>
Subject: Re: squid iptables snmp
Date: 22 Oct 2004 19:09:27 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098452366.5057.3.camel@linux.d2visp.com>
References: <1098440013.4380.40.camel@linux.d2visp.com>
	<41790D17.2020602@unav.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41790D17.2020602@unav.es>
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
To: Emilio Casbas <ecasbas@unav.es>
Cc: netfilter <netfilter@lists.netfilter.org>

Yes i have configured that also.


On Fri, 2004-10-22 at 19:07, Emilio Casbas wrote:
> Joel n.solanki wrote:
> 
> >Dear all,
> >
> >I dont know wheather this problem is related to squid or iptables
> >netfilter.
> >But let me specify my problem. I tried my lots but i cant solve this
> >problem. 
> >		
> >		
> >Mrtg server	Squid + Netfilter box	Mikrotik Router
> >
> >When I try to create mrtg for mikrotik router which is behind Squid +
> >netfilter box, it gives me this error.
> >
> >---------------------------------------------------------------------------
> >-base: Get Device Info on public@202.202.202.202:
> >SNMP Error:
> >no response received
> >SNMPv1_Session (remote host: "202.202.202.202" [202.202.202.202].161)
> >                  community: "public"
> >                 request ID: 1723286139
> >                PDU bufsize: 8000 bytes
> >                    timeout: 2s
> >                    retries: 5
> >                    backoff: 1)
> > at /usr/bin/../lib/mrtg2/SNMP_util.pm line 450
> >SNMPGET Problem for sysDescr sysContact sysName sysLocation sysObjectID
> >on public@202.202.202.202:
> > at /usr/bin/cfgmaker line 657
> >--base: Vendor Id:
> >--base: Populating confcache
> >---------------------------------------------------------------------------
> >  
> >
> Are you configured the snmp_access acl  in squid.conf?
> some like;
> acl snmp-public snmp_community public
> acl snmp-user src host_ip
> snmp_access allow snmp-public localhost
> snmp_access allow snmp-public snmp-user
> snmp_access deny all
> 
> 
> Thanks
> Emilio C.
-- 
Joel N.Solanki
Network Administrator
Mobile: 91-9426353268
Phone No: 0265-550001/2/3/4/5 Ext: 211/212
Digtial 2 Virtual Internet Service Provider.
http://www.packetraptor.com/
http://www.d2visp.com/
Gujarat (India)



