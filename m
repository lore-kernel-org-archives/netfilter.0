From: John Holman <jaholman@eastax.com>
Subject: Re: Accuracy of packet counting?
Date: Sun, 26 May 2002 08:16:55 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CF00D57.F2399EBE@eastax.com>
References: <3CE4352B.36C46B79@john.holman.name> <20020525120020.O30908@sunbeam.de.gnumonks.org>
Reply-To: mail@john.holman.name
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Harald Welte <laforge@gnumonks.org>
Cc: John Holman <mail@john.holman.name>, netfilter@lists.samba.org



Harald Welte wrote:
> 
> On Fri, May 17, 2002 at 08:39:39AM +1000, John Holman wrote:
> > My question:
> >
> > Is there ANY reason to suppose that the ACCOUNTING total is not an
> > accurate count of all IP traffic into and out of eth0?
> 
> yes, since you only count locally-generated and locally-targeted traffic,
> not the traffic forwarded by your machine.
> 
> use your accounting rules in the mangle table (PREROUTING and POSTROUTING)
> to cover all traffic.
> 


Thank you for that, Harald, it was a RTFM problem :(

[I eventually managed to work out the reason for the discrepancies
byself, by checking against a detailed traffic report supplied by my
ISP.]

-- 
Best regards,
John Holman
Eastax WWW
Melbourne, Australia

