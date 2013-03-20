From: Nikolai Zhubr <n-a-zhubr-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org>
Subject: Re: netfilter+libvirt=(smth got broken?)
Date: Thu, 21 Mar 2013 03:01:37 +0400
Message-ID: <514A3FD1.80702@yandex.ru>
References: <5149AFD3.2070108@yandex.ru> <5149BC91.4090502@yandex.ru>
	<514A1F0A.4090402@laine.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <libvirt-users-bounces-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1363819851; bh=qF4mHspD8KM/xmHRSZCr3+aTx4c4SX21sbX17SfEogQ=;
	h=Message-ID:Date:From:User-Agent:MIME-Version:To:CC:Subject:
	References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=ZbAEG9LYqNNiKsV2eHSyrBSEUURzUSE64O1oJRqgPKmqe35/YcU+fE9RF+fHf+jg3
	VfY0pcPr6aGzMC1scPbpbVcUfnxgfam0aQp+n6itheV1uNloUYk5FYYEhiWNisHSjv
	8/glcDU34sNXzSxf8dic56YnQ3UQa2gygq8hJqHA=
In-Reply-To: <514A1F0A.4090402-k/Ak44NBdeXYtjvyW6yDsg@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://www.redhat.com/mailman/options/libvirt-users>,
	<mailto:libvirt-users-request-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/libvirt-users>
List-Post: <mailto:libvirt-users-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Help: <mailto:libvirt-users-request-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/libvirt-users>,
	<mailto:libvirt-users-request-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org?subject=subscribe>
Sender: libvirt-users-bounces-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Errors-To: libvirt-users-bounces-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Laine Stump <laine-k/Ak44NBdeXYtjvyW6yDsg@public.gmane.org>
Cc: libvirt-users-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, netfilter-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

21.03.2013 0:41, Laine Stump wrote:
[...]
>> -        !!(info->invert_flags&  XT_CONNTRACK_DIRECTION))
>> +        !(info->invert_flags&  XT_CONNTRACK_DIRECTION))
>>           return false;
>>
>>       if (info->match_flags&  XT_CONNTRACK_ORIGSRC)
>>
>> So apparently, netfilter's behaviour was indeed reversed at some
>> point, therefore libvirt stopped working properly.
>
> To save me the trouble, can you point me at a copy of the patch so I can
> read the commit message?

Maybe this
http://comments.gmane.org/gmane.comp.security.firewalls.netfilter.devel/38602
and this
http://git.opencores.org/?a=commit&p=linux&h=96120d86fe302c006259baee9061eea9e1b9e486
will be of some use.

>
> That seems a very bad thing to do :-/
>
>>
>> I'd guess libvirt needs to be adapted then? Is it a known issue or
>> should I fill in bugreport at Novell/Red Hat?
>
> I suppose it needs to be adapted, but how are we supposed to know which
> way to go? Some magic number of kernel version?

Yeah, makes me wonder.
Anyway, I've filed a bugreport at Novell (with a trivial patch proposed, 
although not taking into account possible "older" kernels hanging around 
with "historical" behaviour)

https://bugzilla.novell.com/show_bug.cgi?id=810611

Nikolai

>
> Bah. (This is the 2nd issue this week caused by a change in kernel ABI,
> so I'm not in a good mood...)
>
> _______________________________________________
> libvirt-users mailing list
> libvirt-users-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
> https://www.redhat.com/mailman/listinfo/libvirt-users
>
>
