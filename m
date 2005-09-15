From: "Albretch Mueller" <lbrtchx@hotmail.com>
Subject: RE: logging to syslog in a stealth way
Date: Thu, 15 Sep 2005 15:26:44 +0000
Message-ID: <BAY101-F189DDD6D8895BBB9EC091BB49E0@phx.gbl>
References: <MC8-F29NvzHr4sRQde100197b9c@MC8-F29.hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <MC8-F29NvzHr4sRQde100197b9c@MC8-F29.hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>What exactly you want to achieve with that ?

As the subject clearly states :-) "logging to syslog in a stealth way"

Do you know of any other/better way to do it?

Albretch

// - - - - - - - - - - - - - - - - - - - -
Date: Tue, 13 Sep 2005 18:54:02 +0300
From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: logging to syslog in a stealth way
To: netfilter@lists.netfilter.org
Message-ID: <4326F61A.8020402@hotpop.com>
Content-Type: text/plain; charset=windows-1251; format=flowed

Albretch Mueller wrote:

>Hi *,
>
>I could tell this is more of a Unix/Linux and syslog question, but since my 
>end intention is using it with netfilter, I could imagine someone has come 
>accross something like that before.
>
>I would like for the logs produced by iptable (generally in 
>/var/log/syslog), to be processed by an ng-syslog client and just popped as 
>UDP packets
>
>Search I did the mailing list (http://marc.theaimsgroup.com/?l=netfilter) 
>for 'syslog udp' and couldn't find helpful info/leads and 'ng-syslog' or 
>'ngsyslog' didn't give me a hit
>
>How could you do something like that?
>
>Thanks
>Albretch
>
>
>
>
What exactly you want to achieve with that ?

regards,
Georgi Alexandrov



