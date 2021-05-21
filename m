From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: libnetfilter_conntrack: ABI breakage error
Date: Fri, 21 May 2021 23:56:32 +0200
Message-ID: <20210521215632.GA3619@salvia>
References: <CAFqmWq9r95YtvNc+eYwHcL+oDutgL+g++tPZBsr9yh2KrNveNw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFqmWq9r95YtvNc+eYwHcL+oDutgL+g++tPZBsr9yh2KrNveNw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Psyspy 22 <psyspy2020@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, May 21, 2021 at 11:55:11AM -0600, Psyspy 22 wrote:
> Hello,
> 
> I am trying to dump conntrack entries from my application. When I run
> the binary, it throws the following error and exits:
> 
> # ./dump
> ctnetlink kernel ABI is broken, contact your vendor.
> ../../source_subfolder/src/conntrack/parse_mnl.c:824 reason: Numerical
> result out of range
> 
> I looked at the source code of the library, it seems to be this line:
> 
> case CTA_SYNPROXY_TSOFF:
>            if (mnl_attr_validate(attr, MNL_TYPE_U32) < 0)
>                abi_breakage();
>            break;
>        }
> 
> I am not sure why this issue occurs or how to fix it. I appreciate any help!

Strange. Could you provide more details regarding your setup?

Thanks.
