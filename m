From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Wed, 25 May 2005 13:10:09 -0500
Message-ID: <4294BF81.1020204@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<4285C016.2060900@wp.pl>	<42864CA9.7050802@riverviewtech.net>	<428856F8.60706@wp.pl>	<Pine.LNX.4.61.0505162103070.3744@e-smith.charlieb.ott.istop.com>	<42920AA7.6070909@riverviewtech.net>
	<42940E9B.1070502@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42940E9B.1070502@eccotours.dyndns.org>
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

Brent Clark wrote:
> For some funny reason I still cant seem to get this right.
> I tried connecting from home (dynamic assigned ip) and I still cant
> connect.

Hmm, there must be something else going on.

> May 25 06:21:51 ns kernel: [INPUT  DROP]: IN=eth0 OUT=
> MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=165.146.144.131
> DST=217.199.186.118 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=40576 DF
> PROTO=TCP SPT=30066 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0 OPT
> (0204055001010402)
> May 25 06:21:54 ns kernel: [INPUT  DROP]: IN=eth0 OUT=
> MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=165.146.144.131
> DST=217.199.186.118 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=40578 DF
> PROTO=TCP SPT=30066 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0 OPT
> (0204055001010402)
> May 25 06:22:00 ns kernel: SSH Brute Force Attempt:  IN=eth0 OUT=
> MAC=00:0c:76:5e:d3:61:00:d0:02:eb:84:0a:08:00 SRC=165.146.144.131
> DST=217.199.186.118 LEN=48 TOS=0x00 PREC=0x00 TTL=115 ID=40585 DF
> PROTO=TCP SPT=30066 DPT=22 WINDOW=65535 RES=0x00 SYN URGP=0

Based on the fact that you are getting a log entry with the "SSH Brute Force Attempt:  " in the log line I think that your SSH packets are some how having more than 3 hits by the time the packets make it to the "iptables -A SSH_Brute_Force -m recent ! --rcheck --seconds 60 --hitcount 3 --name SSH --rsource -j RETURN" rule.  This makes me think that there are other rules in your filter chains that are setting packets and thus making them continue through the afore mentioned rule and not be returned thus being DROPed.  Try doing an iptables-save and looking at the output to see if it agrees with what you are expecting based on your iptables script, I'm betting that there is something going on in the SSH_Brute_Force chain from previous test that have slipped your mind.  If you still want / need help please include the results of an iptables-save in your reply.



Grant. . . .

