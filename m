From: "Sebastian" <netfilter@basti79.de>
Subject: RE: Snuffing out hackers
Date: Wed, 16 Jul 2003 23:14:34 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c34bdf$415d9c70$0200a8c0@basti79>
References: <7C9884991ADAE0479C14F10C858BCDF5122DF7@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122DF7@alderaan.smgtec.com>
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
To: 'Daniel Chemko' <dchemko@smgtec.com>, Netfilter Mailinglist <netfilter@lists.netfilter.org>

Hi there...

Just a thought:
If you are getting many of those packtes, than it should be possible to
catch one of it with tcpdump to find out senders MAC address. This will
pearhaps allow to find you the source, if it's realy located on your
internal network.

Greets
Sebastian.


-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Daniel Chemko
Sent: Wednesday, July 16, 2003 10:22 PM
To: Aldo S. Lagana; netfilter@lists.netfilter.org
Subject: RE: Snuffing out hackers


I am on Shaw, but none of these addresses are used for anything to do
with my network.

I am doing some pretty anal filtering, but then again, I may be missing
something pretty obvious. I have rp_filter at 2 and source routing
disabled.

PS: I am getting MANY of these packets. These packets are not getting
through to their targets, but if someone is persistent enough to keep
trying, I assume they must be able to do something malicious.

-----Original Message-----
From: Aldo S. Lagana [mailto:alagana@discmail.com] 
Sent: Wednesday, July 16, 2003 12:32 PM
To: Daniel Chemko; netfilter@lists.netfilter.org
Subject: RE: Snuffing out hackers

Both IP addresses are assigned to cable ISPs.

Name:    h24-87-243-251.vc.shawcable.net
Address:  24.87.243.251

Name:    d57-108-11.home.cgocable.net
Address:  24.57.108.11

Not sure if either of them are your ISP?  But I would contact both ISPs
with your log data if you really cared.  Are you running squid?  A
webserver?




From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Daniel Chemko
Sent: Wednesday, July 16, 2003 2:58 PM
To: netfilter@lists.netfilter.org

I am getting some disturbing packet traffic hitting my firewall. Here
goes:

IN=eth4 OUT=eth5 SRC=24.87.243.251 DST=24.57.108.11 LEN=76 TOS=0x00
PREC=0xC0 TTL=25
4 ID=17431 PROTO=ICMP TYPE=3 CODE=3 [SRC=24.57.108.11 DST=24.87.243.251
LEN=48 TOS=0x00 PREC=0x00 TTL=117 ID=15860 DF PROTO=TCP SPT=
3161 DPT=80 WINDOW=16384 RES=0x00 SYN URGP=0 ]

None of the addresses listed in the packets are from my networks, but
what is more disturbing is that eth4 is my internal network interface.
Can anyone see (baring an internal intrusion has occurred) how this can
happen?

It definitely appears to be an exploit on my configuration or something.


