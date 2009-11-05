From: "JR" <jdnromao@gmail.com>
Subject: Re: HTTP Access Blocked After iptables Update
Date: Thu, 5 Nov 2009 03:14:22 +0100
Message-ID: <C253675512EA44DD8B8C5161C85CE256@RomoPC>
References: <9A16A4503EA74DCAAF2C8A53A0DBF60F@RomoPC> <200911032206.18489.fakessh@fakessh.eu> <C387A75055774404B36410B61AF40D41@RomoPC> <4AF15D02.1080201@gmail.com>
Reply-To: "JR" <jdnromao@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:reply-to:from:to
         :cc:references:in-reply-to:subject:date:organization:mime-version
         :content-type:content-transfer-encoding:x-priority:x-msmail-priority
         :importance:x-mailer:x-mimeole;
        bh=s3IDo+2bECH01xBxCWu3/0PN+AyEpZeJ468p8dvALBg=;
        b=MILvynIoaFDCXQ9w3f+dnUO5X/QRbp65Yy0xeNTu3MIO035tcUAsXM+qeEkYT68YWg
         X6DOJdIVpHU80//QGCT8reI3u7UdNTGdpXW3TeTOIDbquTtnoE17aS2neYR7mLJGBxFK
         LqYCV9A6xBjhT/3C4m45YGvpaCfnuqUksIXvE=
In-Reply-To: <4AF15D02.1080201@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Saikiran Madugula <hummerbliss@gmail.com>
Cc: fakessh@fakessh.eu, netfilter@vger.kernel.org

One more thing, I have APF firewall.

Probaly is related to it...

Here is my iptables-config file:

# Load additional iptables modules (nat helpers)
#   Default: -none-
# Space separated list of nat helpers (e.g. 'ip_nat_ftp ip_nat_irc'), which
# are loaded after the firewall rules are applied. Options for the helpers 
are
# stored in /etc/modprobe.conf.
IPTABLES_MODULES="ip_conntrack_netbios_ns"

# Unload modules on restart and stop
#   Value: yes|no,  default: yes
# This option has to be 'yes' to get to a sane state for a firewall
# restart or stop. Only set to 'no' if there are problems unloading 
netfilter
# modules.
IPTABLES_MODULES_UNLOAD="yes"

# Save current firewall rules on stop.
#   Value: yes|no,  default: no
# Saves all firewall rules to /etc/sysconfig/iptables if firewall gets 
stopped
# (e.g. on system shutdown).
IPTABLES_SAVE_ON_STOP="no"

# Save current firewall rules on restart.
#   Value: yes|no,  default: no
# Saves all firewall rules to /etc/sysconfig/iptables if firewall gets
# restarted.
IPTABLES_SAVE_ON_RESTART="no"

# Save (and restore) rule and chain counter.
#   Value: yes|no,  default: no
# Save counters for rules and chains to /etc/sysconfig/iptables if
# 'service iptables save' is called or on stop or restart if SAVE_ON_STOP or
# SAVE_ON_RESTART is enabled.
IPTABLES_SAVE_COUNTER="no"

# Numeric status output
#   Value: yes|no,  default: yes
# Print IP addresses and port numbers in numeric format in the status 
output.
IPTABLES_STATUS_NUMERIC="yes"


# Verbose status output
#   Value: yes|no,  default: yes
# Print info about the number of packets and bytes plus the "input-" and
# "outputdevice" in the status output.
IPTABLES_STATUS_VERBOSE="no"

# Status output with numbered lines
#   Value: yes|no,  default: yes
# Print a counter/number for every rule in the status output.
IPTABLES_STATUS_LINENUMBERS="yes"

Any ideas?

Many thanks in advance.



--------------------------------------------------
From: "Saikiran Madugula" <hummerbliss@gmail.com>
Sent: Wednesday, November 04, 2009 11:52 AM
To: "JR" <jdnromao@gmail.com>
Cc: <fakessh@fakessh.eu>; <netfilter@vger.kernel.org>
Subject: Re: HTTP Access Blocked After iptables Update

> JR wrote:
>> Hello again.
>>
>> Can someone please help me on this?
>>
>> After server reboot all sites are on, and iptables is running. However if 
>> I
>> restart iptables (service iptables restart) all sites become unavailable.
>>
>> And in "top", (after the iptables restart) all I see is root processes.
>> I've
>> updated kernel, may be related to it?
>>
>> What can be the cause?
>>
>> Any help will be very appreciated!! Thank you!
>>
> Shot in the dark, when you do iptables restart does it do iptables-save 
> and
> iptables-restore ? Check in /etc/init.d/iptables. 

