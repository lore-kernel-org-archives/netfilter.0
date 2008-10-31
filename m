From: Philip Craig <philipc@snapgear.com>
Subject: Re: Shortcuts to counting rules?
Date: Fri, 31 Oct 2008 11:29:20 +1000
Message-ID: <490A5F70.6070803@snapgear.com>
References: <4908FDE9.7040006@hp.com> <49090A3D.40102@snapgear.com> <4909E386.1000405@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4909E386.1000405@hp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Rick Jones <rick.jones2@hp.com>
Cc: netfilter@vger.kernel.org

Rick Jones wrote:
> I can see the appeal to an application since it does provide a nice 
> abstraction.

Sure, but there was never any intention for it to be stable.  iptables
can change that library at any time, with no guarentee that any other
apps trying to use it will keep working.

>> The getsockopt() calls are part of the linux ABI.  Using them is safe.
>> You just need to make sure you handle the case that they aren't
>> implemented.
> 
> Time to go find their documentation then I suppose.

I don't expect there is any, but I might be wrong.

> Looks like struct ipt_getinfo and ip6t_getinfo are only in header files 
> that come with "iptables-dev?"

They are defined in the kernel header files.  It's a stable ABI, so creating
a local copy is fine (which is what iptables does now... iptables used to
require the presence of the kernel headers).

