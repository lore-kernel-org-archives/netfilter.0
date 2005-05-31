From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: SSH Brute force attacks
Date: Tue, 31 May 2005 12:06:16 +0200
Message-ID: <429C3718.2030409@eccotours.dyndns.org>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42920AA7.6070909@riverviewtech.net>	<42940E9B.1070502@eccotours.dyndns.org>	<4294BF81.1020204@riverviewtech.net>	<4295B048.7050303@eccotours.dyndns.org>
	<429BE413.3010701@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429BE413.3010701@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

Taylor, Grant wrote:

> The first two LOG & DROPs are from the default LOG and DROP of your 
> INPUT chain.  For the packet to make it to this point in your input 
> chain the packet had to traverse the SSH_Brute_Force chain where the 
> source address was set in the SSH recent list.  Seeing as how the source 
> address has not been seen 3 times via the recent match extension and 
> thus qualify for a RETURN to the input chain it is thus LOGed and DROPed 
> by the default LOG and DROP targets of your input chain.  Upon the third 
> packet coming in to your firewall the packet will traverse the 
> SSH_Brute_Force chain and no match the (inverse) "--hitcount 3" recent 
> check and thus not get RETURNED to the input chain and subsequently get 
> LOGed and DROPed by the SSH_Brute_Force chain.  This explains the three 
> log entries with the staggered times and the different log prefix based 
> on where they are getting dropped.  As such I think the solution to your 
> particular situation is to use a target of ACCEPT, not RETURN on your 
> 2nd SSH_Brute_Force rule that matches the "--hitcount 3".
> 
> Give that a try and let me know if that works for you please.
> Grant. . . .
> 

AHHH it work

THANKS SOOOO much Grant

Really appreiate this

I did as you advised:

$IPT -N SSH_Brute_Force
$IPT -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name 
SSH --set --rsource -j SSH_Brute_Force
$IPT -A SSH_Brute_Force -s 196.36.10.114 -j ACCEPT
$IPT -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 
--name SSH --rsource -j ACCEPT
$IPT -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
$IPT -A SSH_Brute_Force -p tcp -j DROP

I can ssh in and look a this bugger

May 31 10:50:25 ns sshd[13099]: Failed password for root from 
62.123.184.40 port 22646 ssh2
May 31 10:50:26 ns kernel: SSH Brute Force Attempt:  IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=62.123.184.40 
DST=217.199.186.118 LEN=60 TOS=0x00 PREC=0x00 TTL=49 ID=2712 DF 
PROTO=TCP SPT=22755 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0
May 31 10:50:29 ns kernel: SSH Brute Force Attempt:  IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=62.123.184.40 
DST=217.199.186.118 LEN=60 TOS=0x00 PREC=0x00 TTL=49 ID=2713 DF 
PROTO=TCP SPT=22755 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0
May 31 10:50:35 ns kernel: SSH Brute Force Attempt:  IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=62.123.184.40 
DST=217.199.186.118 LEN=60 TOS=0x00 PREC=0x00 TTL=49 ID=2714 DF 
PROTO=TCP SPT=22755 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0

Damn him for trying HEHEHEEH.

Thanks again Grant and all

Kind Regards
Brent Clark

