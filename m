From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Defeating NMAP Null scans (and Nessus scans).
Date: Sat, 9 Jul 2005 12:30:59 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507091220130.17775@yvahk01.tjqt.qr>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAsvh50JgMeE+wdUqpg8SwJMKAAAAQAAAA0VU7kwJQ1kSCxnmqi2LTiQEAAAAA@ziemba.net>
	<Pine.LNX.4.61.0506221442160.25356@yvahk01.tjqt.qr> 
	<Pine.LNX.4.60.0506221245590.21678@darkstar.sysinfo.com> 
	<Pine.LNX.4.61.0506221845160.21055@yvahk01.tjqt.qr> 
	<Pine.LNX.4.60.0506221519210.21678@darkstar.sysinfo.com> 
	<Pine.LNX.4.61.0506231301530.26133@yvahk01.tjqt.qr>
	<5d2f37910507061254293f83de@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5d2f37910507061254293f83de@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "curby ." <curby.public@gmail.com>
Cc: netfilter@lists.netfilter.org


>There's a good chance that TARPIT and not REJECT is the thing slowing
>down scans.  You might want to check replacing TARPIT with
>DROP/REJECT; I think you'll see nonTARPIT scans take the same amount

Not at all:

shanghai:~ # iptables -I INPUT -p tcp -j TARPIT
shanghai:~ # nmap lo -p 1-512 -sF -v -v -r -T Insane

Starting nmap 3.81 ( http://www.insecure.org/nmap/ ) at 2005-07-09 12:24 CEST
Initiating FIN Scan against localhost (127.0.0.1) [512 ports] at 12:24
The FIN Scan took 7.30s to scan 512 total ports.
Host localhost (127.0.0.1) appears to be up ... good.
All 512 scanned ports on localhost (127.0.0.1) are: open|filtered

Nmap finished: 1 IP address (1 host up) scanned in 7.441 seconds
               Raw packets sent: 1026 (41KB) | Rcvd: 1026 (41KB)

shanghai:~ # iptables -D INPUT 1         # remove tarpit
shanghai:~ # !nmap
[...]
Nmap finished: 1 IP address (1 host up) scanned in 116.691 seconds
               Raw packets sent: 2411 (96.4KB) | Rcvd: 2900 (130KB)

>of time regardless of whether the firewall uses DROP or REJECT.  I
>didn't test this though.
>
>Here are some rules I've used when testing out ways to catch nmap
>scans.  If anyone knows what the SYN,RST SYN,RST match is for, please
>let me know.[...]

Mine, and it's basically just one (or two, depending on how you look at it) 
rules for all non-RFC-compliant scans/connections:

...
allow -m state --state ESTABLISHED,RELATED
...
HANDLE_PORTSCAN;
...
function HANDLE_PORTSCAN() {
    iptables -N scan_chk;
    # ACK,RST: rfc 793 page 65
==> iptables -A scan_chk -j RETURN -p tcp --tcp-flags ALL ACK,RST;
    iptables -A scan_chk -j REJECT --reject-with host-unreach -m random \
      --average 10;
    iptables -A scan_chk -j DROP;
==> iptables -A INPUT -j scan_chk -p tcp ! --syn -m state --state INVALID;
}



Jan Engelhardt                                                               
--                                                                            
| Alphagate Systems, http://alphagate.hopto.org/


