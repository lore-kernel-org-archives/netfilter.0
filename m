From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: Log Analyser
Date: Wed, 2 Jul 2003 01:30:15 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030702013015.421ad3ea.arnt@c2i.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15BEAF@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15BEAF@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter@lists.netfilter.org

On Wed, 2 Jul 2003 08:03:22 +1000, 
"George Vieira" <georgev@citadelcomputer.com.au> wrote in message 
<09B04A55822EFF4DA48D2E0BB2941D4A15BEAF@wardrive.citadelcomputer.com.au
>:

> I rule a special chain called `-N MRTG` and store all my counters in
> there. Then I wrote my own PHP script to go through the list and
> gather the counted packets for each rule and place them into MySQL
> every 5 minutes. I then have a crontab every 5 minutes which runs MRTG
> and has targets which run my script to gather the counters..
> 
> The advantage is that reboots don't effect the counts, Monthly counts
> can be archived and reset and all sort of little things...
> 
> Oh also, I use RRDTool to graph the targets every 5 minutes too. It's
> a fiddley setup and it's not a C++ binary program but esy to make
> changes though...
> 
> Does this help you with what you need?

..an url to your tools would be very nice.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



