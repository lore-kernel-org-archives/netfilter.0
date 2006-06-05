From: Brent Clark <bclark@eccotours.co.za>
Subject: Re: How stop DoS and SYN attack..
Date: Mon, 05 Jun 2006 16:59:30 +0200
Message-ID: <448446D2.9080602@eccotours.co.za>
References: <e32f231c0606031333s7ab57702y9a75cc62a3f96da0@mail.gmail.com>	<4482052D.8090409@vip.cybercity.dk>	<e32f231c0606042021t2a80a4det5ed2beeed11e19c5@mail.gmail.com>	<44841859.2060209@vip.cybercity.dk>
	<e32f231c0606050710xee283dei3b82dcbbbf76ad@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e32f231c0606050710xee283dei3b82dcbbbf76ad@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Alberto Ferrer wrote:
>> > Jun  5 00:19:39 lnx1 kernel: [4322117.587000] fp=bad_packets:1 a=DROP
>> > IN=eth0 OUT= MAC=00:08:54:2f:8a:ac:00:0b:46:e2:04:00:08:00
>> > SRC=201.254.155.13 DST=200.68.95.25 LEN=40 TOS=0x00 PREC=0x00 TTL=244
>> > ID=0 PROTO=TCP SPT=28837 DPT=80 WINDOW=0 RES=0x00 RST URGP=0

Hi

Unless im mistaken, but why are you dropping on the RST status.

Just something im wondering.

Kind Regards
Brent Clark

