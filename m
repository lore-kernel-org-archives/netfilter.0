From: Zoltan Nagy <kirk@elte.hu>
Subject: Re: kernel freeze issue
Date: Fri, 11 Nov 2005 20:06:27 +0100
Message-ID: <4374EBB3.6040300@elte.hu>
References: <43692579.8000807@elte.hu> <200511090821.09368.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511090821.09368.rob0@gmx.co.uk>
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

hi

/dev/rob0 wrote:
> General comment on the format: it would help if you would put the text 
> and list portions in standard (>80 columns) format. ASCII drawings are 
> harder to fit sometimes, but even those will come across better under 
> 80 columns. I use a GUI MUA so I was able to resize to view your post 
> properly, but remember, much of your audience might be using mutt.
> 

ok, i use 212x83 terminals ;)

> On Wednesday 2005-November-02 14:45, Zoltan Nagy wrote:
> 
>>problem:
>>	filter is freezes in random intervalls(30m - 6day) - on-board
>>watchdog(i8xx) reboot's the system i've tryed many things, remove my
>>custom patches...but it won't help ;) in the kernel trace i've last
> 
> 
> I would suspect hardware first.
another part of the story...problem started with a rtl8139 if
on the side of the micro it have been failed time to time,
the transciever has gone mad, and packet traversal has become 20% ;)
so...we tried a 3c940 to put it on the router side - the card don't
take up the link...
we tried rtl8169 - like the 940
so, we bought 2 brand new 3c905tx, i'm not sure(because at this time
was a hw change, and i've rewrote nearly everything in a new style...
so i don't suspected hw issue, but i will try an intel100 ;)


> 
> 
> Did you try swapping out that NIC?
> 
> 
yes ;)

> You do have my sympathy, but I didn't download the file. I would be 
> likely to do that if it was something I could view in the browser, like 
> text or HTML.
i think people like to read source in there own ways, i prefer use less..
/there's a bit too many files in it/
...and i hate viewing sources in browser - i hate white bg color ;)

regards.kirk



