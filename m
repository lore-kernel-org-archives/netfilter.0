From: Mike <1100100@gmail.com>
Subject: Port 21, 23, and 80 are open according to Shields Up at grc.com
Date: Sat, 11 Sep 2004 19:09:11 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <8ca42282040911160952abec3b@mail.gmail.com>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
Reply-To: Mike <1100100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409111150.50506.bulliver@badcomputer.no-ip.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Group:

I've tested for open ports from all the LAN clients behind my linux
box router/gateway/firewall and all of them come up with the same
results: port 21, 23, and 80 are open according to the results of the
Steve Gibson Shields Up test.

I can't figure out how this can be happening.
I've run a full nmap -P0 (that's a zero) on all my local ip addresses
- 192.168.169.*

You'll see below that the only ports open according to nmap on all the
clients is Port 139.  This is appropriate as the box on 192.168.169.2
is running a Samba server that all the clients connect to.

The box on 192.168.169.2 has Port 80 open because I run Apache as an
intranet webserver.  It cannot be accessed from outside the firewall. 
Port 631 is open because that's the port that receives print jobs via
the CUPS printserver.  The LAN clients send print jobs to the
printserver via port 631.  Lastly, I had the X window system up and
running when I ran nmap so you can see a port open for that.

But none of the clients, nor the gateway address on the routerbox
(192.168.169.1) show port 21, 23, and 80 as open.

So, I'm left with some questions:

A) Is the Gibson test accurate or am I misunderstanding the results?
B) Do I need to do another kind of diagnostic test using nmap?

Thank you for reading the long post.
I appreciate the time and help.

Mike

                                                                      
                                                                      
                                                                      
                                          Starting nmap 3.55 (
http://www.insecure.org/nmap/ ) at 2004-09-09 10:21 EDT
All 1660 scanned ports on 192.168.169.0 are: filtered

All 1660 scanned ports on 192.168.169.1 are: filtered

Interesting ports on primary.us (192.168.169.2):
(The 1655 ports scanned but not shown below are in state: closed)
PORT     STATE SERVICE
80/tcp   open  http
139/tcp  open  netbios-ssn
631/tcp  open  ipp
6000/tcp open  X11

Interesting ports on 192.168.169.3:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXXX (Intel)

Interesting ports on 192.168.169.4:
(The 1658 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
135/tcp open  msrpc
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXX (3com)

Interesting ports on 192.168.169.5:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXXXXX (Netgear)

Interesting ports on 192.168.169.6:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXX (The Linksys Group)

Interesting ports on 192.168.169.7:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXXX (3com)

All 1660 scanned ports on 192.168.169.8 are: filtered

Interesting ports on 192.168.169.9:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXXX (Hsing TECH. Enterprise CO.)

Interesting ports on 192.168.169.10:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXXXXX (Hsing TECH. Enterprise CO.)

All 1660 scanned ports on 192.168.169.11 are: filtered

All 1660 scanned ports on 192.168.169.12 are: filtered

Interesting ports on 192.168.169.13:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXX (Micro-star International CO.)

Interesting ports on 192.168.169.14:
(The 1658 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
135/tcp open  msrpc
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXXXXXX (The Linksys Group)

Interesting ports on 192.168.169.15:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXX (Intel - Hf1-06)

Interesting ports on 192.168.169.16:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXXXX (Micro-star International CO.)

Interesting ports on 192.168.169.17:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXXXX (Micro-star International CO.)

Interesting ports on 192.168.169.18:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXXXXXXX (Micro-star International CO.)

Interesting ports on 192.168.169.19:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXX (Micro-star International CO.)

Interesting ports on 192.168.169.20:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXXXXX (Micro-star International CO.)

All 1660 scanned ports on 192.168.169.21 are: filtered

Interesting ports on 192.168.169.22:
(The 1659 ports scanned but not shown below are in state: closed)
PORT    STATE SERVICE
139/tcp open  netbios-ssn
MAC Address: XXXXXXXXXXXX (Micro-star International CO.)

All 1660 scanned ports on 192.168.169.23 are: filtered

All 1660 scanned ports on 192.168.169.24 are: filtered

-----------<<<snip>>>-------------------------

