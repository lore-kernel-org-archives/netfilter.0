From: "B. McAninch" <bmcaninch@penson.com>
Subject: Re: Allowing ping cauing problems with udp
Date: Mon, 28 Jun 2004 09:38:15 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088433494.29039.26.camel@wslinux-fractal.penson.com>
References: <40DAF2D2.9090706@advocap.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40DAF2D2.9090706@advocap.org>
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
To: netfilter <netfilter@lists.netfilter.org>

UDP is a stateless protocol and uses ICMP for errors - when a UDP port
is not open, the host returns an ICMP port unreachable. 

NMap determines the status of a UDP port under an assumption - if an
ICMP port unreachable message is received, the port is closed.
Conversely, if NMap does /not/ receive an ICMP port unreachable, it
assumes the port is open. This is why NMap thinks all ports are open.

From the NMap manpage:

"-sU    UDP scans: This method is used to determine which UDP (User
Datagram Protocol, RFC 768) ports are open on a host.  The technique is
to send 0 byte UDP packets to each port  on the  target  machine.  If we
receive an ICMP port unreachable message, then the port is closed.
Otherwise we assume it is open.  Unfortunately, firewalls often block
the port  unreachable messages, causing the port to appear open. 
Sometimes an ISP will block only a few specific dangerous ports such as
31337 (back orifice) and 139 (Windows NetBIOS), making  it  look  like 
these  vulnerable ports are open.  So don't panic immediately.
Unfortunately, it isn't always trivial to differentiate between real
open UDP ports and these filtered false-positives."

Your ruleset drops all incoming packets except those which are
established or related, tcp's going to port 22, and icmp echo-requests
and in the INPUT chain.

Read the output of your NMap scan /after/ you started dropping the ICMP
echo-requests in your INPUT chain - notice that it determined the host
was down merely because it did not respond to ICMP echo-requests:

"Starting nmap 3.50 ( http://www.insecure.org/nmap/ ) at 2004-06-24
09:33 CDT
Note: Host seems down. If it is really up, but blocking our ping probes, 
try -P0 Nmap run completed -- 1 IP address (0 hosts up) scanned in 12.053 seconds"

Try re-scanning, as advised by Nmap, with the -P0 option, to disable the
sending of ICMP echo-requests - you should get the same results as the
first scan. ;-)

On Thu, 2004-06-24 at 10:27, John McMonagle wrote:
> Think I have found a bug in either netfilter or the 2.6.6 kernel.
> 
> Main system I'm testing is using debian sarge.
> kernel 2.6.6-1-386
> iptables v1.2.9
> 
> Did the same with
> kernel  2.6.5-1-386
> 
> Also same problem on a similar k7 system.
> 
> Also the same on Fedora core 2 with 2.6.6 kernel
> Also tried different version of nmap.
> 
> I'm working on a new firewall.
> While testing nmap reported that all udp ports were open :-(
> Any I mean ALL tested ports.
> 
> Finally figured out allowing ping was doing it.
> 
> Here is a test script:
> #!/bin/bash
> #
> # flush all the rules in the filter and nat tables.
> #
> /sbin/iptables -F
> /sbin/iptables -t nat -F
> #
> # erase all chains that's not default in filter and nat table.
> /sbin/iptables -X
> /sbin/iptables -t nat -X
> #
> /sbin/iptables -P INPUT DROP
> /sbin/iptables -P FORWARD ACCEPT
> /sbin/iptables -P OUTPUT ACCEPT
> /sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> /sbin/iptables -A INPUT -p TCP --dport ssh -j ACCEPT
> /sbin/iptables -A INPUT -p ICMP  --icmp-type 8 -j ACCEPT
> #
> # reset the default policies in the nat table.
> #
> /sbin/iptables -t nat -P PREROUTING ACCEPT
> /sbin/iptables -t nat -P POSTROUTING ACCEPT
> /sbin/iptables -t nat -P OUTPUT ACCEPT
> 
> Only the icmp rule is needed in INPUT to cause the problem.
> 
> nmap -sU -p 1-10 -PI -PT fw
> Starting nmap 3.50 ( http://www.insecure.org/nmap/ ) at 2004-06-24 09:18 CDT
> Interesting ports on fw (192.168.101.254):
> PORT   STATE SERVICE
> 1/udp  open  tcpmux
> 2/udp  open  compressnet
> 3/udp  open  compressnet
> 4/udp  open  unknown
> 5/udp  open  rje
> 6/udp  open  unknown
> 7/udp  open  echo
> 8/udp  open  unknown
> 9/udp  open  discard
> 10/udp open  unknown
> 
> Nmap run completed -- 1 IP address (1 host up) scanned in 0.950 seconds
> 
> Only did 1-10 believe me they are all shown as open!
> 
> Without icmp rule no ports open.
> 
> Starting nmap 3.50 ( http://www.insecure.org/nmap/ ) at 2004-06-24 09:33 CDT
> Note: Host seems down. If it is really up, but blocking our ping probes, 
> try -P0
> Nmap run completed -- 1 IP address (0 hosts up) scanned in 12.053 seconds
> 
> Also should note they really are not open. I have named running and was 
> unable to access it.
> 
> Any way to fix this?
> 
> John
-- 
Bryan McAninch

Network Security Engineer

Penson Financial Services, Inc.

214.765.1366

