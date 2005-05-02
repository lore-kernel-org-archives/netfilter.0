From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: rules for skype
Date: Mon, 2 May 2005 17:07:23 +0200
Message-ID: <11950.8134470836$1115046221@news.gmane.org>
References: <42763BFA.9030609@riverviewtech.net>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42763BFA.9030609@riverviewtech.net>
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

I think that you can stop ALL https connections with squid.. if you want of
course... but then, I dont know if there is such way as you described it. A
very good ACL implementation is squidGuard.

But hey.. why do you want to stop skype?

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Taylor, Grant
Sent: Montag, 02. Mai 2005 16:41
To: netfilter@lists.netfilter.org
Subject: Re: rules for skype

> Yes this 443 port thing is the only reason why it seems that Skype is 
> unstoppable. You could block connections to that port but then you would 
> also cut off https based websites :(.

Would it be possible to ACL via Squid (or the likes) to control what host a
client is initiating an SSL connection to?  I have not done much filtering
on the application (HTTP) level beyond blocking basic requests for a domain
on standard HTTP (80).  I wonder if it would be possible to write an
extension for Squid that would not allow connections to IP addresses that
don't (forward) resolve back to what they reverse resolve to.  I'm grasping
at straws here, but then again Skype is going to be hard to stop.





Grant. . . .



