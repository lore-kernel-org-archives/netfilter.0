From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: i386 or i686.. which one?
Date: Mon, 9 Sep 2002 19:37:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209091837.g89IbPv05983@vulcan.rissington.net>
References: <A758C299015FD411887B0000E2131186C213E6@TRUVA>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A758C299015FD411887B0000E2131186C213E6@TRUVA>
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
To: netfilter@lists.netfilter.org

On Monday 09 September 2002 4:02 pm, ?hsan  Turkmen wrote:

> Hi..
> This is not the right place of asking that question, but i hope nobody
> minds my asking:
> ----"How to understand if my kernel source is RedHat  i386 or i686. Is
> there a shoert way of undersatnding it...?"

The kernel source is not specific to a processor (it's not even specific to 
Intel x86 processors - it covers PPC, Alpha, MIPS..... as well).

The thing which is specific to the processor family is in 
/usr/src/linux/.config - look for the lines starting with CONFIG_M386 and 
going through to CONFIG_MCYRIXIII.

The one which says =y at the end is the one your kernel will compile for.

Antony.

-- 

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play 
with them

