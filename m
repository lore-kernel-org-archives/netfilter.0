From: "Joel n.solanki" <jnsolanki@d2visp.com>
Subject: problem with squid netfilter snmp
Date: 22 Oct 2004 15:41:53 +0530
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098439913.4373.37.camel@linux.d2visp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: squid <squid-users@squid-cache.org>, netfilter <netfilter@lists.netfilter.org>

Dear all,

I dont know wheather this problem is related to squid or iptables
netfilter.
But let me specify my problem. I tried my lots but i cant solve this
problem. 
		
		
Mrtg server	Squid + Netfilter box	Mikrotik Router

When I try to create mrtg for mikrotik router which is behind Squid +
netfilter box, it gives me this error.

---------------------------------------------------------------------------
-base: Get Device Info on public@202.202.202.202:
SNMP Error:
no response received
SNMPv1_Session (remote host: "202.202.202.202" [202.202.202.202].161)
                  community: "public"
                 request ID: 1723286139
                PDU bufsize: 8000 bytes
                    timeout: 2s
                    retries: 5
                    backoff: 1)
 at /usr/bin/../lib/mrtg2/SNMP_util.pm line 450
SNMPGET Problem for sysDescr sysContact sysName sysLocation sysObjectID
on public@202.202.202.202:
 at /usr/bin/cfgmaker line 657
--base: Vendor Id:
--base: Populating confcache
---------------------------------------------------------------------------


If I removed squid + netfilter box then I tried to create mrtg for
mikrotik router then i can easily do it. It doesnt give me any error.


Now i dont know wheather Is this problem related to Netfilter Iptables
OR squid proxy server ????

I thought this might be iptables firewall problem so I just made the
netfilter + squid box iptable rules to INPUT OUTPUT FORWARD to ACCEPT.
So now it should work but it didnt.

Now i cant sort out where is the problem lying ...with iptables or with
squid or any thing else ...

Awaiting for Ideas to get the solution in urgent.



-- 
Joel N.Solanki
Systems Administrator
Mobile: 91-9426353268
Phone No: 0265-550001/2/3/4/5 Ext: 211/212
Digtial 2 Virtual Internet Service Provider.
http://www.packetraptor.com/
http://www.d2visp.com/
Gujarat (India)


