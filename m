From: Frank Smith <fsmith@hoovers.com>
Subject: Re: limit match log question
Date: Wed, 30 Apr 2003 10:39:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <29940000.1051717143@hoovers-59.hoovers.com>
References: <17030000.1051714338@hoovers-59.hoovers.com> <Pine.LNX.4.51.0304301712450.18203@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.51.0304301712450.18203@dns.toxicfilms.tv>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: Netfilter <netfilter@lists.netfilter.org>

--On Wednesday, April 30, 2003 17:13:50 +0200 Maciej Soltysiak <solt@dns.toxicfilms.tv> wrote:

>> If you are using the limit match to control the number of log entries,
>> is there any way to also show the number of matches?
> Yes,
>
># iptables -L -nv
>
> -v option will show the number of packets that has hit the rule.

Thanks for the reply, but it seems I wasn't clear on my question.  I was
looking for a way to get the number logged, so when the log entry was
written it would contain the number of matches that occurred during the
log limit interval.  If the log limit interval were set to 5 seconds, and
it got 1000 matches in that 5 seconds, the log entry would contain the
number 1000 in it somewhere.
   It seemed to me like a useful extension that would enable you to reduce
log file sizes while still providing data on the frequency of events. Getting
the counters from iptables on the command line is helpful for seeing what's
going on right now, but doesn't help if you want data from some time in the
past.

Frank

--
Frank Smith                                             fsmith@hoovers.com
Systems Administrator                                  Voice: 512-374-4673
Hoover's Online                                          Fax: 512-374-4501

