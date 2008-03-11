From: Scott MacKay <scottmackay@yahoo.com>
Subject: Re: RHEL 4.5 + brigde + sample QUEUE app=panic
Date: Tue, 11 Mar 2008 12:18:23 -0700 (PDT)
Message-ID: <671872.8600.qm@web52403.mail.re2.yahoo.com>
References: <984706.6721.qm@web52412.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <984706.6721.qm@web52412.mail.re2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Related to this:
I got and rebuilt the ip_queue.c code and it seems to
be within the ipq_mangle_ipv4 code.  The top part does
not affect us since that is only for when size
changes.  I commented out the mangle call (so I was
still passing data down) and the system seemed to run
ok, just like data_len=0.

When I reenabled the memcpy and the ALTER flag change
it worked for a while but then locked up, the keyboard
lights flashing.

Note that this did not always/immediately cause a
crash but pretty close.  The last thing I could try is
a simple for loop on the incoming data to see if
accessing the data (like char c=payload[i] kind of
throwaway) is the issue.  If there are any thoughts on
the stuff sendmsg() sends to the ip_queue I would love
to know.  

-Scott


--- Scott MacKay <scottmackay@yahoo.com> wrote:

> Hi, I have a 64bit system, RHEL 4.5.
> I can get more details if needed.
> It has the modular ip_queue, netfilter headers,
> bridge
> control package and the like.
> For my queue program, I had to get the source for
> 1.2.11 (the version indicated in the rpm).
> 
> I compiled the sample QUEUE from the manpages.
> The 2 differences:
> 1.  I printf the indev and outdev
> 2.  my verdict returns the payload (m->data_len,
> m->payload) from the ipq_get_packet()) as in the end
> I
> want to mangle the packet (but do not in this
> example)
> 
> I added the hooks:
> 
> iptables -t mangle -A PREROUTING -i br0 -j QUEUE
> iptables -t mangle -A POSTROUTING -o br0 -j QUEUE
> 
> I make my br0 bridge from eth0 to eth1.
> I modprobe the ip_queue.
> So I have the section:
> case IPQM_PACKET:
> ipq_packet_msg_t *m=ipq_get_packet(buf);
>
status=ipq_set_verdict(h,m->packet_id,NF_ACCEPT,m->data_len,
> m->payload);
> 
> 
> I get the expected stream of messages from the test
> app but it will, invariably and relatively fast,
> cause
> the system to lock up completely, keyboard LEDs
> flashing.
> 
> I did go in and remove the payload return (0,NULL)
> and
> it actually seems to be running just fine, a concern
> since I need to alter the payload data in the end. 
> 
> Does anyone have thoughts as to why I panic when
> returning the same payload?
> 
> -Scott
> 
> 
> 
>      
>
____________________________________________________________________________________
> Looking for last minute shopping deals?  
> Find them fast with Yahoo! Search. 
>
http://tools.search.yahoo.com/newsearch/category.php?category=shopping
> --
> To unsubscribe from this list: send the line
> "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> 



      ____________________________________________________________________________________
Be a better friend, newshound, and 
know-it-all with Yahoo! Mobile.  Try it now.  http://mobile.yahoo.com/;_ylt=Ahu06i62sR8HDtDypao8Wcj9tAcJ 

