From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Quick Routing question
Date: Wed, 5 Mar 2003 01:07:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030305010744.5828b6d3.arnt@c2i.net>
References: <016701c2e28a$239fbab0$1f0016ac@daviddesktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <016701c2e28a$239fbab0$1f0016ac@daviddesktop>
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

On Tue, 4 Mar 2003 15:10:43 -0500, 
"David Ruggles" <david@safedatausa.com> wrote in message 
<016701c2e28a$239fbab0$1f0016ac@daviddesktop>:

> I'm trying to learn netfilter so I've got a very simple setup.
> 
> I've got a Linux box with three interfaces. (I'm not using eth0
> currently) I've got two networks (eth2: 172.22.0.0 & eth1: 10.0.0.0)
> I entered the following on the Linux box:
> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 10.9.0.254 (eth1's
> IP address)
> 
> I've got a machine on each network: machine A is on 172.22.0.0 and
                                                      /\/\/\
[arnt@lana z-bru]$ dig -x 172.22.0.0

; <<>> DiG 9.2.1 <<>> -x 172.22.0.0
;; global options:  printcmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 57296
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 1, ADDITIONAL: 0

;; QUESTION SECTION:
;0.0.22.172.in-addr.arpa.       IN      PTR

;; AUTHORITY SECTION:
22.172.in-addr.arpa.    10800   IN      SOA     prisoner.iana.org.
hostmaster.root-servers.org. 2002040800 1800 900 604800 604800

;; Query time: 556 msec
;; SERVER: 192.168.1.1#53(192.168.1.1)
;; WHEN: Wed Mar  5 01:00:01 2003
;; MSG SIZE  rcvd: 118

[arnt@lana z-bru]$ dig prisoner.iana.org

; <<>> DiG 9.2.1 <<>> prisoner.iana.org
;; global options:  printcmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18283
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 7, ADDITIONAL: 3

;; QUESTION SECTION:
;prisoner.iana.org.             IN      A

;; ANSWER SECTION:
prisoner.iana.org.      3600    IN      A       192.175.48.1

;; AUTHORITY SECTION:
iana.org.               172800  IN      NS      a.iana-servers.net.
iana.org.               172800  IN      NS      ns.isi.edu.
iana.org.               172800  IN      NS      ns.ripe.net.
iana.org.               172800  IN      NS      ns.apnic.net.
iana.org.               172800  IN      NS      ns.icann.org.
iana.org.               172800  IN      NS      rip.psg.com.
iana.org.               172800  IN      NS      svc00.apnic.net.

;; ADDITIONAL SECTION:
a.iana-servers.net.     10847   IN      A       192.0.34.43
ns.isi.edu.             10847   IN      A       128.9.128.127
ns.icann.org.           10847   IN      A       192.0.34.126

;; Query time: 127 msec
;; SERVER: 192.168.1.1#53(192.168.1.1)
;; WHEN: Wed Mar  5 01:00:47 2003
;; MSG SIZE  rcvd: 268

[arnt@lana z-bru]$

..you run a _root_ name server and come here asking us amateur newbies
with less than 25 yrs internet experience for netfilter advice????? ;-)

> machine B is on 10.0.0.0
> I'm trying to ping from A to B.

..try move your A net to, say, 10.22.0.0, and your A net boxes
accordingly.

> I can ping all the interfaces on the router but I can't ping B
> 
> I would expect to see the POSTROUTING chain counter increment for each
> ping packet, but it doesn't. (It will increment if I ping from the
> Linux box to B)
> 
> Any suggestions?
> 
> Thanks,
> David Ruggles
> 
> CCNA MCSE (NT) CNA A+
> Network Engineer, Safe Data, Inc
> 910-285-7200    david@safedatausa.com
> 010001110110111101100100011011000110111101110110011001010111001101111
> 0010110 111101110101
> 
> 


-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



