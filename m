From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: External IP addresses on internal network
Date: Wed, 27 Aug 2003 09:54:58 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308270944480.7868@simba.math.ucla.edu>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C1B5@wardrive.citadelcomputer.com.au>
 <3F4C0519.8000109@Loudoun-Fairfax.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F4C0519.8000109@Loudoun-Fairfax.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeffrey Laramie <jalaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

On Tue, 26 Aug 2003, Jeffrey Laramie wrote:
> George, here is the log entry I got:
>
> Aug 26 15:39:46 NS2 kernel: Filter_INPUT: IN=eth1 OUT=
> MAC=00:c0:f0:69:26:49:52:54:00:de:46:c7:08:00 SRC=172.144.233.136
> DST=192.168.0.24 LEN=73 TOS=0x10 PREC=0x00 TTL=128 ID=1755 PROTO=UDP
> SPT=137 DPT=53 LEN=53

It looks to me that 172.144.233.136 is a nameserver, and 192.168.0.24 asked
it for name resolution, and we're looking at its answer.  However, at
present, this machine is refusing connections to port 53, so it's possible
that there used to be a virus on it that tried to use port 53 for some evil
purpose.  Suggestion: do a virus scan on 192.168.0.24.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA  90095-1555
Email: jimc@math.ucla.edu    http://www.math.ucla.edu/~jimc (q.v. for PGP key)

