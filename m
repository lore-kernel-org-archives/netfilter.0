From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ip_conntrack_ftp and ip_nat_ftp modules unused
Date: Sat, 7 Sep 2002 09:46:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020907084657.SXCJ5047.mta06-svc.ntlworld.com@there>
References: <1031358907.3d7949bb350b0@webmail3.webfluxation.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1031358907.3d7949bb350b0@webmail3.webfluxation.com>
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

On Saturday 07 September 2002 1:35 am, Marcel Hauser wrote:

> Hi
>
> I'am just wondering:
>
> #lsmod
>
> Module                  Size  Used by
> ip_nat_irc              2752   0  (autoclean) (unused)
> ip_conntrack_irc        2928   0  (autoclean) (unused)
> ip_nat_ftp              3296   0  (autoclean) (unused)
> ip_conntrack_ftp        3632   0  (autoclean) (unused)
>
> is it normal that ip_conntrack_ftp and ip_nat_ftp are unused ??

Yes.

It means that no other modules depend on them.
It doesn't mean they're not being useful.

Antony.

-- 

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play 
with them

