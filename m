From: Graham Swallow <Information-Cascade@ntlworld.com>
Subject: DNAT udp 192.163.1.2:514 -> 127.0.0.1:1514 -- from local box
Date: Wed, 16 Jul 2003 20:58:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030716205850.0b55f8b5.Information-Cascade@ntlworld.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LIST-netfilter <netfilter@lists.netfilter.org>


VERSION: uptables-1.2.1.a

I Type:
	iptables
		-t nat -A OUTPUT
		-p udp -d 192.168.1.2 --dport 514
		-j DNAT --to 127.0.0.1:1514
It replies:
	iptables: Invalid argument


The traffic is to ORIGINATE from a local process (this is 192.168.1.46),
heading out to a ficticious 192.168.1.2, and DNAT'd to localport 1514

syslogd reuses to log to a port other than 514, but using DNAT as a
kludge should work. I've tried a range of options, and got REDIRECT
to almost work, but after the first packet it gave connection refused.
NAT-HOWTO.txt 6.3.7 says must be OUTPUT and 127  

I am using socat  http://www.dest-unreach.org/socat/  to test

	socat UDP4-LISTEN:1514 -	# server

	socat -  UDP4:127.0.0.1:1514	# client


   regards
--
   Graham
   Information-Cascade -at- ntlworld.com

