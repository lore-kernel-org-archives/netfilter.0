From: "lu" <j.lu@tiesse.com>
Subject: iptables masquerade cache  problems
Date: Mon, 29 Sep 2003 10:23:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c38662$f2a93bc0$01070a0a@858sxt07>
Reply-To: <j.lu@tiesse.com>
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

Hi,
I have two lines that were masqueraded, one ADSL and another is ISDN for
backup. When the line ADSL is broken  I switch the line to ISDN. The problem
is: when I use ping to test (ping -t from windows client), after the line
was switched to ISDN, the source address was still that of ADSL  instead of
ISDN. But, when I stopped the ping from client for a while, all things went
well. It seems a problem of cache. What is the work-around for it? At a
moment I just down the ADSL interface.  You can do this test with two lan
interfaces.
The Configuration is:
	iptables -t nat -A POSTROUTING -o hsb0 -j MASQUERADE    # for ADSL
	iptables -t nat -A POSTROUTING -o ippp0 -j MASQUERADE    # for ISDN

	default gw dev was hsb0  (ADSL)
	when ADSL was down then :
	route del default dev hsb0
	route add default dev ippp0


Best regards,
Jianliang Lu

TieSse s.p.a      Ivrea (to) Italy
j.lu@tiesse.com
luj@libero.it
http://www.tiesse.com


