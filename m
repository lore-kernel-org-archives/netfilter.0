From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Ping flood
Date: Tue, 1 Nov 2005 11:19:31 -0600
Message-ID: <200511011119.31267.rob0@gmx.co.uk>
References: <43677BFD.3080805@darkstar.nom.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43677BFD.3080805@darkstar.nom.za>
Content-Disposition: inline
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

On Tuesday 2005-November-01 08:30, Paulo Andre wrote:
> I have the following log:
> Nov  1 09:10:40 guardian ---SA_IN--- IN=eth1 OUT=
> MAC=ff:ff:ff:ff:ff:ff:00:e0:1e:83:d5:19:08:00  SRC=64.34.170.237

Who is this?

$ host 64.34.170.237
237.170.34.64.in-addr.arpa domain name pointer server1.ircnapoli.com.
$ whois $_
Peer 1 Network Inc. PEER1-BLK-08 (NET-64-34-0-0-1)
                                  64.34.0.0 - 64.34.255.255
ServerBeach PEER1-SERVERBEACH-02 (NET-64-34-160-0-1)
                                  64.34.160.0 - 64.34.191.255
...
$ host server1.ircnapoli.com.
server1.ircnapoli.com has address 64.34.170.237

> DST=255.255.255.255 LEN=1072 TOS=00 PREC=0x40 TTL=243 ID=12209 DF
> PROTO=ICMP TYPE=8 CODE=0 ID=0 SEQ=0

That's a broadcast ping.

> I am receiving thousands of these a day, icmp traffic is blocked with
> iptables. But still this traffic is coming up the line. Is my only

How much is a flood? Is it eating all your bandwidth?

> solution to contact the ISP or is there something I can do in
> iptables/linux?

Contact the person in charge of server1.ircnapoli.com. If you're really 
under a DoS attack, by all means, call the ISP.

If it's just an annoying log message, adjust your LOG rules so that 
these are not logged. You don't need netfilter logging to know when 
you're under DoS attack. Your network connection won't work.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

