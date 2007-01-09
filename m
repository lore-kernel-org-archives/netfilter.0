From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: max number of connection
Date: Tue, 9 Jan 2007 16:01:48 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701091601020.31427@yvahk01.tjqt.qr>
References: <BAY110-DAV3EC00E1ACEC181C4B8FFFBABC0@phx.gbl>
	<Pine.LNX.4.61.0701082143060.23737@yvahk01.tjqt.qr>
	<45A305C3.2020809@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45A305C3.2020809@riverviewtech.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>


>> -m connlimit
>
> Not to be a stickler, but does connlimit have a way to control the 
> total number of combined in AND out bound connections a host has?

That does not exist yet AFAICS. You would have to combine hashlimit with 
connlimit, creating a new kernel module, somehow... 

-- 

