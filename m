From: Jorge Davila <davila@nicaraguaopensource.com>
Subject: Re: SNAT before IPSec
Date: Wed, 06 Jun 2007 09:39:12 -0600
Message-ID: <web-73936562@bk2.webmaillogin.com>
References: <8bd3dfad0706050529s484d42b6t9ef4ae0fd1730367@mail.gmail.com>
	<web-74829660@bk1.webmaillogin.com>
	<4665C771.4040609@riverviewtech.net>
	<web-74831651@bk1.webmaillogin.com>
	<4665F77D.8050603@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4665F77D.8050603@riverviewtech.net>
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
To: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@lists.netfilter.org>

Grant,

to be honest, reading, re-reading before the rfc the same doubt come to my 
mind but now, my understanding is that the paragraph is really doing 
reference to an interface to manage the traffic according to the policies 
defined.

Jorge Davila.

On Tue, 05 Jun 2007 18:53:33 -0500
  Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 6/5/2007 3:45 PM, Jorge Davila wrote:
>> For every IPsec implementation, there MUST be an administrative 
>> interface that allows a user or system administrator to manage the 
>> SPD.  Specifically, every inbound or outbound packet is subject to 
>> processing by IPsec and the SPD must specify what action will be 
>> taken in each case.  Thus the administrative interface must allow the 
>> user (or system administrator) to specify the security processing to 
>> be applied to any packet entering or exiting the system, on a packet 
>> by packet basis.
> 
> I take this to mean some sort of management point, not necissarily a 
>network interface managed by ifconfig.  Or did I misunderstand your earlier 
>comment to mean the management point?
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

