From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: SNAT before IPSec
Date: Tue, 05 Jun 2007 15:28:33 -0500
Message-ID: <4665C771.4040609@riverviewtech.net>
References: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>
	<web-74829660@bk1.webmaillogin.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-74829660@bk1.webmaillogin.com>
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

On 06/05/07 15:15, Jorge Davila wrote:
> I'm guessing that you can use the "normal" approach and apply the SNAT 
> rules to the outgoing traffic flowing in the ipsec interfaces.

...

> All traffic that pass the POSTROUTING chain in the NAT table is leaving 
> the firewall box (through a physical interface e.g.:eth0 or through a 
> virtual interface e.g.:ipsec0).

Um, correct me if I'm wrong, but not all IPSec implementations create an 
interface any more.



Grant. . . .

