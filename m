From: "Arthur DiSegna" <adisegna@authentium.com>
Subject: First rule in the list seems to allow everything?
Date: Wed, 25 Jan 2006 09:58:15 -0500
Message-ID: <B584AAC32ED8DE49A8EAD2CF3D847FE00222558B@auth-fl-mail1.commandsoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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

=20

Hello,

I set my IPTABLES policy to clear all rules and then drop everything
before defining a policy. I suspect this is the default procedure
everyone uses from the looks of the web. Anwyay, when I run iptables -L
-n the first line reads:

target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
RULES      --------			---	------
RULES      --------			---	------

Doing an nmap scan on the box only shows the open ports I specified in
the ruleset. This is good. However, the Accept all above in the first
line has me a little confused. What is happening here?

thanks

# Reset the default policy

echo Resetting default policy!
$IPT --policy INPUT ACCEPT
$IPT --policy OUTPUT ACCEPT
echo OK


echo Allowing all loopback traffic!
# Unlimited traffic on the loopback interface
$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT
echo OK

echo Setting default policy to Drop all incoming and allow all outgoing!
# Set the default policy to drop
$IPT --policy INPUT DROP
$IPT --policy OUTPUT ACCEPT
echo OK

ALLOW RULES START HERE!

