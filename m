From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: filtering by packet contents?
Date: Wed, 16 Jul 2003 16:43:09 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0192BF@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: cc <cc@belfordhk.com>, netfilter@lists.netfilter.org

Yes this is true but what you can do is this...

Patch in the "string" module as well as the "iplimit" module

Add a rule for "iplimit" to block already registered IPsfor xx seconds.
Then add a rule for SYN connections with that --string to add it's =
source to the iplimit table.

Usually the code red attacks aren't spoofed (from memory) and are just =
trying to get in.. so after the first attempt, the second/third/fourth =
will be automatically dropped and won't be looked at by --string since =
iplimit blocks before it... get it? this should not stress the CPU as =
much I don't think...

dunno if that made sense or would fully work 100% but it's an idea I had =
for other types of problems.. PSD is another one..

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: Daniel Chemko [mailto:dchemko@smgtec.com]
Sent: Wednesday, July 16, 2003 4:23 PM
To: George Vieira
Cc: cc; netfilter@lists.netfilter.org
Subject: Re: filtering by packet contents?


George Vieira wrote:

>You can you use the p-o-m patch for the string module "-m string =
--string pattern"
>
>this works and can be used for some funky stuff too like redirecting 1 =
virtual host on a server to another server which is very handy when a =
particular virtual host goes down...
>
> =20
>

Just keep in mind that the string patch is VERY heavy on CPU depending=20
on how much traffic passes through the rule.


