From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: H323 Patch-o-matic
Date: Tue, 31 Dec 2002 19:57:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <C026BF1E-1CF1-11D7-8A13-000393950CC2@karlsbakk.net>
References: <200212231328.17654.richard@arachnia.dynip.com>
Mime-Version: 1.0 (Apple Message framework v548)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200212231328.17654.richard@arachnia.dynip.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard Norton <richard@arachnia.dynip.com>
Cc: netfilter@lists.netfilter.org

don't use RedHat's kernel
use the one you get from kernel.org

On Monday, December 23, 2002, at 07:28 PM, Richard Norton wrote:

> Hi,
> I am trying to get H323 working over using nat so i have been trying 
> to patch my kernel (RedHat 8.0 stock 2.4.18-14) using the 
> patch-o-matic.
> When i apply the h323-conntrack-nat.patch, it complains that there are 
> problems:
>
> Testing patch extra/h323-conntrack-nat.patch...
>    Placed new Config.in line
>    Placed new Config.in line
>    Placed new Configure.help entry
>    Placed new Makefile line
> Could not find place to slot in ip_conntrack.h line
> Could not find place to slot in ip_conntrack.h line
> Could not find place to slot in ip_conntrack.h line
>
> How do i fix this?
>
> Cheers,
>
> Richard.


