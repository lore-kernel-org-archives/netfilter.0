From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: hosts.deny
Date: Mon, 8 Jul 2002 00:55:47 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020707235549.ONWM23840.mta03-svc.ntlworld.com@there>
References: <007301c22610$e152fe00$0a01a8c0@ed>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <007301c22610$e152fe00$0a01a8c0@ed>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 08 July 2002 12:49 am, Ed Street wrote:

> Hello,
>
> This is most commonly seen in spam mail.

I most commonly see it in port scans, and probes for http / sql holes.

Spam mail may contain misleading headers (until you get to learn where to 
stop reading the machine names, and realise that the headers have been rigged 
from that point on), but they can't disguise the real IP address of the relay 
machine which fed the mail into the smtp chain...

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org] On Behalf Of Antony Stone
> Sent: Sunday, July 07, 2002 7:44 PM
> To: netfilter@lists.samba.org
> Subject: Re: hosts.deny
>
> On Monday 08 July 2002 12:36 am, George Vieira wrote:
> > spoofed as in local IP coming in from the internet..
>
> I call that ingress filtering.
>
> I regard spoofing as an incoming connection with a plausible but false
> source
> address, typically used on Denial of Service attacks, either to disguise
> the
> true source of the attack, and/or to cause an active IDS to block access
> to
> networks you really don't want to block.
>
>
>
> Antony.

