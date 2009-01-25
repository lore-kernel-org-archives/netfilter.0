From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Sun, 25 Jan 2009 11:51:44 +0100
Message-ID: <497C4440.7050809@netfilter.org>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4979BA72.50405@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: yoann.juet@univ-nantes.fr
Cc: netfilter@vger.kernel.org

Yoann Juet wrote:
>> That's another known problem of 0.9.6. Probably, you don't see EINVAL
>> but a message like "N entries can't be committed". I suggest you to
>> upgrade to latest. I'm about to release 0.9.10, using current would
>>make my life easier to provide you support.
> 
> Well, I installed conntrack-tools 0.9.9 and libnetfilter_conntrack
> 0.0.99 on the cluster. No more "delayed packet" message or another
> warning or error message. Unfortunately, I get the same result when the
> second failover is triggered. Packets are denied due to INVALID state.

When the entries are created or updated, the flag
IP_CT_TCP_FLAG_BE_LIBERAL is set so that the window checking are
skipped, you should not get those "ACK/SEQ is under/over window". I
don't have an answer for the problem that you're reporting at this
moment. I know that there are some bugs in the ctnetlink code of 2.6.26
that were fixed in the subsequent kernel releases, but I did not know
any that affected the internal TCP flags set/unset. As these stuff is
under development, I suggest you to use the latest Linux kernel, please
let me know if the problem persists.

> PS: the new configuration subblock "Filter from Kernelspace" in
> conntrackd.conf is not parsed correctly. I get an error message:
> 
> "Error parsing config file: line (190), symbol 'from': syntax error"
> 
> I have to delete it to make starting conntrackd.

Filter From Kernelspace {
         Protocol Accept {
                TCP
         }
         Address Ignore {
                IPv4_address 127.0.0.1 # loopback
         }
}

It works here fine. Error reporting in the parsing is not very precise
yet, probably the problem is not in Filter but before (something is
missing and the parser gets confused). Could you post your config file
to reproduce it? You can send it to me in private if you want.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
