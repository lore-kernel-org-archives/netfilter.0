From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Selecting interface
Date: Mon, 29 Sep 2003 08:47:48 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C379@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: "Dragos C." <Dragos_Cinteza@web.de>, netfilter@lists.netfilter.org


I'm a little confused by your question (probably too early in the =
morning for me... need 3 cups of coffee.. not 2 ;)  )

Routing takes care of the ethernet devices when packets flow through. If =
you don't specify the ethernet device, it'll then apply to ALL devices.

So if a packet was received from the internet on a w.x.y.z IP on the =
external device and you had the below command :

        /sbin/iptables -t mangle -A INPUT -s 192.168.1.1 -j MARK =
--set-mark 1

The external packet would traverse this rule and should someone spoof =
the source IP address as 192.168.1.1 then the rule would activate..

Always specify the ethernet device where possible.

Hope this was of some help...otherwise rephrase your question please =
while I wake up.. ;P

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au



-----Original Message-----
From: Dragos Cinteza [mailto:Dragos_Cinteza@web.de]
Sent: Sunday, 28 September 2003 11:27 AM
To: netfilter@lists.netfilter.org
Subject: Selecting interface


        HI

          I have a box with 2 interfaces that is routing pakets from
        mi  LAN  to the internet. I mark packets that enter on the lan
        interface,  marks coresponding to the IPs on LAN. Here are the
        rules:

        /sbin/iptables -t mangle -A INPUT --in-interface eth0 -s =
192.168.1.1 -j MARK --set-mark 1
        /sbin/iptables -t mangle -A INPUT --in-interface eth0 -s =
192.168.1.2 -j MARK --set-mark 2
        /sbin/iptables -t mangle -A INPUT --in-interface eth0 -s =
192.168.1.3 -j MARK --set-mark 3
        /sbin/iptables -t mangle -A INPUT --in-interface eth0 -s =
192.168.1.4 -j MARK --set-mark 4
        /sbin/iptables -t mangle -A INPUT --in-interface eth0 -s =
192.168.1.5 -j MARK --set-mark 5
        /sbin/iptables -t mangle -A INPUT --in-interface eth0 -s =
192.168.1.6 -j MARK --set-mark 6
        /sbin/iptables -t mangle -A INPUT --in-interface eth0 -s =
192.168.1.7 -j MARK --set-mark 7
        /sbin/iptables -t mangle -A OUTPUT --out-interface eth0 -d =
192.168.1.1 -j MARK --set-mark 1
        /sbin/iptables -t mangle -A OUTPUT --out-interface eth0 -d =
192.168.1.2 -j MARK --set-mark 2
        /sbin/iptables -t mangle -A OUTPUT --out-interface eth0 -d =
192.168.1.3 -j MARK --set-mark 3
        /sbin/iptables -t mangle -A OUTPUT --out-interface eth0 -d =
192.168.1.4 -j MARK --set-mark 4
        /sbin/iptables -t mangle -A OUTPUT --out-interface eth0 -d =
192.168.1.5 -j MARK --set-mark 5
        /sbin/iptables -t mangle -A OUTPUT --out-interface eth0 -d =
192.168.1.6 -j MARK --set-mark 6
        /sbin/iptables -t mangle -A OUTPUT --out-interface eth0 -d =
192.168.1.7 -j MARK --set-mark 7

        /sbin/iptables -t mangle -A PREROUTING --in-interface eth0 -s =
192.168.1.1 -j MARK --set-mark 1
        /sbin/iptables -t mangle -A PREROUTING --in-interface eth0 -s =
192.168.1.2 -j MARK --set-mark 2
        /sbin/iptables -t mangle -A PREROUTING --in-interface eth0 -s =
192.168.1.3 -j MARK --set-mark 3
        /sbin/iptables -t mangle -A PREROUTING --in-interface eth0 -s =
192.168.1.4 -j MARK --set-mark 4
        /sbin/iptables -t mangle -A PREROUTING --in-interface eth0 -s =
192.168.1.5 -j MARK --set-mark 5
        /sbin/iptables -t mangle -A PREROUTING --in-interface eth0 -s =
192.168.1.6 -j MARK --set-mark 6
        /sbin/iptables -t mangle -A PREROUTING --in-interface eth0 -s =
192.168.1.7 -j MARK --set-mark 7
        /sbin/iptables -t mangle -A POSTROUTING --out-interface eth0 -d =
192.168.1.1 -j MARK --set-mark 1
        /sbin/iptables -t mangle -A POSTROUTING --out-interface eth0 -d =
192.168.1.2 -j MARK --set-mark 2
        /sbin/iptables -t mangle -A POSTROUTING --out-interface eth0 -d =
192.168.1.3 -j MARK --set-mark 3
        /sbin/iptables -t mangle -A POSTROUTING --out-interface eth0 -d =
192.168.1.4 -j MARK --set-mark 4
        /sbin/iptables -t mangle -A POSTROUTING --out-interface eth0 -d =
192.168.1.5 -j MARK --set-mark 5
        /sbin/iptables -t mangle -A POSTROUTING --out-interface eth0 -d =
192.168.1.6 -j MARK --set-mark 6
        /sbin/iptables -t mangle -A POSTROUTING --out-interface eth0 -d =
192.168.1.7 -j MARK --set-mark 7

            I  am  wondering what interface and what packets (incoming
        or  outgoing to that interface) are assumed if I don't specify
        in   the   rules  "--out-interface  eth0"  (eth0  is  the  lan
        interface).

            I  use  the  INPUT  and  OUTPUT  too  because I have squid
            passing the pakets from port 80.
       =20

       =20


  TheBat! 2.00.6 natural e-mail system(tm)
 adresa de e-mail: Dragos_Cinteza@web.de





