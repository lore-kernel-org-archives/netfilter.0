From: "Nigel Clarke" <nigel@forever-networks.com>
Subject: RE: connection problem
Date: Thu, 5 Dec 2002 06:56:11 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BDEFKJOAPEBPJCGDAGMFOEICCAAA.nigel@forever-networks.com>
References: <1039071356.345.134.camel@bigblue>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1039071356.345.134.camel@bigblue>
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
To: Paulo Andre <pandre@darkstar.nom.za>, netfilter <netfilter@lists.netfilter.org>

Paulo,

>I have a problem where a router reboots every evening. I do not have
>control of this router.

For this, you might want to see if the janitors unplug the router to use the
outlet in the evening.
Seriously.

As far as the issue with IPTABLES....this might be an issue with the ARP
cache on the firewall. What kind of
network card are you using? What kernel version?

I've had problem like this on some 2.2 kernel implementations with old
network cards. I'd have to "ifconfig eth* down/up"
for the interface to work.

;-)

--
Nigel Clarke                 Forever Networks
Network Security Engineer    www.forever-networks.com

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Paulo Andre
Sent: Wednesday, December 04, 2002 10:56 PM
To: netfilter
Subject: connection problem


I have a problem where a router reboots every evening. I do not have
control of this router.
The problem is with iptables, as soons as the router reboots I lose the
connection even when the router has come up afterwards.
I then have to take the interface down, reload the firewall script, then
reconfigure the interface and reapply the firewall script again so that
I can see the router again.

Can anyone tell me why this happens, the interface is a aliased
interface, if that makes a difference.

Thanks

Paulo





