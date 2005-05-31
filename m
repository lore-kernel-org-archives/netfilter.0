From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Tue, 31 May 2005 09:17:00 -0500
Message-ID: <429C71DC.1050501@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42920AA7.6070909@riverviewtech.net>	<42940E9B.1070502@eccotours.dyndns.org>	<4294BF81.1020204@riverviewtech.net>	<4295B048.7050303@eccotours.dyndns.org>	<429BE413.3010701@riverviewtech.net>
	<429C3718.2030409@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429C3718.2030409@eccotours.dyndns.org>
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

> AHHH it work

Good.

> THANKS SOOOO much Grant

You are welcome.

> Really appreiate this

I'm glad that I could help.

> I did as you advised:
> 
> $IPT -N SSH_Brute_Force
> $IPT -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --name
> SSH --set --rsource -j SSH_Brute_Force
> $IPT -A SSH_Brute_Force -s 196.36.10.114 -j ACCEPT
> $IPT -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3
> --name SSH --rsource -j ACCEPT
> $IPT -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
> $IPT -A SSH_Brute_Force -p tcp -j DROP

I might suggest that you seriously think about TARPIT as a target to seriously SLOW DOWN the attacker.  If he / she is going through a list of IPs you could cause him / her to get hung up on your system (in such a way as to ensure your safety) and help secure others by delaying the attack on them.

> I can ssh in and look a this bugger
> 
> May 31 10:50:25 ns sshd[13099]: Failed password for root from
> 62.123.184.40 port 22646 ssh2
> May 31 10:50:26 ns kernel: SSH Brute Force Attempt:  IN=eth0 OUT=
> MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=62.123.184.40
> DST=217.199.186.118 LEN=60 TOS=0x00 PREC=0x00 TTL=49 ID=2712 DF
> PROTO=TCP SPT=22755 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0
> May 31 10:50:29 ns kernel: SSH Brute Force Attempt:  IN=eth0 OUT=
> MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=62.123.184.40
> DST=217.199.186.118 LEN=60 TOS=0x00 PREC=0x00 TTL=49 ID=2713 DF
> PROTO=TCP SPT=22755 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0
> May 31 10:50:35 ns kernel: SSH Brute Force Attempt:  IN=eth0 OUT=
> MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=62.123.184.40
> DST=217.199.186.118 LEN=60 TOS=0x00 PREC=0x00 TTL=49 ID=2714 DF
> PROTO=TCP SPT=22755 DPT=22 WINDOW=5840 RES=0x00 SYN URGP=0

Hmm, interesting.  Now all you need to do is verify that 62.123.184.40 is not a valid user and wait until you have 20 - 50 such log entries and then report him / her to the appropriate authorities.  This bot / script kiddie will quickly regret doing such things as she / he has been doing.

> Damn him for trying HEHEHEEH.
> 
> Thanks again Grant and all




Grant. . . .

