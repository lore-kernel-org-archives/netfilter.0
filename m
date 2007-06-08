From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: SNAT before IPSec
Date: Fri, 08 Jun 2007 12:57:28 -0500
Message-ID: <46699888.5000004@riverviewtech.net>
References: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>	<web-74829660@bk1.webmaillogin.com>	<8bd3dfad0706051429r7c37e29dhcd8d2550a613bab3@mail.gmail.com>	<web-17532572@bk3.webmaillogin.com>	<8bd3dfad0706051540t626bf02fk15e20eace4818b3e@mail.gmail.com>	<web-17534558@bk3.webmaillogin.com>	<8bd3dfad0706051605u49cdbf17jca76d1d74ebdd26b@mail.gmail.com>	<web-73937813@bk2.webmaillogin.com>	<8bd3dfad0706070840i2b80fa4bl5a9a4ae5973b0e01@mail.gmail.com>	<46683B69.8000303@riverviewtech.net>	<4668488A.8040102@riverviewtech.net>
	<web-75050127@bk1.webmaillogin.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-75050127@bk1.webmaillogin.com>
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

On 06/07/07 15:57, Jorge Davila wrote:
> In your analysis you forget that the packet delivered by the Router A 
> to Router B (or viceversa) is an encrypted packet. Once the packet in 
> decrypted in the other end the headers are the headers of the 
> original packets. Then, the scenary is more funny.

I was aware that IPSec encryption / decryption was going to take place. 
  It is my experience that current IPSec implementations which tunnel 
traffic do so with the traffic looping through through the kernel twice, 
once unencrypted and once encrypted then on the receiving end once 
encrypted and then once decrypted.  I was talking about doing the NATing 
on the unencrypted / decrypted passes, not the encrypted pass.

You are right that including the encryption / decryption in the 
discussion would have made things much more complex and entertaining to 
look at.

Thankfully what I was trying to convey is done regardless of IPSec (the 
way that I have messed with it) so it did not need to come in to the 
discussion.

Thanks for the pointer.  ;)



Grant. . . .

