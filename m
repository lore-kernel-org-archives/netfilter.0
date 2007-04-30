From: David <shadoweyez@gmail.com>
Subject: Port forwarding question
Date: Mon, 30 Apr 2007 10:37:35 -0700
Message-ID: <4636295F.7040202@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:user-agent:mime-version:to:subject:x-enigmail-version:content-type:content-transfer-encoding;
	b=DFuX7gIKpPPRR9/JO6MkpiTI7qkufv1Raa5xG3g4BnLOyV7MMxJa4CKFtoGSolFUDhsbGKDKzQTJihOqVf0xpxn362Cx6O4l6O8iSxv/8TZGIEJBNLN6vF4MEYyamZZYfsEc9n6SIDBhO831QmlJNNOwtjDO4p8lyRE8d8TjbHc=
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all - first post, should be a simple question but google and the docs are not
helping

I want to forward port 10000 from internal hosts to the internet and it works with:

iptables -t nat -A PREROUTING -p tcp --dport 10000 -i ppp0 -j DNAT --to 192.168.0.2

for the host with ip 192.168.0.2, but how do I forward it for a range of hosts,
ie 192.168.0.2-192.168.0.254

I try

iptables -t nat -A PREROUTING -p tcp --dport 10000 -i ppp0 -j DNAT --to
192.168.0.2-192.168.0.254

but it does not work for any other hosts

iptables -L -v -t nat
gives the range, but does not actually forward the port in any apps
tcp dpt:10000 to:192.168.0.2-192.168.0.254

How do I forward the range of ports?
TIA,
David

==============================================
Running gentoo 2.16.18.4, iptables 1.3.5

