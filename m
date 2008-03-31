From: "Eljas Alakulppi" <Buzer@buzer.net>
Subject: Re: possible bug in call to libipt_state
Date: Mon, 31 Mar 2008 23:46:12 +0300
Message-ID: <op.t8wenaw7rtqp7s@hagumi.azt>
References: <filter-4B6EC6.16121031032008@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <filter-4B6EC6.16121031032008@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Steven Stromer <filter@stevenstromer.com>, netfilter@vger.kernel.org

Hey.

The reason might be that there is something like "---state" (note 3 -  
instead of normal 2). You should start looking from /etc/init.d/iptables  
(or firewall or something similar). A quick workaround could be to create  
a symbolic link for libipt_-state.so (ln -sf libipt_state.so  
/lib64/iptables/libipt_-state.so) if it's something that needs to be fixed  
now and the cause remains unclear (which I doubt).

Steven Stromer <filter@stevenstromer.com> kirjoitti Mon, 31 Mar 2008  
23:12:10 +0300:

> Hi,
>
> On FC8, kernel 2.6.24.3-50.fc8 (and earlier, actually), iptables v1.3.8,  
> I am receiving the following error when trying to load rules from a  
> shell script:
>
> Couldn't load match '-state':/lib64/iptables/libipt_-state.so: cannot  
> open shared object file: No such file or directory
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
> the source of the call, and could also confirm that this really is a  
> bug, I'll happily report it!
>
> Thanks,
> Steven Stromer
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


