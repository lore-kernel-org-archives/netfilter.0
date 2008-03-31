From: "Ukeme Noah" <ukeme.noah@gmail.com>
Subject: Re:  possible bug in call to libipt_state
Date: Mon, 31 Mar 2008 16:44:33 -0400
Message-ID: <007801c89370$0848fb40$0600a8c0@windowsnxfi>
References: <filter-4B6EC6.16121031032008@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:from:to:references:subject:date:mime-version:content-type:content-transfer-encoding:x-priority:x-msmail-priority:x-mailer:x-mimeole;
        bh=jclBCt8BUGB50b7l6JGsloJvq9wsmMCBGu+A2B2qAE8=;
        b=APBb8jcYeKiFjbvV2+9wqkpSL9pDSvFsRXScSzTc9y08jd1OF5azTkdYirJzCaNxLRjaC8pK/+NJG2pcl0N93c6n6n8AQ2q1GhHISoseRnrl92bPVQC7ULm3nQnysHKm96BIqoHdVmd7bmV64j9K9sVvZ0tJU4E8sNYNftv9/ic=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@vger.kernel.org, Steven Stromer <filter@stevenstromer.com>

What steps did you follow to debug your script before this conclusion.

ukeme noah

----- Original Message ----- 
From: "Steven Stromer" <filter@stevenstromer.com>
To: <netfilter@vger.kernel.org>
Sent: Monday, March 31, 2008 4:12 PM
Subject: possible bug in call to libipt_state


> Hi,
>
> On FC8, kernel 2.6.24.3-50.fc8 (and earlier, actually), iptables v1.3.8, I 
> am receiving the following error when trying to load rules from a shell 
> script:
>
> Couldn't load match '-state':/lib64/iptables/libipt_-state.so: cannot open 
> shared object file: No such file or directory
>
> In fact, there is no such file or directory, because the call is being 
> incorrectly made to 'libipt_-state.so', instead of 'libipt_state.so':
>
> # ls -la /lib64/iptables | grep state
> -rwxr-xr-x 1 root root  6888 2007-11-05 12:08 libip6t_state.so
> -rwxr-xr-x 1 root root  6888 2007-11-05 12:08 libipt_state.so
>
> I am not at all certain whether this is a problem in the Fedora iptables 
> package, the kernel, or iptables itself. If anyone could help me locate 
> the source of the call, and could also confirm that this really is a bug, 
> I'll happily report it!
>
> Thanks,
> Steven Stromer
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html 

