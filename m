From: "Simon Garner" <sgarner@expio.co.nz>
Subject: Re: execute iptables via web browsers?
Date: Fri, 24 Oct 2003 21:43:23 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c39a0b$32aa86a0$0301a8c0@SIMON>
References: <200310240725.h9O7PuE23633@smtp.postech.ac.kr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: "Jin Gu, Kim" <lilia21@postech.ac.kr>, netfilter@lists.netfilter.org

On Friday, October 24, 2003 8:25 PM NZT,
Jin Gu, Kim <lilia21@postech.ac.kr> wrote:

> Hi all.
>
> I made this file to view "nat" rules, but nothing was there. How can
> I see the results via web?
>

You need to be root to view the tables, so that won't work. Though you
should get an error to that effect...

-Simon


