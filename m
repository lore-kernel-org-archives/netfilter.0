From: Andy Hester <andy.hester@gmail.com>
Subject: Rule counter incrementing, but packet not dropped?
Date: Sun, 26 Jul 2015 16:30:48 -0500
Message-ID: <CAMSXMRaxNUPBjbQRs6RZ3rgE8hCZV+tUCknd+enad2ncn_+foQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=CqtuLed/EEcONf0xUmh2HRNqY7XVcSnL6lmh/0I3iws=;
        b=Niojxz0DQgMrJCZTf8KzSD9ogBmshwzluLtfJiFHeh2FFoD7h9dPFPlYTzdYFv7RLR
         UCUO5Jk+7ozz9K+ESKRQ7lcAoT0yqjWBpfcbTQR5oXDzTj1mirM9/x9E4fDxVmuOpxq4
         6CpGeJGYObeKQkVa5C4ZOCg/MehQbuXaIM/PJ6zn9xviOrCRHMBRelwyYbNCgzaGwkM3
         4opRPvpH6cf9uRv4teqnpMxIYFwCxzGlRPqK2rvlpKx4wXwvBPgzYJ93IaHV35nki2m6
         TPxSKuZI1NOgbHdRh9V0N6h4jwo/nzyv8gCtTSj/7rENVWWMs4tILynLkENJUeSx6Q+e
         x4mA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Has anyone experienced a condition where rule counter increments but
the target doesn't work?  (I tried the DROP, TRACE target and the MARK
target also without success)  Any ideas where I should look next?

Firewall is a bridging firewall.

I can see traffic hitting a specific firewall rule for a specific host
that has a drop target (counters increment), but the traffic is still
making it through.

I tried the TRACE target to see if I had done something wrong, but it
doesn't work either.  (I did insmod the logging module). No logs in
/var/log/kern.log|messages|syslog etc

Other rules have been to mark packet for a queue, but the queue
counters don't increment even though the iptables rule does.  (It use
to work fine)

All of this started after upgrades which forced me to add vlan
subinterfaces and bridge them.  (I used to just bridge the physical
interfaces and ignored the VLANs and everything worked fine.  After
the upgrade this no longer worked, and the only fix was to add the
subitenterface configs for the vlans.  After fixing the bridging to
work with the new kernel, iptables is not working.)



The bridge has multiple interfaces/subinterfaces.

eth0-eth3 all have sub interfaces ie

eth0.1, eth.100, etc

the bridges contain the subinterfaces only.  Traffic is passing
normally and vlans are working as expected through the bridge.  That
is to say the hosts on either side of the bridge are getting the
traffic they are supposed to.

I have the setting in sysctl.conf set to pass bridge traffic to
iptables and also the setting for passing vlan traffic to iptables.  I
verified via the sysctl command.

I also turned these settings off and verified that packets no longer
incremented the counters on the rules
Turned them back on and verified that the counters on a very specific
rule (1 src IP)  increment again.

But I verified that I can still pass traffic through the bridge.  I
have verified that there are no rules ahead of the block rule,
although the default for all tables is accept.


Any help appreciated.

Andy
