From: Chris Burroughs <christopher@addthis.com>
Subject: spooky RST with DNAT rules;  macvlan + namespace
Date: Fri, 10 Apr 2015 15:56:02 -0400
Message-ID: <55282AD2.9040009@addthis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=addthis.com; s=google;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=rE0EOcPqTCjykl3fX1WHOwusNOqL0K5QY+n4Q0Tk2HI=;
        b=DdPbYczkWrVNrumibCFF8kFdkIjOu19yWruDEEq0jFt6hwv8YPOZEs0HzB63HXRn/J
         FNp73hTyD03/vrpUWzXy+T8mrZpH4ibWU3qJphalZcuUapFSpqROVNiQdCLI/EfHVsB2
         Jve7CntWAzL2omKzAVUqc01MrdHkumn6DsTFQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I have an existing application that relies on some custom iptables logic 
to function inside our network.  It uses several simple rules along the 
lines of:

iptables -t nat -A OUTPUT -j DNAT -p tcp --dst x.x.x.x --dport 7000 -o 
eth0 --to-destination y.y.y.y

There are several nodes and there is a DNAT rule for each node.  I've 
successfully been using rules like this on physical nodes for a few 
years without difficulty.

I'm trying to replace these nodes with 'containers' on centos6. 
Specifically by 'containers' I mean lxc with:
  * privileged containers
  * macvlan in bridge mode
  * network namespace

And running into trouble with the same iptables rules.  Specifically 
what happens between container A (initiates connection) on host X and 
container B (listening daemon) on host Y.

  * A: syn
  * B: syn+ack
  * A: rst

I've detected the RST with tcpdump from both within the container and on 
the host.  Visually in wireshark it looks like: 
http://i.imgur.com/lo1PF6k.png  Basic DROP rules like 'block inbound on 
this port' appear to work fine.

To add to the confusion, if A & B are co-located on the same physical 
host it appears to work okay.

I'm at at loss to explain where the RST is coming from or how to make 
the DNAT rule work correctly.
