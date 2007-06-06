From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: SNAT before IPSec
Date: Wed, 06 Jun 2007 13:48:15 -0500
Message-ID: <4667016F.6070701@riverviewtech.net>
References: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>	<web-74829660@bk1.webmaillogin.com>	<4665C771.4040609@riverviewtech.net>	<web-74831651@bk1.webmaillogin.com>	<4665F77D.8050603@riverviewtech.net>
	<web-73936562@bk2.webmaillogin.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-73936562@bk2.webmaillogin.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 06/06/07 10:39, Jorge Davila wrote:
> to be honest, reading, re-reading before the rfc the same doubt come 
> to my mind but now, my understanding is that the paragraph is really 
> doing reference to an interface to manage the traffic according to 
> the policies defined.

*nod*

I think the reason that network interfaces stopped being created was in 
preparation for MANY IPSec connections, enough so that creating network 
interfaces would just be a waste.  If I recall correctly the IPSec 
people were wanting and hoping to start seeing IPSec used arbitrarily 
any time that it could be used, including accessing web pages off of web 
servers.  In this case, creating and removing interfaces is just (IMHO) 
ridiculing.



Grant. . . .

