From: Kevin McConnell <kevymac@yahoo.com>
Subject: Re: H323 patch with VPN
Date: Tue, 13 May 2003 07:57:25 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030513145725.90106.qmail@web40306.mail.yahoo.com>
References: <001f01c31892$8ec25c60$95dc6f89@wonderland>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001f01c31892$8ec25c60$95dc6f89@wonderland>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org
Cc: Calvin <calvinproject@ihug.com.au>


--- Calvin <calvinproject@ihug.com.au> wrote:
> Hi all,

Hi Calvin

> I just want to ask if I use VPN to protect all the
> traffics, will the H323 patch for netfilter still
> able to work?

It should work.

> It seems to me that all the traffic going out and
> coming in through the firewall are encrypted, so how
> to make it works?

The vpn software on both ends should be able to
decrypt the packets.



=====
Kevin C. McConnell --RHCE-- <Red Hat Certified Engineer>

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

