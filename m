From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: SSH Brute force attacks
Date: Thu, 19 May 2005 11:05:13 +0200
Message-ID: <428C56C9.9000607@eccotours.dyndns.org>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42897A5E.7010401@wp.pl>	<42897EE5.90703@wp.pl>	<42898402.10507@eccotours.dyndns.org>	<4289E72F.7020901@wp.pl>
	<428B3798.9050407@eccotours.dyndns.org>
	<428C1C3F.9030600@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <428C1C3F.9030600@riverviewtech.net>
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
> 
> This *IS* based the number of NEW connections in a given time frame.  
> Note the "--seconds 60" parameter.  This is designed to see if there 
> have been less than x number of NEW connections in the 60 second 
> period.  If there have been less than x number of NEW connections in y 
> time (seconds) then RETURN back to the calling chain and do not continue 
> to parse this chain and ultimately TARPIT or DROP.
> 
> NOTE:  Take a look at 
> https://lists.netfilter.org/pipermail/netfilter/2005-May/060570.html as 
> this email has a newer (functioning) version of this script.
> 
> 
> 
> Grant. . . .
> 

HI all

Grant thanks for this.

I understand what you are saying, but what was hoping for. Was a 
solution whereby the src ip is not part of my whitelist.

For example, I have a dialup account (dynamic ip) at home. If I need to 
SSH into my linux box from home. I cant because the ip I have been 
allocted will not be in the whitelist.

Just something I was thinking.

Kind Regards
Brent Clark.

P.s. I am glad the ruleset does work (tried it from one of my foreign 
accounts) - THANKS FOR THIS. Really appreciate it.

May 19 09:46:46 ns kernel: [INPUT  DROP]: IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=196.36.161.230 
DST=217.199.186.118 LEN=60 TOS=0x10 PREC=0x00 TTL=49 ID=36165 DF 
PROTO=TCP SPT=52939 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0 OPT 
(020405B40402080A5C847EF80000000001030300)
May 19 09:46:49 ns kernel: [INPUT  DROP]: IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=196.36.161.230 
DST=217.199.186.118 LEN=60 TOS=0x10 PREC=0x00 TTL=49 ID=36166 DF 
PROTO=TCP SPT=52939 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0 OPT 
(020405B40402080A5C8480240000000001030300)
May 19 09:46:55 ns kernel: [INPUT  DROP]: IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=218.83.155.71 
DST=217.199.186.118 LEN=422 TOS=0x00 PREC=0x00 TTL=44 ID=0 DF PROTO=UDP 
SPT=59537 DPT=1027 LEN=402
May 19 09:46:55 ns kernel: [INPUT  DROP]: IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=196.36.161.230 
DST=217.199.186.118 LEN=60 TOS=0x10 PREC=0x00 TTL=49 ID=36167 DF 
PROTO=TCP SPT=52939 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0 OPT 
(020405B40402080A5C84827C0000000001030300)
May 19 09:47:07 ns kernel: [INPUT  DROP]: IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=196.36.161.230 
DST=217.199.186.118 LEN=60 TOS=0x10 PREC=0x00 TTL=49 ID=36168 DF 
PROTO=TCP SPT=52939 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0 OPT 
(020405B40402080A5C84872C0000000001030300)
May 19 09:47:31 ns kernel: SSH Brute Force Attempt:  IN=eth0 OUT= 
MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=196.36.161.230 
DST=217.199.186.118 LEN=60 TOS=0x10 PREC=0x00 TTL=49 ID=36169 DF 
PROTO=TCP SPT=52939 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0


