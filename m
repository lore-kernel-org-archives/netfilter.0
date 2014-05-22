From: ebiederm@xmission.com (Eric W. Biederman)
Subject: Re: Netfilter owner matching inside user namespace
Date: Thu, 22 May 2014 16:03:02 -0700
Message-ID: <87k39dbemx.fsf@x220.int.ebiederm.org>
References: <537B7FF6.9050103@elastichosts.com>
	<877g5eg7wy.fsf@x220.int.ebiederm.org> <537D706D.4010303@1h.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <537D706D.4010303@1h.com> (Marian Marinov's message of "Thu, 22
	May 2014 06:35:09 +0300")
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marian Marinov <mm@1h.com>
Cc: Alin Dobre <alin.dobre@elastichosts.com>, containers@lists.linux-foundation.org, netfilter@vger.kernel.org, Jan Engelhardt <jengelh@medozas.de>

Marian Marinov <mm@1h.com> writes:

> On 05/22/2014 12:04 AM, Eric W. Biederman wrote:
>> Alin Dobre <alin.dobre@elastichosts.com> writes:
>> 
>>> Hello,
>>> 
>>> I am trying to run the following command inside an image using user namespaces via contain [1], a very simplistic
>>> implementation of linux containers: contain /path/to/image /bin/bash
>>> 
>>> Although the host kernel does have support for owner matching and it works with no errors, running the following
>>> iptables command inside the container: iptables -A OUTPUT -m owner --uid-owner root -j ACCEPT returns the error
>>> "Invalid argument".
>>> 
>>> The last commit for the netfilter xt_owner module is exactly Eric's basic support for user namespaces, but there
>>> might be some other recent changes either in the namespaces area or netfilter in general, which brought the
>>> module in an unusable state inside containers - at least for the above command usage.
>> 
>> The code says.
>> 
>> static int owner_check(const struct xt_mtchk_param *par) { struct xt_owner_match_info *info = par->matchinfo;
>> 
>> /* For now only allow adding matches from the initial user namespace */ if ((info->match &
>> (XT_OWNER_UID|XT_OWNER_GID)) && (current_user_ns() != &init_user_ns)) return -EINVAL; return 0; }
>> 
>> So it is not expected to work in user namespaces by design.
>> 
>>> I can try to send the image I used for testing to anyone who desires, but a handy shortcut should be "deboostrap
>>> trusty /path/to/image" and "chroot /path/to/image apt-get install iptables".
>>> 
>>> The host kernel is 3.14.4, iptables version on the host is 1.4.15 and inside the Ubuntu container is 1.4.18. I
>>> have tried with Ubuntu 13.* and Ubuntu 14.04, but I don't think the userspace has anything to do with this.
>>> 
>>> I can provide with any additional information needed.
>>> 
>>> Any insights on this?
>> 
>> As I recall this code largely matches directly on the values passed in from userspace.  Which in this case is a
>> problem because I would like to store kuids and kgids in the data structures and compare those.
>> 
>> I believe it would take some careful refactoring to allow massaging the data from the form the user supplied to
>> something more appropriate before we perform the match.
>> 
>> That is making this work is tricky so I punted and did not support it from inside a user namespace.
>> 
>
> Erik I have proposition about that... Please, tell me if I'm on the right track:
>
> diff --git a/net/netfilter/xt_owner.c b/net/netfilter/xt_owner.c
> index ca2e577..3682825 100644
> --- a/net/netfilter/xt_owner.c
> +++ b/net/netfilter/xt_owner.c
> @@ -33,6 +27,7 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
>  {
>         const struct xt_owner_match_info *info = par->matchinfo;
>         const struct file *filp;
> + struct user_namespace *ns = get_current_cred()->user_ns;
>
>         if (skb->sk == NULL || skb->sk->sk_socket == NULL)
>                 return (info->match ^ info->invert) == 0;
> @@ -49,8 +44,8 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
>                        (XT_OWNER_UID | XT_OWNER_GID)) == 0;
>
>         if (info->match & XT_OWNER_UID) {
> -           kuid_t uid_min = make_kuid(&init_user_ns, info->uid_min);
> -           kuid_t uid_max = make_kuid(&init_user_ns, info->uid_max);
> +         kuid_t uid_min = make_kuid(ns, info->uid_min);
> +         kuid_t uid_max = make_kuid(ns, info->uid_max);
>                 if ((uid_gte(filp->f_cred->fsuid, uid_min) &&
>                      uid_lte(filp->f_cred->fsuid, uid_max)) ^
>                     !(info->invert & XT_OWNER_UID))
> @@ -58,8 +53,8 @@ owner_mt(const struct sk_buff *skb, struct xt_action_param *par)
>         }
>
>         if (info->match & XT_OWNER_GID) {
> -           kgid_t gid_min = make_kgid(&init_user_ns, info->gid_min);
> -           kgid_t gid_max = make_kgid(&init_user_ns, info->gid_max);
> +         kgid_t gid_min = make_kgid(ns, info->gid_min);
> +         kgid_t gid_max = make_kgid(ns, info->gid_max);
>                 if ((gid_gte(filp->f_cred->fsgid, gid_min) &&
>                      gid_lte(filp->f_cred->fsgid, gid_max)) ^
>                     !(info->invert & XT_OWNER_GID))
>
> If the process has its own user and network namespaces, are the above changes enough?
>
> Since the rule is added to its own network namespace is it still a
> problem?


As I read the code the netfilter match does not need to be and I would
be highly surprised if it were called in the context of any specific
user process.   Which means we can not rely on current.

Check comes close to being the right place to change things, but check
doesn't change the data, only validates it :(

Eric
