From: Scott Mayo <sgmayo@mail.bloomfield.k12.mo.us>
Subject: Re: Logging to the screen
Date: Mon, 28 Nov 2005 08:41:08 -0600
Message-ID: <438B1704.4040204@mail.bloomfield.k12.mo.us>
References: <43836074.3000403@mail.bloomfield.k12.mo.us>
	<200511221239.01763.rob0@gmx.co.uk>
Reply-To: sgmayo@mail.bloomfield.k12.mo.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511221239.01763.rob0@gmx.co.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

/dev/rob0 wrote:
> On Tuesday 2005-November-22 12:16, Scott Mayo wrote:
> 
>>the actual firewall itself and see all this info that I had my
>>IPTABLES log, on the screen.  Any reason why it is not sending it to
>>the /var/log/messages? Thanks.
> 
> 
> The answer is in your LOG rules (--log-level) and syslog.conf(5). LOG 
> uses syslog(2) facility "kern" and priority as set in --log-level 
> (default is probably "info".)

Thanks for the info.  I got to reading the man pages on syslog.  My 
iptables were logging with the value 'debug'.  From what I read, if I 
understand this correctly, that will cause syslog to send the message to 
the screen.  I changed my iptables to a log-level of 'info' and it is 
now sending the messages to /var/log/messages.

Thanks again.

-- 
Scott Mayo
Technology Coordinator
Bloomfield Schools
PH: 573-568-5669
FA: 573-568-4565
Pager: 800-264-2535 X2549

Duct tape is like the force, it has a light side and a dark side and it
holds the universe together.

