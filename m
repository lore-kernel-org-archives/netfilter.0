From: Anton Danilov <littlesmilingcloud@gmail.com>
Subject: Re: Help: Marking UDP packets in a bridge
Date: Mon, 13 Oct 2014 08:54:27 +0400
Message-ID: <CAEzD07K0FCUQP3vOG-11LKDaReWVmW5sR+hqktT86J+MOewP0Q@mail.gmail.com>
References: <5437FB00.3030806@ncsu.edu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=w4B6j2byf9V8F+89Eue4IWi7lA0ePbygrc4/VQHjFvc=;
        b=zfweFg7TtKUqeszRXNX9ZrDuh2eoEBDIX9lQOEr9cuveMGNtFu7nwoHA9q82BLSZUN
         VjwuO0g/jn9DrWb2LGmUmC9txEd/EuMoQcbtPgZZQLg450SMsYDJoOLdDHNmsKHMV9W4
         Qq/UFakPIkAw0rCb3V7ArdbU/ov4eoJFaPPoIjBfF7otrM+szhlcrFfd66Z+Oh4JycdX
         JHO298da6TJTf1q/liqG4wn3YeUQ7SZdnkydCZ8kE6DYq6aXnZ1Okyscu2e6Vm5oJqj0
         iX1BIWAuex4t/wNqnBmJFYNhWROtPy6r/DONa4+qj2p6K8GhTfek7CHbZUVTpWq4gyMl
         qckg==
In-Reply-To: <5437FB00.3030806@ncsu.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aravindhan Dhanasekaran <adhanas@ncsu.edu>
Cc: netfilter@vger.kernel.org

Hello.

Check sysctl variable bridge-nf-call-iptables. It should be equals 1,
otherwise bridged traffic don't pass iptables.

2014-10-10 19:28 GMT+04:00 Aravindhan Dhanasekaran <adhanas@ncsu.edu>:
> Hello,
>
> I'm trying to mark UDP packets entering (or leaving) a bridge, destined to a
> particular UDP port on a machine on the other side of the bridge.
>
> My simple topology looks like:
> host1 [eth1] <-----> [s1-eth1] bridge [s1-eth2] <-----> [eth1] host2
>
>
> I've added a rule to the FORWARD chain on the mangle table in the bridge to mark
> the packets that I require:
> $ sudo iptables -t mangle -A FORWARD -p udp --dport 9917 -j MARK --set-mark 17
> $ iptables -L FORWARD -t mangle -v
> Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source       destination
>     0     0 MARK       udp  --  any    any     anywhere     anywhere      udp
> dpt:9917 MARK set 0x11
>
>
> But, looks like none of packets are being marked (counters are all 0s in
> iptables output as shown above). I have traffic matching the above rule flowing
> through the bridge which I verified using tcpdump.
> $ sudo tcpdump -i s1-eth1 udp dst port 9917
> ...
> 11:22:14.774417 IP 10.0.0.2.49774 > 10.0.0.1.9917: UDP, length 1470
> 11:22:14.774597 IP 10.0.0.2.49774 > 10.0.0.1.9917: UDP, length 1470
> 11:22:14.774731 IP 10.0.0.2.49774 > 10.0.0.1.9917: UDP, length 1470^C
>
> 999 packets captured
> 1831 packets received by filter
> 795 packets dropped by kernel
>
>
> I'm not sure what's wrong with my configuration. Any help would be appreciated.
>
> Thanks,
> /Aravind
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Anton.
