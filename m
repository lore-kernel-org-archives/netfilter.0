From: Muhammad Faisal <faisalusuf@gmail.com>
Subject: Re: Ulogd and conntrack issues
Date: Tue, 14 Mar 2017 23:44:24 +0500
Message-ID: <CAAzdDtPnssaJx40Za2xyshjiShwReqouvkKKZr2VLGdbtYoKEA@mail.gmail.com>
References: <CACmTqUmdOmY7jdr3eg6D17bPjipdc1bRrd6K4A6Z5n1_4i4d9g@mail.gmail.com>
 <CAAzdDtMMVjuKkH51GTUD6RdpAkGTP36huXOm4v_KB2JNX8+dTw@mail.gmail.com> <CACmTqUmG9tVd2T7E0YWt+idBMXp4mn-ZYJAZ2L0fYFJz8SEH2Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=6CoWXuxOO0O61D/OmsblWM/MD7Pz39775KMXQPxnQ1s=;
        b=L3hd7tHdFDxqdEggxR138GFCLA06nbhreJl9Y6T5BB8JOocbfTRLp6doM1lbRwefXk
         3uRCuaBA0e7O012XqDY6vjSt/I0isDJ+6WGQp5SHquES66ZvNOzQ2lMAn3BN/f/Gy7TI
         LftkU0V7sfJcBSiogQ4ErlNCeEVgSvcscgG8p2bIvudYUDM0/CqifNKqto3lncdUGdiY
         KW8DcPkFBPLrjdm63Rq7bOIjskR10P6NVKLiO48FHGZJHnnzf1q2hL0BZoZQfq2A0dx5
         PfFb02JADT/e6oDYy2RfSS7JrH9a/+K9hrIRjCn4Cxk3+rhvhGIOblJTwUj+mnr1Rykk
         PXrQ==
In-Reply-To: <CACmTqUmG9tVd2T7E0YWt+idBMXp4mn-ZYJAZ2L0fYFJz8SEH2Q@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: V Kurien <kurien.varugis@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,
Strange though. What if you run conntrack -E ? Pls try the basic
config first to see if logging works:

Stop ulogd service and try the below config:

Config Example

########ulogd.conf##########
# logfile for status messages
logfile="/var/log/ulogd/ulogd.log"

# loglevel: debug(1), info(3), notice(5), error(7) or fatal(8)
loglevel=1
rmem=131071
bufsize=150000

#[Modules]
plugin="/usr/usr/local/lib/ulogd/ulogd_inppkt_NFLOG.so"
plugin="/usr/local/lib/ulogd/ulogd_inppkt_ULOG.so"
plugin="/usr/local/lib/ulogd/ulogd_inpflow_NFCT.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_IFINDEX.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_IP2STR.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_IP2BIN.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_PRINTPKT.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_HWHDR.so"
plugin="/usr/local/lib/ulogd/ulogd_filter_PRINTFLOW.so"
plugin="/usr/local/lib/ulogd/ulogd_output_LOGEMU.so"
plugin="/usr/local/lib/ulogd/ulogd_output_SYSLOG.so"
plugin="/usr/local/lib/ulogd/ulogd_output_GPRINT.so"
plugin="/usr/local/lib/ulogd/ulogd_raw2packet_BASE.so"
plugin="/usr/local/lib/ulogd/ulogd_inpflow_NFACCT.so"

# this is a stack for flow-based logging via LOGEMU
stack=ct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU

# this is a stack for flow-based logging via GPRINT
stack=ct1:NFCT,gp1:GPRINT


[ct1]
hash_enable=0
event_mask=0x00000001

[emu1]
file="/var/log/ulogd/ulogd_syslogemu.log"
sync=1

[gp1]
file="/var/log/ulogd/ulogd_gprint.log"
sync=1
timestamp=1

Start the ulogd service and tail ulogd.log if any error while loading
modules? The logs should be recorded to the ulog_syslogemu.log or
ulogd_gprint.log ? These are working example from my test system.

Cheers
Faisal
Best Regards,
Muhammad Faisal

Disclaimer:
Information in this e-mail and attachments is confidential and may be
legally privileged. Only intended recipients are authorized to use it.
If you have received this message in error, please delete it and all
copies of the message from your system and notify the sender
immediately by return e-mail. I'm neither liable for incomplete
transmission of the information in this communication nor for damage
caused by any virus transmitted through this e-mail.



On Tue, Mar 14, 2017 at 3:29 AM, V Kurien <kurien.varugis@gmail.com> wrote:
> Thanks Muhammad
> The ulogd2 modules are all loading without error. What is confusing to
> me is that I am seeing flow entries in conntrack but nothing out of
> ulogd2. I am running on a host with bridged mode and trying to track
> VM to VM flows, so I am not sure if that has something to do with it.
> However since the output of conntrack -L makes sense, I just don't
> understand why ulogd2 doesn't print the same information.
>
> On Mon, Mar 13, 2017 at 11:39 AM, Muhammad Faisal <faisalusuf@gmail.com> wrote:
>> When starting ulogd2, all the modules are loading without error? If you have
>> flow entries as shown in conntrack -L output ulogd2 should print the flows.
>>
>>
>> On Mar 13, 2017 23:09, "V Kurien" <kurien.varugis@gmail.com> wrote:
>>>
>>> Hi guys,
>>> I've been trying to get conntrack logging working with ulogd2 on a
>>> Ubuntu 4.4.0-59 generic kernel with no avail by following instructions
>>> gleaned from google searches. I'm hoping that someone here can set me
>>> on the right path:
>>>
>>> Here is what I have done:
>>>
>>> a) modprobe'd: nf_conntrack_ipv4, nf_conntrack_ipv6, modprobe
>>> nf_conntrack_netlink,xt_connmark, xt_NFLOG,xt_conntrack
>>> b) Iptables rules: -A INPUT -p tcp -j CONNMARK --set-xmark 0x10/0x10,
>>> -A OUTPUT -p tcp -j CONNMARK --set-xmark 0x10/0x10
>>> c) The stack section of ulogd.conf looks like:
>>> stack=log:NFCT,mark:MARK,ip2str:IP2STR,print:PRINTFLOW,out:GPRINT
>>>
>>> Where the sections here look like:
>>> [log]
>>> accept_proto_filter=tcp
>>> [mark]
>>> mark=0x10
>>> mask=0x10
>>> [out]
>>> file="/var/log/ulog/ulogd_tcp.log"
>>> sync=1
>>>
>>>
>>> However I get nothing at all in the log even though there are flows
>>> transitioning this host:
>>>
>>> conntrack -L|grep tcp
>>> conntrack v1.4.3 (conntrack-tools): 47 flow entries have been shown.
>>> tcp      6 431999 ESTABLISHED src=10.0.100.248 dst=10.0.33.244
>>> sport=51890 dport=6666 src=10.0.33.244 dst=10.0.100.248 sport=6666
>>> dport=51890 [ASSURED] mark=16 use=1
>>> tcp      6 431999 ESTABLISHED src=10.0.100.248 dst=10.0.138.44
>>> sport=22 dport=56405 src=10.0.138.44 dst=10.0.100.248 sport=56405
>>> dport=22 [ASSURED] mark=16 use=1
>>> tcp      6 431985 ESTABLISHED src=10.0.100.248 dst=173.225.26.234
>>> sport=52066 dport=443 src=173.225.26.234 dst=10.0.100.248 sport=443
>>> dport=52066 [ASSURED] mark=16 use=1
>>>
>>> What could I be doing wrong? Are there better ways to do this? Note
>>> that ULOG has been removed in recent kernels.
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
