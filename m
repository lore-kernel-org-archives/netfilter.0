From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: SNAT before IPSec
Date: Tue, 05 Jun 2007 14:45:05 -0600
Message-ID: <web-74831651@bk1.webmaillogin.com>
References: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>
	<web-74829660@bk1.webmaillogin.com>
	<4665C771.4040609@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4665C771.4040609@riverviewtech.net>
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
To: gtaylor+reply@riverviewtech.net, Mail List - Netfilter <netfilter@lists.netfilter.org>

Well Grant, the IPSec standard [1] said:

For every IPsec implementation, there MUST be an administrative
    interface that allows a user or system administrator to manage the
    SPD.  Specifically, every inbound or outbound packet is subject to
    processing by IPsec and the SPD must specify what action will be
    taken in each case.  Thus the administrative interface must allow the
    user (or system administrator) to specify the security processing to
    be applied to any packet entering or exiting the system, on a packet
    by packet basis.

Best regards,

Jorge Davila.

[1] http://www.ietf.org/rfc/rfc2401.txt
On Tue, 05 Jun 2007 15:28:33 -0500
  Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 06/05/07 15:15, Jorge Davila wrote:
>> I'm guessing that you can use the "normal" approach and apply the SNAT 
>> rules to the outgoing traffic flowing in the ipsec interfaces.
> 
> ...
> 
>> All traffic that pass the POSTROUTING chain in the NAT table is leaving 
>> the firewall box (through a physical interface e.g.:eth0 or through a 
>> virtual interface e.g.:ipsec0).
> 
> Um, correct me if I'm wrong, but not all IPSec implementations create an 
>interface any more.
> 
> 
> 
> Grant. . . .
> 
> 

Jorge Isaac Davila Lopez
Nicaragua Open Source
+505 430 5462
davila@nicaraguaopensource.com

