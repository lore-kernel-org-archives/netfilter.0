From: Whit Blauvelt <whit@transpect.com>
Subject: Re: How can I ask IPTABLES to drop a packet based upon its content
Date: Wed, 6 Aug 2003 08:53:24 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030806125324.GA6378@china.patternbook.com>
References: <88116A11E9DFD411870900508BEC3831803C2B@CPQ01>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <88116A11E9DFD411870900508BEC3831803C2B@CPQ01>
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
Content-Transfer-Encoding: 7bit
To: Deshwal Chand <CDD@kampsax.co.in>
Cc: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

You might find it much easier, although still a lot of work, to install a
relaying mail server on the firewall that uses SpamAssassin and Razor called
from the MIMEDefang milter in sendmail. I've also seen a Webpage somewhere
on doing this using Qmail and SpamAssassin (you might google for it). This
is all free software - the only investment is your time.

Asking iptables to do it is putting the load in the wrong place, and failing
to take advantage of the work already done in using mail daemons for this
task.

Whit

On Wed, Aug 06, 2003 at 03:07:31PM +0530, Deshwal Chand wrote:
> Hi,
> 
> I am running IPTABLES on Redhat 7.2 box. We are running a mail server behind
> this firewall. We receive lot of spam e-mails. Instead of investing into the
> anti-spam s/w, I want to configure the IPTABLES to read the contents on the
> packets and drop them based upon the filter defined.
> 
> Any help ......
> 
> 
> Regards,
> 
> Chand

