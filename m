From: Cristian Goian <cfgoian@yahoo.com>
Subject: NAT working for TCP and _NOT_ working for UDP
Date: Thu, 18 Dec 2003 11:48:58 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031218194858.6048.qmail@web40703.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-803727192-1071776938=:5537"
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
To: netfilter@lists.netfilter.org

--0-803727192-1071776938=:5537
Content-Type: text/plain; charset=us-ascii

Hi,
I have a PII/500 PC with eth0=public address, eth1=192.168.0.1 for DMZ and eth2=192.168.1.1 for LAN.
I have DNAT for web to my DMZ (TCP) working and DNAT for DNS to my DMZ (UDP) not working.
Kernel is 2.4.18, iptables 1.2.7a .
No services on that box.
From inside (LAN) I can conect to web server using IP address (NATed) and not by name (DNS not being able to reach).
All traceroute go through NATbox without being DNAT-ed (to default gateway outside to my ISP), a problem similar to "DNATing packets sent to the NATing box" posted couple a day before by someone else, but no service on mine.
The DNS in DMZ are working 100%. Same the web server wich I can reach.
 
It like DNAT working for TCP and not for UDP
 
 

Many thaks in advance for any help

CFG


---------------------------------
Do you Yahoo!?
New Yahoo! Photos - easier uploading and sharing
--0-803727192-1071776938=:5537
Content-Type: text/html; charset=us-ascii

<DIV>Hi,</DIV>
<DIV>I have a PII/500 PC with eth0=public address, eth1=192.168.0.1 for DMZ and eth2=192.168.1.1 for LAN.</DIV>
<DIV>I have DNAT for web to my DMZ (TCP) working and DNAT for DNS to my DMZ (UDP)&nbsp;not working.</DIV>
<DIV>Kernel is 2.4.18, iptables 1.2.7a .</DIV>
<DIV>No services on that box.</DIV>
<DIV>From inside (LAN) I can conect to web server using IP address (NATed) and not by name (DNS not being able to reach).</DIV>
<DIV>All traceroute go through NATbox without being DNAT-ed (to default gateway outside to my ISP), a problem similar to "DNATing packets sent to the NATing box" posted couple a day before by someone else, but no service on mine.</DIV>
<DIV>The DNS in DMZ are working 100%. Same the web server wich I can reach.</DIV>
<DIV>&nbsp;</DIV>
<DIV>It like DNAT working for TCP and not for UDP</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<P>Many thaks in advance for any help</P>
<P>CFG</P><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://pa.yahoo.com/*http://us.rd.yahoo.com/evt=21260/*http://photos.yahoo.com">New Yahoo! Photos - easier uploading and sharing</a>
--0-803727192-1071776938=:5537--

