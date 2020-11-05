From: Duncan Roe <duncan_roe@optusnet.com.au>
Subject: Re: Trying to provision flowtable returns error
Date: Thu, 5 Nov 2020 11:53:45 +1100
Message-ID: <20201105005345.GA4263@dimstar.local.net>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
 <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Martin,

On Wed, Nov 04, 2020 at 12:30:31AM -0500, Martin Gignac wrote:
> Hi,
>
> I want to try out flowtables and I am trying to create a new flow
> table (based on
> https://www.kernel.org/doc/Documentation/networking/nf_flowtable.txt)
> by inserting the below statement in my 'firewall.nft' file:
>
> ----------
> table inet filter {
>
>   flowtable f {
>     hook ingress priority 0; devices = { br0, br1 };
>   }
>
>   chain input {
>     type filter hook input priority 0; policy drop;
>
> [remainder removed]
> ----------
>
> When I run 'nft -c -f firewall.nft' it returns the following error:
>
> ----------
> /etc/firewall.nft:10:13-13: Error: Could not process rule: No such
> file or directory
>   flowtable f {
> ----------
>
> I haven't been able to figure out what's wrong about my syntax so far.
>
> Any hints?
>
> Thanks,
> -Martin

"No such file or directory" refers to something that is missing, rather than to
command syntax.

What may be missing is a required kernel module. Does 'lsmod' show
'nf_flow_table' and 'nf_flow_table_inet'?

Also, what is you kernel version?

Cheers ... Duncan.
