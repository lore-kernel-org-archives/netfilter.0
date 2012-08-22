From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: old question revisited: can rely in 'iptables-restore' format?
Date: Wed, 22 Aug 2012 21:12:50 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1208222102010.15534@frira.zrqbmnf.qr>
References: <COL124-W20E1581415198E1293F5D484B40@phx.gbl> <20530.51137.458307.357243@tree.ty.sabi.co.UK> <20120821003026.GD3672@harrier.slackbuilds.org> <201208202221.37529.neal.p.murphy@alum.wpi.edu> <20120822173512.GO3672@harrier.slackbuilds.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120822173512.GO3672@harrier.slackbuilds.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Wednesday 2012-08-22 19:35, /dev/rob0 wrote:

>On Mon, Aug 20, 2012 at 10:21:37PM -0400, Neal Murphy wrote:
>> On Monday 20 August 2012 20:30:26 /dev/rob0 wrote:
>> > The main benefit is that iptables-restore is atomic. All changes
>> > are committed in one pass. Any error in the ruleset means your
>> > existing ruleset is not replaced.
>> 
>> [Minor digression]
>> By 'atomic', do you mean that all of the changes are made with a 
>> single COMMIT, regardless of how many tables are accessed and 
>> regardless of how many rules are processed?
>
>I don't know. I was hoping that someone familiar with the source 
>would answer.

COMMIT is for each table separately, hence the atomicity is also at the 
table level.

>> It's been my experience that there is an implicit COMMIT at every 
>> table change, and there is a ballpark limit of around 20,000 rules 
>> per commit. Thus:

There is an upper limit, each table can be at most 4 GB in size. But it 
will *always* be atomic - that is to say, an incoming packet will 
always have some table (either the old, or its replacement) to be 
processed with.

The most massive real-world ruleset to date has been Jesper's
with 662160 rules (in 151426 chains) weighing in at "only" 149 MB.

>>   - If the changes to a table contain more than around 20,000 rules,
>>     then that operation will require more than one COMMIT and will
>>     NOT be atomic.

No no no..
