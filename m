From: Muhammad Faisal <faisalusuf@gmail.com>
Subject: Re: Ulogd2 messages stopped [Cent OS 6.8] [Resolved]
Date: Fri, 17 Mar 2017 01:09:48 +0500
Message-ID: <CAAzdDtP1BRWnRvsxbhDtmm+sRgk=di+omoYZ9myJUqXOYgwSRQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=0hsvZXEe4VRuS9F911Wcr6b6IYHPefI7mtIvliJmres=;
        b=ph+/ZO5Lm5KJeNTUR2+6cKH0JXeRpCz+2H19xZA4cVuDVM0WeI9tvVGqkvxlrn4rXM
         UY3JdmIFQ7IspI6JH9V4E3GASt7znpJmbQfZAP8nc+Myf7Qs6kEEVXo8Le6UXkGarYcY
         tfUcnYF6pIl69xY+gLOU2ymnQi8qW5H6YOVNaI+W03W7qv0EKLywk12vCfT0p+crf/0y
         XEUfNlveiomecuSnd+IeMcU3BxS497Cqtbedvw+e2G6X6uyHNsOqfGHUFhAovXq3mLqD
         6jqFG1ssJ76DBMEKuTlNsTfu0i/nmcrpsbuLRnjP8LNCdJwpvdH3NwHtk5zbBgJ7mqd8
         FzUQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: V Kurien <kurien.varugis@gmail.com>
Cc: Eric Leblond <eric@regit.org>, netfilter@vger.kernel.org

Hi All,
The conntrack event logging may interrupt upon system reboot due to a
kernel module "nf_conntrack_netlink" not loading at boot time (I could
not figure out why this happened though). Upon running conntrack -L
command which load the required kernel module hence the CT events
start appearing in syslog or in the log file.

Solution:
Load the module at system startup using rc.module as follows"

# echo modprobe nf_conntrack_netlink >> /etc/rc.modules
# chmod +x /etc/rc.modules
Now reboot the system and check the logs should start appearing upon reboot.
I have tested it and working fine.

Special thanks to Eric and Kurien for providing a direction to sort
out the issue.

Thanks,
F.


