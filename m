From: David Cary Hart <DCH@TQMcube.com>
Subject: Re: "CE" - Where's the  snot?
Date: Sat, 24 Jul 2004 16:22:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090700564.10960.2.camel@dchws.tqmcube.com>
References: <1090682116.3343.7.camel@dchws.tqmcube.com>
	 <200407241644.01366.Antony@Soft-Solutions.co.uk>
Reply-To: NetFilter List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407241644.01366.Antony@Soft-Solutions.co.uk>
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
To: NetFilter List <netfilter@lists.netfilter.org>

On Sat, 2004-07-24 at 11:44, Antony Stone wrote:

> Excuse me, but *what* are you seeing?
> 
> I can see the subject of this posting, but it means nothing to me.
> 
> Please explain the problem so we can understand what it is.
> 
Jul 24 16:21:01 mail kernel: - Firewall:  IN=eth0 OUT=
MAC=00:4f:4e:12:f9:93:00:09:5b:c9:37:54:08:00  SRC=68.236.163.19 D
ST=192.168.0.31 LEN=41 TOS=00 PREC=0x00 TTL=126 ID=59477 CE DF PROTO=TCP
SPT=4694 DPT=135 SEQ=4252944646 ACK=3536024229 WIND
OW=64320 ACK URGP=0

Note the "CE" just in front of "DF" = Congestion Experienced

> Regards,
> 
> Antony.


