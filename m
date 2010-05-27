From: Dan Higgins <dhiggins@ngenera.com>
Subject: Troubles doing transparent proxy for virtual machines
Date: Thu, 27 May 2010 14:39:52 -0500
Message-ID: <4BFECA88.5040708@ngenera.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi iptables gurus. First here is the basic topology:

   Internet
      |
   Gateway
      |
Workstation---eth0---virbr0
                        |
                        +-----+-----+
                        |     |     |
                       vm1   vm2   vm3

I need to test a traffic analyzer running on my workstation, listening
on some port (say 8990) on eth0.

The rule [I think] I want is "any packets leaving virbr0 going anywhere
to port 80 must instead go to port 8990 on eth0". My software running on
port 8990 does its own check of the NAT packet mangling to push the
packets through after it inspects them.

I've been banging my head on this, with different variants of:
iptables -t nat -A PREROUTING -i virbr0 -p tcp --dport 80 -j DNAT \
     --to 10.0.0.10:8990
And I've tried the more generic method of using the mangle table with
--set-mark and ip rule add fwmark, but I'm not getting it.

I guess what's confusing me is that everything runs on the same box.

Thanks for any guidance,
Dan

