From: "Andrew Smith" <nfml@k1k2.com>
Subject: Re: Rules for blocking Email from libero.it domain
Date: Tue, 29 Oct 2002 10:17:10 +1100 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <42647.192.168.7.14.1035847030.squirrel@iw.k1k2.com>
References: <200210281507.g9SF70e08704@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210281507.g9SF70e08704@vulcan.rissington.net>
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

> On Monday 28 October 2002 2:04 pm, Sundaram Ramasamy wrote:
> 
>> Hi,
>>
>> I want to block all incoming mail from the libero.it domain.
> 
> Configure your mail server to reject it.
> 
> Netfilter is not the right answer to this question.
> 
> Antony.

Actually, that depends on the reason.
If the problem is that you keep getting large arounts of email
from libero.it then I think you may have to use the firewall.
I'm only guessing, but when I view my maillog it always
seems to know the size of each email that has been blocked,
so I presume I am actually getting the email then it is
being rejected (unless the sendmail protocol passes this
value across and that is what is being displayed?)
I've never actually looked into it though.
Usefull if someone knows for sure (otherwise I'll get around
to it one day and actually test it to be sure :-)

However, as suggested before, you need to block all the smtp
servers for liberato.it - not just one of them.

-- 
-Cheers
-Andrew

MS ... if only he hadn't been hang gliding!


