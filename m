From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: one to one NAT
Date: Fri, 27 Sep 2002 22:04:58 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020927210500.VYRD6699.mta01-svc.ntlworld.com@there>
References: <ADCE7AEB26CBD511B4D100508B66D3063BD421@fmsmsx115.fm.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ADCE7AEB26CBD511B4D100508B66D3063BD421@fmsmsx115.fm.intel.com>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Tuesday 24 September 2002 1:13 am, Brennan, JosephX M wrote:

> I have a dual homed box with interfaces: eth1(internal card):192.168.1.254
> and eth2(external card):10.10.10.254.  In addtion I have an external test
> box with an ip of 10.10.11.23.
> On the other side I have an internal test box with an ip of
> 192.168.1.24.
>
> My question however is i have tried this command
>
> iptables -t nat -A PREROUTING -d 10.10.10.254 -j DNAT --to 192.168.1.24
>
> and my internal box gets a request from the outside box however it does not
> look like there has been any "NAT"ing taken place because when I run a
> packet sniffer on the internal box the packets are still coming from the
> 10.10.10.23 address and obviously the internal box has no idea how to send
> the information back.

The NAT *has* taken place, otherwise it wouldn't have got to the destination 
machine.

However, you have set up a DNAT rule, so that's what netfilter has done - 
destination NAT.   It has not changed the source address because you have no 
SNAT rule.

Why does the internal box have no idea how to send the information back ?   
What is its default gateway ?

Antony.

-- 

KDE 3.0.3 contains an important fix for handling SSL certificates.  Users of 
Internet Explorer, which suffers from the same problem but which
does not yet have a fix available, are also encouraged to switch to KDE 3.0.3.

http://www.kde.org/announcements/announce-3.0.3.html

