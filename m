From: Dragomir Todorov <drago@maxcom-bg.com>
Subject: VPN Clients behind firewall
Date: Thu, 05 Jan 2006 14:40:50 +0200
Message-ID: <43BD13D2.5000200@maxcom-bg.com>
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
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
I have a problem with VPN Clients behind firewall..
           |         Linux                    
PPTP  -+-> Masq and --> Internet --> PPTP
Client  |         Firewall                             Server

The problem is that my PPTP clients behind firewall couldn't connect
here is the system log
pptpd[8688]: GRE: read(fd=6,buffer=804e560,len=8196) from PTY failed: 
status = -1 error = Input/output error, usually caused by unexpected 
termination of pppd, check option syntax and pppd logs
pptpd[8688]: CTRL: PTY read or GRE write failed (pty,gre)=(6,7)

And when Clients are directly connected to internet everithing is fine...

the Linux mashine is with kernel 2.4.29 and iptables 1.3.2
I've read a lot for documents about VPN-Masq and the pach on kernel 
2.2.x but there is nothing about 2.4.29..
Is the problem with masq or enything else?? Please help....

-- 
Dragomir Todorov
Network Administrator
Maxcom Ltd. Burgas, Bulgaria
AS34909



