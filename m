From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: RST Packets ?
Date: Fri, 22 Oct 2004 12:23:46 +0100
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041022112346.GC21006@metastasis.org.uk>
References: <0b0501c4ac95$a40370d0$49caa8c0@caris.priv>
Reply-To: Netfilter Mailing List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <0b0501c4ac95$a40370d0$49caa8c0@caris.priv>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Oct 07, 2004 at 02:46:57PM -0300, Peter Marshall wrote:
> I keep getting loads of messages like below in my messages file.  Does
> anyone know why these are occurring ?
> 
> Oct  7 14:44:02 radium kernel: REJECT: int-web3 IN=eth0 OUT=eth1
> SRC=192.168.202.124 DST=205.174.164.21 LEN=40 TOS=0x00 PREC=0x00 TTL=127
> ID=3855 PROTO=TCP SPT=8010 DPT=45832 WINDOW=0 RES=0x00 RST URGP=0

Any chance of more information on where this firewall sits in relation
to the relevant networks, and what 192.168.202.124 and 205.174.164.21
are?

-- 
We are the Willing, led by the Unknowing,
Are doing the Impossible, for the Ungrateful.
We have done so much, for so long, with so little,
We are now qualified to do anything with nothing.

