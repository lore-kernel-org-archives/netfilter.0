From: Jason Opperisano <opie@817west.com>
Subject: Re: netfilter accounting problem
Date: Tue, 01 Feb 2005 08:37:20 -0500
Message-ID: <1107265040.4330.22.camel@hubcap.ljm.dom>
References: <20050201051322.69937.qmail@web54401.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050201051322.69937.qmail@web54401.mail.yahoo.com>
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

On Tue, 2005-02-01 at 00:13, Vincent Chen wrote:
> Hi, all
> 
> I tried to analyze log from netfilter to have a picture about my network's
> activity. I study and look around for days and found it's not easy. Here I what
> I found:
> 
> 1. Most firewall use stateful inspection and log entry generated after
> connection terminated. Byte transfered included in log. It's easy for
> reporting. It seems that netfilter logging is based on packet header. If I want
> a connection information, I have to trace the log from 3 way tcp handshake
> until FIN ACK received. Is this true? If so, it's not friendly to reporting
> system.

if you're looking to do some accounting--look at the various patches for
this in POM, such as:  account, ACCOUNT, conntrack-acct.

> 2. The logging file will be very huge and hard to process. My network generated
> > 300M logfile in 1 day. And the log mixed with system entry. Can I send
> netfilter log to local0~local7? If yes, how can I do that?

two options come to mind:  1) use ULOG which will allow you to send
iptables logs to their own file or 2) replace your standard syslogd with
syslog-ng which will allow you to filter the iptables messages into
their own file.

> 3. I can tell the whether the log come from accept rule or drop rule. Is there
> a column for this? I can't find more detailed information.

yeah--use the "--log-prefix" option to add a comment to your log
entries.

-j

--
"Man, you go through life, you try to be nice to people, you struggle
 to resist the urge to punch 'em in the face, and for what?"
	--The Simpsons


