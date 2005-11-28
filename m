From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Forward Ipset and Clear DNAT entry
Date: Mon, 28 Nov 2005 17:39:23 -0600
Message-ID: <200511281739.23613.rob0@gmx.co.uk>
References: <437E02A4.40407@kitchenandassociates.com>
	<Pine.LNX.4.58.0511241130310.20155@blackhole.kfki.hu>
	<438B7671.3070300@kitchenandassociates.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <438B7671.3070300@kitchenandassociates.com>
Content-Disposition: inline
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

On Monday 2005-November-28 15:28, Rob Carlson wrote:
> The idea is (in the long term) to be able to send
> port 25 traffic from hotmail to a test mail
> server, where the spam could be discarded and we
> could forward legitimate mail that comes from
> clients who still use hotmail...  Since 95% of
> hotmail is trash, it would make our populace here

Hmmm, I probably don't agree with this approach to the problem. 
Therefore most or all of this will be off-topic.

How did you identify the hotmail IP addresses? Their SPF?
"v=spf1 include:spf-a.hotmail.com include:spf-b.hotmail.com 
include:spf-c.hotmail.com include:spf-d.hotmail.com ~all" I won't try 
to chase down all those includes.

> In the short term (in order to test our
> postfix/procmail configuration) I want to be able

When you say "procmail" I think you are going about this the wrong way. 
For spam reduction in Postfix, see here:
http://jimsun.linxnet.com/misc/postfix-anti-UCE.txt
and the various README files, especially
http://www.postfix.org/SMTPD_ACCESS_README.html .
I also like greylisting at least for unknown clients and hosts which 
appear to be dynamic. sqlgrey has a good regex for identifying likely 
dynamic clients, which in most cases turn out to be Windows zombies.

You could use Postfix restriction classes and handle the mail from 
Hotmail differently within the same Postfix instance, too. While there 
is plenty of spam and abuse emanating from Hotmail.com clients, the 
*vast majority* of so-called "hotmail" spam comes from elsewhere: 
Windows zombies pretending to send from hotmail users. The proper way 
to deal with that would be the from_freemail_hosts class described in 
the aforelinked Cheat Sheet.

> to ssh to my home machine and mail to myself at
> work (with the hope that the mail will be routed
> AWAY from our primary mailserver to the test mail
> server).

How are you submitting this mail? You are not hotmail.com, I bet.

> So, I'm right now, I can ssh to my home machine,
> but any mail I send still goes to the primary server.

If your IP is in the set but you use a client which calls sendmail(1) 
for submission, you are not going to hit your port 25, thus no DNAT 
will take place. Also if this machine is the one you're DNAT'ing, you 
need your DNAT rules in OUTPUT, not PREROUTING.

> Thanks for the help so far and any more...

Whew, at least THAT part of it was on topic. :)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

