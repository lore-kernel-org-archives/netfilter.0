From: "Alberto Ferrer" <albertoferrer@gmail.com>
Subject: Re: How stop DoS and SYN attack..
Date: Tue, 6 Jun 2006 10:22:42 -0300
Message-ID: <e32f231c0606060622l77351e62sdb094cb6db4ebe11@mail.gmail.com>
References: <e32f231c0606031333s7ab57702y9a75cc62a3f96da0@mail.gmail.com>
	<4482052D.8090409@vip.cybercity.dk>
	<e32f231c0606042021t2a80a4det5ed2beeed11e19c5@mail.gmail.com>
	<44841859.2060209@vip.cybercity.dk>
	<e32f231c0606050710xee283dei3b82dcbbbf76ad@mail.gmail.com>
	<448446D2.9080602@eccotours.co.za>
	<e32f231c0606060608o6ce1619p3de97cbf2030d0f5@mail.gmail.com>
	<448580CF.6010101@eccotours.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <448580CF.6010101@eccotours.biz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brent Clark <bclark@eccotours.biz>
Cc: netfilter@lists.netfilter.org

Here is my firewall script.

http://bet0x.pastebin.com/758923

thanks for answer :D

2006/6/6, Brent Clark <bclark@eccotours.biz>:
> Alberto Ferrer wrote:
> > 2006/6/5, Brent Clark <bclark@eccotours.co.za>:
> >> Alberto Ferrer wrote:
> >> >> > Jun  5 00:19:39 lnx1 kernel: [4322117.587000] fp=bad_packets:1
> >> a=DROP
> >> >> > IN=eth0 OUT= MAC=00:08:54:2f:8a:ac:00:0b:46:e2:04:00:08:00
> >> >> > SRC=201.254.155.13 DST=200.68.95.25 LEN=40 TOS=0x00 PREC=0x00
> >> TTL=244
> >> >> > ID=0 PROTO=TCP SPT=28837 DPT=80 WINDOW=0 RES=0x00 RST URGP=0
> >>
> >> Hi
> >>
> >> Unless im mistaken, but why are you dropping on the RST status.
> >>
> >> Just something im wondering.
> >>
> >
> > whats that, what means, my english its a little bad .
> >> Kind Regards
> >> Brent Clark
>
> Hi
>
> Im not really qualified to assist (continue asking the guys from Netfilter Mailing List).
>
> The reason for my email is because it looks like you DROPPING on the RST (Look at the end of the string "RES=0x00 RST URGP=0") flag (out of interest do you know TCP/IP and its flags etc).
>
> Its maybe advisable to post your rulset and maybe someone will proof read it for you.
>
> HTH and best of luck.
>
> Kind Regards
> Brent Clark
>
>


-- 
bet0x

