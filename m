From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SMTP Routing Based On Recipient
Date: Tue, 23 Dec 2003 15:52:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312231552.33902.Antony@Soft-Solutions.co.uk>
References: <1072121282.10935.12.camel@localhost.localdomain> <200312231314.06746.Antony@Soft-Solutions.co.uk> <20031223083625.142571c7.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031223083625.142571c7.mgale@utilitran.com>
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
To: netfilter@lists.netfilter.org

On Tuesday 23 December 2003 3:36 pm, Michael Gale wrote:

> Hello,
>
> 	Do not use sendmail ... look into Postfix. It is MUCH easier to configure
> and more secure. It was designed with security and easy of use. You can
> setup a simple host to accept mail for your domain and then forward it to
> your exchange server.

I know this is getting a bit off-topic for this list, however I specifically 
left postfix out of the message I posted previously because it uses a highly 
strange mail queue-file naming mechanism which is tied to the on-disk inode 
numbers, and does not guarantee to generate unique queue IDs for different 
emails, even on the same machine at the same time if they are on different 
partitions.   This can cause problems with external programs such as 
MailScanner which move mail queue files from a processing queue to a delivery 
queue as part of their scanning job.

In my opinion sendmail's poor security reputation is now largely historical, 
and if you don't want to use that you should consider exim, which is 
generally regarded as higher performance anyway.

> It is also easier to use any of the spam tools with Postfix as compared to
> using them with sendmail.

This becomes irrelevant when you use something like MailScanner to handle all 
the anti-virus/anti-spam processing, and leave the MTA to do what it's good 
at - delivering email.

Regards,

Antony.

-- 
Christmas is just an opportunity to upgrade to kernel 2.6 while no-one's 
around to notice the downtime.

                                                     Please reply to the list;
                                                           please don't CC me.


