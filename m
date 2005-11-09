From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: kernel freeze issue
Date: Wed, 9 Nov 2005 08:21:09 -0600
Message-ID: <200511090821.09368.rob0@gmx.co.uk>
References: <43692579.8000807@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43692579.8000807@elte.hu>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

General comment on the format: it would help if you would put the text 
and list portions in standard (>80 columns) format. ASCII drawings are 
harder to fit sometimes, but even those will come across better under 
80 columns. I use a GUI MUA so I was able to resize to view your post 
properly, but remember, much of your audience might be using mutt.

On Wednesday 2005-November-02 14:45, Zoltan Nagy wrote:
> problem:
> 	filter is freezes in random intervalls(30m - 6day) - on-board
> watchdog(i8xx) reboot's the system i've tryed many things, remove my
> custom patches...but it won't help ;) in the kernel trace i've last

I would suspect hardware first.

> crash happens when many of our beloved users use p2p software(this
> is also a tip)
snip
> today's surprise:
> 	ip l s eth0 promisc on	==> freeze, without any trace ;)

Did you try swapping out that NIC?

> some info about the system can be downloaded from
> http://152.66.235.5/info-filter.tgz
> this is my worst nightmare, any suggestions? ;)

You do have my sympathy, but I didn't download the file. I would be 
likely to do that if it was something I could view in the browser, like 
text or HTML.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

