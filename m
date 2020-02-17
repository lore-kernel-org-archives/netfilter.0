From: Alessandro Vesely <vesely@tana.it>
Subject: Re: Difficulties with ulog / NFCT
Date: Mon, 17 Feb 2020 19:01:00 +0100
Message-ID: <98ae7d6e-f9f5-477e-469a-7ea7182060db@tana.it>
References: <ef15f5cc-1fa3-fe40-3e5e-a463e3f95314@tana.it>
 <ee17e7ef-8e26-4062-5c2c-b666e9525d59@tana.it>
 <CAEzD07JoH=KN4z0hN+UXqPr3AJW6cc3maVwMRZUcahSkfL+8WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1581962461; bh=puQwzFY4aSD4dUQGi06IbhjL80PuddHjDhKi3yu387g=;
        l=3578; h=To:Cc:References:From:Date:In-Reply-To;
        b=CJy7jQ309EDl+9TDv2vyR8yuRRWH79Bbom9DG45B4UPegDkfaoYIhiWscWIA2aa1m
         ggU6ov3Te6QzJG1f5RrvTcrJgKgiw9cMkQiZrsudQo5USMz6idMw5chaGWvyIdYx4O
         TCEi6XD274LoSPUl7iISISuh3N66JfEinDpq1ocugILO2HVLr31+Qj/QxW5Kc
In-Reply-To: <CAEzD07JoH=KN4z0hN+UXqPr3AJW6cc3maVwMRZUcahSkfL+8WQ@mail.gmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Mon 17/Feb/2020 16:53:23 +0100 Anton Danilov wrote:
> Have you enabled the conntrack accounting and conntrack timestamps via sysctl?


Nope.  I don't need accounting, and I didn't know about timestamps.

Now I set nf_conntrack_timestamp=1 and I'm starting to get some non-NULL
timestamps.  Great!

In /proc/net/nf_conntrack I have delta-time=n, presumably secs.


Thank you
Ale

> On Mon, 17 Feb 2020 at 18:13, Alessandro Vesely <vesely@tana.it> wrote:
>>
>> Hi,
>>
>> Only the start timestamp is NULL, the end one looks fine.  I tried setting
>> hash_enable=0, it apparently didn't better nor worse the logging.
>>
>>
>> In /proc/net/nf_conntrack there is no timestamp, but port numbers seem good
>> (there is no port 32767).
>>
>>
>> What am I missing?
>>
>> Best
>> Ale
>>
>> On Sat 15/Feb/2020 17:03:19 +0100 Alessandro Vesely wrote:
>> > I've set up logging as follows, to get a history of TCP connections:
>> >
>> > # conntrack logging to MariaDB
>> > stack=ct1:NFCT,ip2str1:IP2STR,mysql1:MYSQL
>> >
>> > [ct1]
>> > accept_proto_filter=tcp # layer 4 proto of connections
>> > event_mask=0x00000004 # only listen to DESTROY events
>> >
>> > [mysql1]
>> > table="ct"
>> > reconnect=4
>> > connect_timeout=60
>> > procedure="INSERT"
>> > db="ulog"
>> > host="localhost"
>> > user="ulog"
>> > pass="*****"
>> > port=3306
>> >
>> >
>> > It doesn't work well.  For example, I get this:
>> >
>> > MariaDB [ulog]> SELECT FROM_UNIXTIME(flow_start_sec) AS start, flow_end_sec - flow_start_sec AS sec,
>> >> orig_ip_saddr_str AS src, orig_l4_sport AS sport, orig_ip_daddr_str, orig_l4_dport AS svc
>> >> FROM ct WHERE orig_ip_saddr_str = '66.110.216.209';
>> > +-------+------+----------------+-------+-------------------+------+
>> > | start | sec  | src            | sport | orig_ip_daddr_str | svc  |
>> > +-------+------+----------------+-------+-------------------+------+
>> > | NULL  | NULL | 66.110.216.209 | 32767 | 62.94.243.226     |  143 |
>> > | NULL  | NULL | 66.110.216.209 | 32767 | 62.94.243.226     |  143 |
>> > +-------+------+----------------+-------+-------------------+------+
>> > 2 rows in set (0.00 sec)
>> >
>> >
>> >
>> > flow_start_sec and flow_end_sec are both NULL, after several hours.  They seem to be non-NULL for outgoing connections and for connections coming from the internal network.  Even then, they don't seem to be accurate timings.
>> >
>> > The mail log for the IP above IP is as follows (the source port is always 32767):
>> >
>> > Feb 15 12:08:07 22 north imapd: LOGIN FAILED, user=sungjtrio@fragoline.it, ip=[66.110.216.209], port=[41204]
>> > Feb 15 12:08:16 23 north imapd: Disconnected, ip=[66.110.216.209], port=[41204], time=16
>> > Feb 15 12:08:47 23 north imapd: Connection, ip=[66.110.216.209], port=[45344]
>> > Feb 15 12:08:54 22 north imapd: LOGIN FAILED, user=sungjtrio@fragoline.it, ip=[66.110.216.209], port=[45344]
>> > Feb 15 12:09:06 23 north imapd: Disconnected, ip=[66.110.216.209], port=[45344], time=19
>> >
>> > Disconnections are likely caused by conntrack -D -s 66.110.216.209.  I'm reporting abusive login attempts at end-of-day, and I've been told to mention my server (target) address and port, 62.94.243.226:143 in this case.  Since the mail log doesn't mention that data, the idea is to find it in the NFCT log based on the time and source IP.
>> >
>> > Should I be running conntrackd?
>> > Should I play with socket buffer/ resync timeout/ backlog_oneshot_requests/ ring_buffer_size?
>> > Any other hint?
>> >
>> >
>> > TIA
>> > Ale
>> >
> 
> 
> 
