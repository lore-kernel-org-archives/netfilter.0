From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SMTP Routing Based On Recipient
Date: Mon, 22 Dec 2003 19:39:31 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312221939.32091.Antony@Soft-Solutions.co.uk>
References: <1072121282.10935.12.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072121282.10935.12.camel@localhost.localdomain>
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

On Monday 22 December 2003 7:28 pm, Adam Ellis wrote:

> I am running a MS Exchange 5.5 server and am getting hit with the NDR
> (non-delivery report) Reverse Spam Attack as described here:
>
> http://www.tek-tips.com/gviewthread.cfm/lev2/3/lev3/15/pid/10/qid/725829
>
> As the thread describes, there is no way to just turn off NDRs in
> Exchange 5.5 - Microsoft is recommending third party utilities.  What I
> am wondering is this - would it be possible to redirect SMTP to my Linux
> server,

Yes

> use iptables to check that the recipient matches a valid user
> from a list I'd supply,

No

> and, if so, route the message to the Exchange
> server?  And, if no valid recipient is found, the message is simply
> dropped.  Is this even a logical way to handle this situation?  Should I
> be looking at something like snort instead?  I'm all ears!

You need something which can understand SMTP - eg sendmail, exim, qmail.

Netfilter operates at OSI layers 3 & 4 - you need somethign operating at layer 
7 to deal with this requirement.

Antony.

-- 
What makes you think I know what I'm talking about?
I just have more O'Reilly books than most people.

                                                     Please reply to the list;
                                                           please don't CC me.


