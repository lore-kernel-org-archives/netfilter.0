From: rusatlan@bofh.rus.uni-stuttgart.de (Pawel Mueller)
Subject: Re: logging -- a newbie question
Date: Fri, 7 May 2004 16:04:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040507140437.GB32666@bofh.rus.uni-stuttgart.de>
References: <20040507133419.GA32666@bofh.rus.uni-stuttgart.de> <200405071445.38711.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200405071445.38711.Antony@Soft-Solutions.co.uk>
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

Hi,

On Fri, May 07, 2004 at 02:45:38PM +0100, Antony Stone wrote:
> Netfilter LOGs what you tell it to; it doesn't log anything
> automatically.
>
> Simply add a rule with the LOG target for the packets you're
> interested in.

I didn't meant the LOG target. There must be a file where all
connections are listed. I know, because I saw it once. But it was a half
year ago, so I can't remember. I know I read it in a howto. It was one
that described, how you can debuge a firewall and it mentioned a file,
where you can see the hole ACK, SYN and ESTABLISHED or DROPED stuff for
each package (I think) that passes the firewall.

Idea?

thx
Pawel

PS: sorry, my english is terrible :-(

