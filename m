From: Milan Durovic <milan@milica.com.au>
Subject: redirecting packets from one destination to a local host
Date: Wed, 30 Jun 2004 14:51:22 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40E246CA.9030902@milica.com.au>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I have iptables 1.2.2 (debian woody), kernel 2.4.25. In my network 
setup, I have an ADSL modem/router that does NAT and redirects all the 
smtp, http, etc requests to a Linux machine on inside. This works fine.

The problem: when I recently installed mailman, its scripts try to 
access smtp server via address that maps into the public IP address of 
the ADSL modem/router. So, requests never reach the mail server, which 
is running on the Linux machine itself.

I want to setup iptables so that any requests originating from the Linux 
server and destined to the public IP address of the ADSL modem/router 
are redirected to the Linux server itself.

I tried:

iptables -t nat -A OUTPUT -d public_ip -j REDIRECT

(rule was accepted).

I also tried:

iptables -t nat -A OUTPUT -d public_ip -p tcp -j DNAT --to lin_srv_ip

but the command failed ("iptables: Invalid argument").

When I try "telnet public_ip smtp" I get 'connection refused' and when I 
then go with "iptables -t nat -v -L" it shows that no packet matched the 
REDIRECT rule.

Is there a simple way of achieving this? REDIRECT seems to be the right 
sort of action that I want, but it doesn't seem to work.

Regards,
Milan

