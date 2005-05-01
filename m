From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: Port mapping ANY:95 to originalIP:80
Date: Sun, 1 May 2005 10:31:14 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49B88@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Efraim <efraimg@gmail.com>, netfilter@lists.netfilter.org

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 95 -j DNAT
--to-destination :80

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Efraim
Sent: Saturday, April 30, 2005 6:59 PM
To: netfilter@lists.netfilter.org
Subject: Port mapping ANY:95 to originalIP:80

Hi,
I'm using my linux box as a router and I have an application that is
make all the request in port 95.
I need to make an iptables rule that will change the original port of
any destination ip addres to 80.
I know how to do it for a specific destination ip but I could not find
the way to do it for any destination ip.

iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 95 -j DNAT --to
66.249.87.99:80

66.249.87.99 is the Google ip, but I need the rule to work for any ip.
Something like:

iptables -t nat -A PREROUTING -i eth0 -p tcp -d ANY --dport 95 -j DNAT
--to ANY:80

I know that it is possible to do with checkpoint firewall but it is a
little expensive...


