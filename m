From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
Subject: Why I can not logon to a DC through my Linux box gateway?
Date: Thu, 10 Jun 2004 19:34:30 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c44ede$e4e7a8b0$1d01a8c0@palettemm.com>
Reply-To: <bassam@palettemm.com>
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
To: netfilter@lists.netfilter.org

Dear Fellows,
   I am developing a Wi-Fi project and I got stuck in my progress when I
tried to logo on to a domain controller through my Linux gateway box. In
fact I have the following depicted scenario:

+------------+                          +------------+
+------------+
|    Client  |eth0                 eth1 |    GW      |eth0
eth0| Domain     |
| User name: |192.168.0.3   192.168.0.1 |            |192.168.1.232
192.168.1.23| Controller |
| Password:  |--------------------------|
|----------------------------|            |
| Domain     |       LAN                |            |             LAN
|            |
+------------+                          +------------+
+------------+


When I try to logon to the DC by using this above scenario I get the
following message "The system cannot log you on because the domain
<xxxx> is not available". It seems that the client is not able to see
the domain controller the my linux gateway.
Note: I wrote my own firewall by using iptables, and I tried my best to
overcome this problem but I couldn't.

So any idea or support I can find from your side, your cooperation is
highly appreciated.

Regards
Bassam A. Al-Khaffaf
R & D Engineer
R & D Department
Palette Multimedia Bhd.

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.516 / Virus Database: 313 - Release Date: 9/1/2003
 