On Fri, Mar 17, 2017 at 12:00 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
> Its not a systemd system. Here is the difference
>
> After fresh Reboot (No CT logs)
> [root@wc01 ~]# lsmod
> Module                  Size  Used by
> nfnetlink              14606  1
>
> After running conntrack -L Command now the nfnetlink shows "used by"
> nf_conntrack_netlink:
>
> [root@wc01 ~]# lsmod
> Module                  Size  Used by
> nf_conntrack_netlink    36271  0
> nfnetlink              14606  2 nf_conntrack_netlink
>
>
>
> Best Regards,
> Muhammad Faisal
>
>
> On Thu, Mar 16, 2017 at 11:52 PM, V Kurien <kurien.varugis@gmail.com> wrote:
>> Not sure I get it, which kmod is missing? That is why I asked you to
>> difference the output of lsmod. Is this a systemd system or upstart?
>>
>> On Thu, Mar 16, 2017 at 11:33 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
>>> Hi Kurien,
>>> What i did i put conntrack -L command in rc.local in order to load the
>>> module but this step did not resolve the issue. From below you can see
>>>
>>> Mar 17 00:23:34 wc01 kernel: Netfilter messages via NETLINK v0.30.
>>> (This is resulted due to conntrack -L command in rc.local but still no
>>> logs upon reboot)
>>>
>>> Then I ran the conntrack -L command again manually after system reboot
>>> then the below message appeared followed by conntrack events in syslog
>>> messages started:
>>>
>>> Mar 17 00:26:01 wc01 kernel: ctnetlink v0.93: registering with
>>> nfnetlink. (this module registered upon running the conntrack -L
>>> again)
>>>
>>> Clearly the required kernel module is not being loaded after a system
>>> restart. How to resolve this issue?
>>> Best Regards,
>>> Muhammad Faisal
>>>
>>> Disclaimer:
>>> Information in this e-mail and attachments is confidential and may be
>>> legally privileged. Only intended recipients are authorized to use it.
>>> If you have received this message in error, please delete it and all
>>> copies of the message from your system and notify the sender
>>> immediately by return e-mail. I'm neither liable for incomplete
>>> transmission of the information in this communication nor for damage
>>> caused by any virus transmitted through this e-mail.
>>>
>>>
>>>
>>> On Thu, Mar 16, 2017 at 11:16 PM, V Kurien <kurien.varugis@gmail.com> wrote:
>>>> I'd do the following:
>>>> a) Run lsmod when the system is not showing messages.
>>>> b) Run lsmod after running conntrack -L
>>>>
>>>>
>>>> On Thu, Mar 16, 2017 at 10:32 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
>>>>> Hello,
>>>>> Any suggestion on this?
>>>>> Best Regards,
>>>>> Muhammad Faisal
>>>>>
>>>>> Disclaimer:
>>>>> Information in this e-mail and attachments is confidential and may be
>>>>> legally privileged. Only intended recipients are authorized to use it.
>>>>> If you have received this message in error, please delete it and all
>>>>> copies of the message from your system and notify the sender
>>>>> immediately by return e-mail. I'm neither liable for incomplete
>>>>> transmission of the information in this communication nor for damage
>>>>> caused by any virus transmitted through this e-mail.
>>>>>
>>>>>
>>>>>
>>>>> On Thu, Mar 16, 2017 at 12:01 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
>>>>>> Hello,
>>>>>> Im able to reproduce the problem. The messages stopped upon system
>>>>>> reboot. The logs starts when conntrack -L command is executed. The
>>>>>> interesting fact is the following message appeared when I ran the
>>>>>> conntrack -L command. This mean NETLINK things is not getting started
>>>>>> unless conntrack command is ran by the user.
>>>>>>
>>>>>> Mar 16 00:51:53 wc01 kernel: Netfilter messages via NETLINK v0.30.
>>>>>>
>>>>>> What is the solution ?
>>>>>> Best Regards,
>>>>>> Muhammad Faisal
>>>>>>
>>>>>> Disclaimer:
>>>>>> Information in this e-mail and attachments is confidential and may be
>>>>>> legally privileged. Only intended recipients are authorized to use it.
>>>>>> If you have received this message in error, please delete it and all
>>>>>> copies of the message from your system and notify the sender
>>>>>> immediately by return e-mail. I'm neither liable for incomplete
>>>>>> transmission of the information in this communication nor for damage
>>>>>> caused by any virus transmitted through this e-mail.
>>>>>>
>>>>>>
>>>>>>
>>>>>> On Tue, Mar 14, 2017 at 11:48 PM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
>>>>>>> Hi Eric,
>>>>>>>
>>>>>>>> This looks rather strange. Could you have a task running in background
>>>>>>>> and removing conntrack related kernel module ?
>>>>>>>
>>>>>>> Pardon, I couldnt get what you mean? Please elaborate
>>>>>>>
>>>>>>> Also the Ravin response is also witnessing there is some problem for
>>>>>>> which conntrack -L command is requried to run periodically. Strange
>>>>>>> though!
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On Tue, Mar 14, 2017 at 1:02 PM, Eric Leblond <eric@regit.org> wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> On Tue, 2017-03-14 at 10:05 +0500, Muhammad Faisal wrote:
>>>>>>>>> Hello,
>>>>>>>>> Anyone experienced this behavior with ulogd2?
>>>>>>>>>
>>>>>>>>> We have setup nat server with src-nat event logging using ulogd2.
>>>>>>>>> After running for couple of day all of sudden the ulogd2 messages
>>>>>>>>> stopped. There was nothing related to connection events.
>>>>>>>>>
>>>>>>>>> When i run conntrack -L command and then conntrack -E command the
>>>>>>>>> logs
>>>>>>>>> starts appearing.
>>>>>>>>>
>>>>>>>>> Please help me out i did not find any clue why this is happening.
>>>>>>>>
>>>>>>>> This looks rather strange. Could you have a task running in background
>>>>>>>> and removing conntrack related kernel module ?
>>>>>>>>
>>>>>>>> BR,
>>>>>>>>
>>>>>>>>>
>>>>>>>>> Thanks
>>>>>>>>> Best Regards,
>>>>>>>>> Muhammad Faisal
>>>>>>>>>
>>>>>>>>> Disclaimer:
>>>>>>>>> Information in this e-mail and attachments is confidential and may be
>>>>>>>>> legally privileged. Only intended recipients are authorized to use
>>>>>>>>> it.
>>>>>>>>> If you have received this message in error, please delete it and all
>>>>>>>>> copies of the message from your system and notify the sender
>>>>>>>>> immediately by return e-mail. I'm neither liable for incomplete
>>>>>>>>> transmission of the information in this communication nor for damage
>>>>>>>>> caused by any virus transmitted through this e-mail.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On Mon, Mar 13, 2017 at 8:38 PM, Muhammad Faisal <faisalusuf@gmail.co
>>>>>>>>> m> wrote:
>>>>>>>>> > Hello,
>>>>>>>>> > We have setup nat server with src-nat event logging using ulogd2.
>>>>>>>>> > After running for couple of day all of sudden the ulogd2 messages
>>>>>>>>> > stopped. There was nothing related to connection events.
>>>>>>>>> >
>>>>>>>>> > When i run conntrack -L command and then conntrack -E command the
>>>>>>>>> > logs
>>>>>>>>> > starts appearing.
>>>>>>>>> >
>>>>>>>>> > Please help me out i did not find any clue why this is happening.
>>>>>>>>> >
>>>>>>>>> > Cent OS 6
>>>>>>>>> > Conntrack v1.4
>>>>>>>>> >
>>>>>>>>> > [root@wc01 ~]# ulogd -V
>>>>>>>>> > ulogd Version 2.0.5
>>>>>>>>> >
>>>>>>>>> > Installed Packages
>>>>>>>>> > Name        : libnet
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.1.6
>>>>>>>>> > Release     : 7.el6
>>>>>>>>> > Size        : 141 k
>>>>>>>>> > Repo        : installed
>>>>>>>>> > From repo   : epel
>>>>>>>>> >
>>>>>>>>> > Available Packages
>>>>>>>>> > Name        : libnet
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.1.6
>>>>>>>>> > Release     : 7.el6
>>>>>>>>> > Size        : 59 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnet-devel
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.1.6
>>>>>>>>> > Release     : 7.el6
>>>>>>>>> > Size        : 181 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnet-devel
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.1.6
>>>>>>>>> > Release     : 7.el6
>>>>>>>>> > Size        : 181 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnet10
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.0.2a
>>>>>>>>> > Release     : 18.el6
>>>>>>>>> > Size        : 39 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnet10
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.0.2a
>>>>>>>>> > Release     : 18.el6
>>>>>>>>> > Size        : 37 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnet10-devel
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.0.2a
>>>>>>>>> > Release     : 18.el6
>>>>>>>>> > Size        : 21 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnet10-devel
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.0.2a
>>>>>>>>> > Release     : 18.el6
>>>>>>>>> > Size        : 21 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_acct
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.0.2
>>>>>>>>> > Release     : 1.el6
>>>>>>>>> > Size        : 18 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_acct
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.0.2
>>>>>>>>> > Release     : 1.el6
>>>>>>>>> > Size        : 18 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_acct-devel
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.0.2
>>>>>>>>> > Release     : 1.el6
>>>>>>>>> > Size        : 22 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_acct-devel
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.0.2
>>>>>>>>> > Release     : 1.el6
>>>>>>>>> > Size        : 22 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_conntrack
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 0.0.100
>>>>>>>>> > Release     : 2.el6
>>>>>>>>> > Size        : 39 k
>>>>>>>>> > Repo        : base
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_conntrack
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 0.0.100
>>>>>>>>> > Release     : 2.el6
>>>>>>>>> > Size        : 38 k
>>>>>>>>> > Repo        : base
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_conntrack-devel
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 0.0.100
>>>>>>>>> > Release     : 2.el6
>>>>>>>>> > Size        : 14 k
>>>>>>>>> > Repo        : base
>>>>>>>>> >
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_conntrack-devel
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 0.0.100
>>>>>>>>> > Release     : 2.el6
>>>>>>>>> > Size        : 14 k
>>>>>>>>> > Repo        : base
>>>>>>>>> >
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_cthelper
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.0.0
>>>>>>>>> > Release     : 3.el6
>>>>>>>>> > Size        : 17 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_cthelper
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.0.0
>>>>>>>>> > Release     : 3.el6
>>>>>>>>> > Size        : 16 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_cthelper-devel
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.0.0
>>>>>>>>> > Release     : 3.el6
>>>>>>>>> > Size        : 14 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_cthelper-devel
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.0.0
>>>>>>>>> > Release     : 3.el6
>>>>>>>>> > Size        : 14 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_log
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.0.1
>>>>>>>>> > Release     : 7.el6
>>>>>>>>> > Size        : 21 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_log
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.0.1
>>>>>>>>> > Release     : 7.el6
>>>>>>>>> > Size        : 21 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_log-devel
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.0.1
>>>>>>>>> > Release     : 7.el6
>>>>>>>>> > Size        : 8.9 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_log-devel
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.0.1
>>>>>>>>> > Release     : 7.el6
>>>>>>>>> > Size        : 8.9 k
>>>>>>>>> > Repo        : epel
>>>>>>>>> >
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_queue
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.0.1
>>>>>>>>> > Release     : 3.el6
>>>>>>>>> > Size        : 18 k
>>>>>>>>> > Repo        : base
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_queue
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.0.1
>>>>>>>>> > Release     : 3.el6
>>>>>>>>> > Size        : 18 k
>>>>>>>>> > Repo        : base
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_queue-devel
>>>>>>>>> > Arch        : i686
>>>>>>>>> > Version     : 1.0.1
>>>>>>>>> > Release     : 3.el6
>>>>>>>>> > Size        : 8.4 k
>>>>>>>>> > Repo        : base
>>>>>>>>> >
>>>>>>>>> > Name        : libnetfilter_queue-devel
>>>>>>>>> > Arch        : x86_64
>>>>>>>>> > Version     : 1.0.1
>>>>>>>>> > Release     : 3.el6
>>>>>>>>> > Size        : 8.4 k
>>>>>>>>> > Repo        : base
>>>>>>>>> > Best Regards,
>>>>>>>>> > Muhammad Faisal
>>>>>>>>> >
>>>>>>>>> > Disclaimer:
>>>>>>>>> > Information in this e-mail and attachments is confidential and may
>>>>>>>>> > be
>>>>>>>>> > legally privileged. Only intended recipients are authorized to use
>>>>>>>>> > it.
>>>>>>>>> > If you have received this message in error, please delete it and
>>>>>>>>> > all
>>>>>>>>> > copies of the message from your system and notify the sender
>>>>>>>>> > immediately by return e-mail. I'm neither liable for incomplete
>>>>>>>>> > transmission of the information in this communication nor for
>>>>>>>>> > damage
>>>>>>>>> > caused by any virus transmitted through this e-mail.
>>>>>>>>>
>>>>>>>>> --
>>>>>>>>> To unsubscribe from this list: send the line "unsubscribe netfilter"
>>>>>>>>> in
>>>>>>>>> the body of a message to majordomo@vger.kernel.org
>>>>>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>>>>>> --
>>>>>>>> Eric Leblond <eric@regit.org>
>>>>> --
>>>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>>>> the body of a message to majordomo@vger.kernel.org
>>>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
