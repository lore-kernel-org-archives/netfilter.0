From: Rick Jones <rick.jones2@hp.com>
Subject: Re: Shortcuts to counting rules?
Date: Thu, 30 Oct 2008 11:46:47 -0700
Message-ID: <490A0117.4090501@hp.com>
References: <4908FDE9.7040006@hp.com> <49090A3D.40102@snapgear.com> <4909E386.1000405@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4909E386.1000405@hp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Rick Jones <rick.jones2@hp.com>
Cc: Philip Craig <philipc@snapgear.com>, netfilter@vger.kernel.org

Rick Jones wrote:
> Philip Craig wrote:
>> The getsockopt() calls are part of the linux ABI.  Using them is safe.
>> You just need to make sure you handle the case that they aren't
>> implemented.
> 
> 
> Time to go find their documentation then I suppose.

Looks like struct ipt_getinfo and ip6t_getinfo are only in header files 
that come with "iptables-dev?"

rick jones
