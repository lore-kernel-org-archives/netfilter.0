From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: question about the order of the rules of iptables
Date: Thu, 8 Sep 2005 19:59:25 +0200
Message-ID: <20050908175745.015608EDCEB@smtp.sterenborg.info>
References: <20050908170918.59371.qmail@web60411.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050908170918.59371.qmail@web60411.mail.yahoo.com>
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

netfilter-bounces@lists.netfilter.org wrote:
> Hi John, Thanks for your reply. Actually I need to clarify.
> 
> In my config, I have an anti-spam process running on the
> linux gateway and listening on port 1025. My intention is to
> have the linux gateway filter out all the junks.
> 
> I intend to have the linux box first modify the Dest ip and
> forwarded it the local anti-spam process for spam checking.
> After that, the anti-spam process will forward the clean mail
> to the mail server since the ip address has already been modified.
> 
> Will that intention in mind, will my iptables rules still
> work ? If not, how should I design my iptables rules ?

Normally, you setup a mail gateway which which is configured to do
spam/virus filtering.
In my case, I used Postfix with Amavis, ClamAV and SpamAssassin.

Postfix receives the email, and can optionally be configured to check if
the "To" email address is valid using user accounts, aliases, ldap, ...

Next it sends the email to Amavis, which checks for virusses using
ClamAV and spam using SpamAssassin.

SpamAssassin can quarantine if the spam-score of an email is above
sa_kill_level2, can add email headers containing the spam-score and can
alter the subject saying it is probably spam.

If an email is not quarantined, it is sent back to Postfix which will
deliver it to the next MTA or to an MDA which can deliver the email to a
mailbox.


Gr,
Rob


