From: George Vieira <GeorgeV@citadelcomputer.com.au>
Subject: RE: hosts.deny
Date: Mon, 8 Jul 2002 09:58:21 +1000
Sender: netfilter-admin@lists.samba.org
Message-ID: <200FAA488DE0D41194F10010B597610D2BA269@JUPITER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Most of the http and sql scans are viruses I found.

in regards to sendmail, use a spam filter using sendmail 8.12 and spamcop or
something..

thanks,
George Vieira
Systems Manager
Citadel Computer Systems P/L
http://www.citadelcomputer.com.au



-----Original Message-----
From: Antony Stone [mailto:Antony@Soft-Solutions.co.uk]
Sent: Monday, 08 July 2002 9:56 AM
To: netfilter@lists.samba.org
Subject: Re: hosts.deny


On Monday 08 July 2002 12:49 am, Ed Street wrote:

> Hello,
>
> This is most commonly seen in spam mail.

I most commonly see it in port scans, and probes for http / sql holes.

Spam mail may contain misleading headers (until you get to learn where to 
stop reading the machine names, and realise that the headers have been
rigged 
from that point on), but they can't disguise the real IP address of the
relay 
machine which fed the mail into the smtp chain...

Antony.

