From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Ulogd
Date: Mon, 7 Oct 2002 10:59:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210070959.g979xVL13988@vulcan.rissington.net>
References: <1033974911.11503.4.camel@bigblue>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1033974911.11503.4.camel@bigblue>
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
To: netfilter <netfilter@lists.netfilter.org>

On Monday 07 October 2002 8:15 am, darkstar wrote:

> Quick question, I use ulog for all logging and would like to start
> logging to a MySQL database.
> I want to log to a database on another server. Would it be better
> (traffic wise) to log directly to the database or to rather import a log
> file at the end of the day into the database..???

I'd say it depends on two things, maybe three:

1. How steady is the traffic on the link between your servers, and does it 
saturate ?   If you have spare capacity most of the time, there's no harm in 
sending the logs continuously.   If it saturates, then you would generate 
most log entries when there's most traffic, making the problem worse, so best 
to batch it up for a quiet period in the moddle of the night...

2. What do you want to do with the logs on the database ?   If you have no 
interest in processing them as they come in, there's no need to get them 
"live", so a batch upload might be best.   If your database will be used for 
live traffic analyses and you want to see what's come inn in the past 5 
minutes, you need a continuous update.

3. If you get some serious problem and your firewall gets compromised, 
crashes, bursts into flames etc., how bothered are you about losing the 
current day's logs ?   If you don't care, then a batch upload is okay; if you 
want to see what happened just before the disaster, you need to send to the 
database server continuously.

Hope this helps,

Antony.

-- 

This is not a rehearsal.
This is Real Life.

