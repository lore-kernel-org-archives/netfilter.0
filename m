From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Firewall problem
Date: Wed, 15 Jun 2005 09:10:07 -0500
Message-ID: <200506150910.07085.rob0@gmx.co.uk>
References: <20050615130102.35654.qmail@web30601.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050615130102.35654.qmail@web30601.mail.mud.yahoo.com>
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

On Wednesday 15 June 2005 08:01, Mohamed Nassih wrote:
> it does not work,
>
> please help

Sorry, no, but I will tell you why.

OUTPUT restrictions are hard to do. I don't mess with them myself, and 
it's possible I have a much greater understanding of firewalling than 
you do. Of course OUTPUT only affects locally-generated packets, not 
the MASQUERADE ones from your local network, so that may not be your 
issue.

What you want to do is probably covered in the simple examples in the 
Packet Filtering and NAT HOWTOs. Read them. If you have done so you can 
come up with a more specific statement of problem and question than "it 
does not work, please help." Then if I have time and know the answer I 
might help.

Guido pointed out a definite show-stopping typo in your script, BTW. 
There will be no packet forwarding with a typo like that (unless it was 
turned on in some other way, such as the distro's sysctl interface.)
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

