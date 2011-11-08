From: sim@netmess.org
Subject: What is the maximum number of iptables rules on 32Bit 2.6 kernel?
Date: Tue, 8 Nov 2011 09:26:05 +0100
Message-ID: <5805501fd74436397a85b5e1723882dc.squirrel@nmvrt01.netsim.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear All,

I have a strange problem when trying to insert more than ca. 25561 rules
with iptables (according to iptables -nvL | wc)
My setup is, that I insert the first 25500 rules with iptables-restore
command, the others with the normal iptables command.
The machine is a quite up to date server with 28 NICs and 6GB of RAM,
running Kernel 2.6.34.10 (32Bit).

Even something simple like

# iptables -I INPUT -j ACCEPT
iptables: Memory allocation problem.

fails.

What memory does it use?

Does anyboy have an idea? How can I get more useful infos about my Memory
usage?

I wrote a little script that parses /proc/vmalloc (see at the end).

If I run it against all entries with "xt_alloc" in it (which seems to be
the netfilter stuff) , it reports only 284M used kernel memory, while I
have 512M kernel memory.

------------------------ 8< ----------------------

All entries in /proc/vmalloc matching against a grep with xt_alloc
are eating up 284 MB of kernel Memory.
The Kernel memory statistics are:

VmallocTotal:     524288 kB
VmallocUsed:      300868 kB
VmallocChunk:     195832 kB

------------------------ 8< ----------------------

What's the issue?

Thanks, Simon


The script:

# cat /root/bin/memanalyze
#!/bin/bash

grep $1 /proc/vmallocinfo | awk '{print $2}' > /var/tmp/memanalyze

value=0
while read var; do
	value=`expr $value + $var`;
done < /var/tmp/memanalyze

mvalue=$(echo "$value / 1024 / 1024" | bc)

echo "All entries in /proc/vmalloc matching against a grep with $1"
echo "are eating up $mvalue MB of kernel Memory."
echo "The Kernel memory statistics are:"
echo
cat /proc/meminfo | grep malloc


