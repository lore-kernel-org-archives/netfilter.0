From: Fernando Montenegro <fsmontenegro@yahoo.ca>
Subject: Help needed with ESP and DNAT on Debian 2.4.26 / iptables 1.2.9-10
Date: Sat, 28 Aug 2004 12:37:48 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4130B4DC.30504@yahoo.ca>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi there!

I need help getting DNAT to work with ESP packets on a Debian box
('testing/sarge' release, 2.4.26 kernel, iptables 1.2.9-10). This used 
to work fine on a RH90...

This is used to suport a laptop running XP Pro logging in to a corporate
VPN with the Nortel VPN client. Company policy and authentication
requirements prevent me from changing anything in that setup (so I can't
change the VPN to terminate AT the Linux box for example).

My problem is: incoming ESP packets are not being DNATed as I wanted
them to. The rule I use is:
-A PREROUTING -p esp -s <VPN server> -j DNAT --to-destination <laptop>

The rule does get hit into (I have a mirror rule with -j LOG), but the
translation does NOT happen.

Like I said, it used to work fine when the server was a RH90.

How do I begin troubleshooting this? Some things I tried so far are:
- try to DNAT ALL traffic (not just -p esp)
- force ipt_esp to load (modprobe ipt_esp and yes, it is under
/lib/modules/<kernel>/kernel/ipv4/netfilter)
- tried doing an SNAT on the preceding UDP/500 connection to maybe trick
netfilter into understanding the ESP part later

Naturally, I have tcpdump logs, syslogs, etc... for further analysis,
but I'm weak when it comes to netfilter troubleshooting...

Help!

Thanks in advance.

Cheers,
Fernando
-- 
Fernando Montenegro, CISSP  -  fsmontenegro@yahoo.ca
Markham, Ontario, Canada



