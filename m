From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: insecure script
Date: Tue, 23 Mar 2004 13:40:03 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679246@alderaan.smgtec.com>
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
To: Jorge Garcia <anarkophobia@latinmail.com>, netfilter@lists.netfilter.org


---
As anthony put it, don't use the following for FTP:
# BAD
iptables -A FORWARD -i ${IF_INTERNET} --destination ${FTP_SERVER} -p tcp
--dport 1024:65535 -j ACCEPT
iptables -A FORWARD --source ${FTP_SERVER} --source ${FTP_SERVER} -p tcp
--dport 1024:65535 -j ACCEPT

Instead, implement it with:
# Good
modprobe ip_conntrack_ftp
modprobe ip_nat_ftp
---

---
Always limit number of logging messages.

# BAD
iptables -A INPUT -p tcp --dport <good_proto> -j ACCEPT
iptables -A INPUT -j LOG
iptables -A INPUT -j DROP

# GOOD
iptables -A INPUT -p tcp --dport <good_proto> -j ACCEPT
iptables -A INPUT -m limit --limit 4/s -j LOG
iptables -A INPUT -j DROP

Note: the 4/sec is best for my configuration. The better the machine,
you may want to log more or less depending on your system's specs and
your eagerness to go through the crud.
---

---
Setting up "junk" filtering in mangle is advisible just in case an
extension later on gets confiused. Plus, it saves the processing time
that it takes to jump through the network systems.

Here is a snapshot of what I do first thing:

   # Drop stealth scanners
   ${IPTABLES} -t mangle -A PREROUTING -p tcp --tcp-flags ALL     NONE
-j DROP
   ${IPTABLES} -t mangle -A PREROUTING -p tcp --tcp-flags SYN,FIN
SYN,FIN -j DROP
   ${IPTABLES} -t mangle -A PREROUTING -p tcp --tcp-flags SYN,RST
SYN,RST -j DROP
   ${IPTABLES} -t mangle -A PREROUTING -p tcp --tcp-flags FIN,RST
FIN,RST -j DROP
   ${IPTABLES} -t mangle -A PREROUTING -p tcp --tcp-flags ACK,FIN FIN
-j DROP
   ${IPTABLES} -t mangle -A PREROUTING -p tcp --tcp-flags ACK,URG URG
-j DROP
   ${IPTABLES} -t mangle -A PREROUTING -p tcp --tcp-flags ACK,PSH PSH
-j DROP

   # Drop bulk portscan attackers
   ${IPTABLES} -t mangle -A PREROUTING -i ${IF_INET3} -m psd -m limit
\
      --limit 2/s -j LOG --log-prefix=3D"ipt.portscan "
   ${IPTABLES} -t mangle -A PREROUTING -i ${IF_INET3} -m psd -j DROP
   ${IPTABLES} -t mangle -A PREROUTING -i ${IF_INET4} -m psd -m limit
\
      --limit 2/s -j LOG --log-prefix=3D"ipt.portscan "
   ${IPTABLES} -t mangle -A PREROUTING -i ${IF_INET4} -m psd -j DROP

This is appropriate for me, but maybe not for you. If you use
Patch-O-Matic (which I would always recommend to users comfortable
building kernels) you may want to suplement the DROP rule on portscans
with TARPIT. Basically it holds a TCP session open forever, which
usually causes serious havoc with scanners.
---

---
Firewall DOSing

I read about this one a while ago. If you're a hacker and you detect
portscan blocking, you can pull a nasty trick on the firewall's owner.

Once they detect the firewall blocks portscans, they find the upstream
gateway of the host. This is done using traceroute. Then, they start
sending forged portscan requests with the gateway's ip address as the
src. If the firewall isn't careful and the gateway doesn't drop the
forged packets, then BOOM. No more internet for you.
---

---
String matching to block KAZAA

Don't expect this to work 100% of the time. If the requesting packet
gets fragmented inside the string being searched for, the match will
fail. This can be exploited by abusers if they set their MTU's low
enough to force the fragmentation along those lines.
---

---
Firewalls are perfect, NOT

Never forget that the firewall is a point of attack. If you plan it
right, there should be one port open on the INPUT chain, SSH. On odd
occasions, hackers are able to find hacks against the protocol stack
itself, in which case, you better upgrade your kernel ASAP. Same goes
for SSH/SSL. This is not a product that you should be leaving alone for
years. It can last that long if you wanted it to though.=20
---

---
Accidental forwards during firewall ruleset refreshes.

You want to make sure you disable forwarding whenever you do a firewall
ruleset load, then enable it wence its complete

echo "0" > /proc/sys/net/ipv4/ip_forward
${MY_RULES}
echo "1" > /proc/sys/net/ipv4/ip_forward

This keeps rogue packets from being marked ESTABLISHED even when they're
clearly NOT allowed. This rare occasion could become a lot more
dangerous if a hacker found a way to force the script to re-execute, or
detect when a ruleset reload occurs.
---

Ah.. that's it for me. Back to real work..

