From: mclinden@informed.net
Subject: Forwarding of packets to an FTP gateway (2nd request)
Date: Fri, 4 Jun 2004 16:12:56 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF07AC67BA.37C01A4F-ON85256EA9.006B611B-85256EA9.0070FB29@informed.net>
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
To: netfilter@lists.netfilter.org

Well, I've played with this for a week, and I can't be sure that it isn't 
the routers/switches in between, but the configuration (using Linux 2.6 
and iptables 1.2.9) is:

MS Windows Client                                           Linux 
"Forwarder"
172.16.16.39/22 172.16.16.8/22
Default Route: 172.16.16.8   ------>            Default Route: 
172.16.16.20 
            ^                  ^
             |                    |
             |                    |
             ___________________________________
                                                    |
                                                    |
                                 CISCO Catalyst
                                  172.16.16.200
                                                    |
                                       ASN1 Router
                                                    |
                                       ASN1 Router
                                                    |
                                 CISCO Catalyst
                                  172.16.8.200
                                                    |
                                                    |
              ________________
             |
             |
             v
Linux FTP Proxy (incoming port 2370)
Internal Interface: 172.16.11.237/22
External Interface: Internet

I've changed the MS Windows Client to use the Linux Forwarder as the 
default route (subnet 16). I've added a rule to the Linux FTP Proxy to 
autoforward packets to the FTP Proxy listening on port 2370 via:

iptables -t nat -A PREROUTING -p tcp -s 172.16.0.0/16 --dport 21 -j DNAT 
--to 172.16.11.237:2370

If I FTP from 172.16.16.8 to 172.16.11.237 I am redirected to the 2370 on 
237. If I FTP from 172.16.16.36 to any outside host, the incoming packets 
are detected by tcpdump. But none of the rulesets I've tried on 
172.16.16.8 or 172.16.11.237 seem to allow me to redirect FTP traffic 
though 172.16.16.8 and 172.16.11.237.

Do I need to make 172.16.11.237 the default route  or can I do this with 
iptables, alone?

Thanks in advance.

Sean McLinden
Allegheny County Health Department




