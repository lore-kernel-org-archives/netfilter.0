From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: forwarding
Date: Tue, 18 May 2004 11:53:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084895498.7289.7.camel@localhost>
References: <33934.200.44.170.105.1084890127.squirrel@200.44.170.105>
	 <1084891180.6410.18.camel@localhost>
	 <34012.200.44.170.105.1084892235.squirrel@200.44.170.105>
	 <1084892325.6417.40.camel@localhost>
	 <34103.200.44.170.105.1084893176.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <34103.200.44.170.105.1084893176.squirrel@200.44.170.105>
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
To: alucard@kanux.com
Cc: netfilter@lists.netfilter.org

On Tue, 2004-05-18 at 11:12, alucard@kanux.com wrote:
> > Although it probably did, are you sure nmap scanned port 8080? How about
> > nmap -sT -p 8080 10.73.219.156
> >
> > I would then trace both the wire and the iptables rules to find out
> > where it is breaking - John
> 
> Yes, it filters now but now it seems that the problem is in the 2nd server
> because I try to telnet to server 1's 8080 port and I get no response. Is
> it any missconfiguration on the router? take a look at this:
> ----
> root@mail:~# nmap -sT -p 8080 10.73.219.156
> 
> Starting nmap 3.48 ( http://www.insecure.org/nmap/ ) at 2004-05-18 11:06 VET
> Interesting ports on mail.aeropostal.com.ve (10.73.219.156):
> PORT     STATE    SERVICE
> 8080/tcp filtered http-proxy
> ----
> 
> the webserver in server 2 is working perfectly but im not able to reach it
> from server one, look at this in server 2, maybe im doing something wrong
> 
> [root@linserv root]# route
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
> 192.168.0.0     *               255.255.255.0   U     0      0        0 eth1
> 10.73.216.0     *               255.255.252.0   U     0      0        0 eth0
> 169.254.0.0     *               255.255.0.0     U     0      0        0 eth0
> 127.0.0.0       *               255.0.0.0       U     0      0        0 lo
> default         192.168.0.1     0.0.0.0         UG    0      0        0 eth1
<snip>
At first glance, the routing looks correct but I hope you are not trying
to access the web server from the Linux box.  You will have more
accurate results if you try to access through it.
If you try to telnet from the Linux box, you may find it uses a source
address of 10.73.219.156. The web server will then try to respond out
interface eth0.  I believe there is an option to override the source
port of telnet - -b I think.  You will also need to ensure that nothing
is interfering in the INPUT and OUTPUT chains.  I would suggest testing
through the Linux Box rather than from it - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


