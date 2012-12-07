From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: About cluster deployments.
Date: Fri, 7 Dec 2012 13:21:27 -0300
Message-ID: <CACuyg24DKgSepVWkfdVtN9o4qj5hNR2qJij+DgqSHXbx_Agjhg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Z/PJYMd57dHLTDxElkeZ6II56OKPxt5+5Nmm9aOsaC8=;
        b=sn3ajcD4cK54W3t/nxkQXuVNiLsa5YdijZ3rGyFTKl2mJKumFSzgTdUQoNVPqqE+X3
         PspOIPFTQmvbKNqSb2Q2vo3PnSgANWRwa4eRc+yPzIB6oySG58FTHAfeY/xN+bJqA7Nh
         x/m8k81WzpCR34MHN73FWejW8BQNe4Td7zunvuizzRvkzicwC1RgcDZEaYUfQnWoPovL
         17cHZWFq8HKi/NHVmCzAiKvAQkvtWfb4HC3OwvAbSdojmaFPjie0RAF/cNAm39iHaD5M
         JLbZU5T8yvbvY1WcGa7Xpt9bNiev8S6YaCUP/0+SaU/LdP/YrN1wcDa2oiTSo/vro6Gi
         ieQw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I'd like to know the group opnion about available GPL cluster solutions. At the
moment I'm working with a solution based on ucarp (vip address) and rsync (conf
syncs) without synchronizing the conntrack table - im using active /
passive model.
I'm adopting a configuration with two ucarp groups. One group determines which
firewall will be dedicated to Internet control and other is for
internal control.

The most suitable configuration into Internet has been keepalived + conntrackd.
I think it's a great alternative, but ... I'm having some doubts.

What do you think of implementations with CLUSTERIP?
I did some tests, but found it a bit unstable. Maybe for my mistakes.
I found articles
 criticizing and others saying that the target CLUSTERIP will sync the
conntrack table
too. It's true?

To synchronize the configuration i thought about using the DRDB, but i
found it very
complex to manage - increases the difficulty in adding or removing
nodes. In tests
that i did, I prefer GlusterFS. But i'm undecided. I still think rsync
the most simple,
secure and fast way to synchronize settings. In my opinion the other
methods amplify
the complexity unnecessarily (for firewalls).

I found articles defending the cluster configuration with corosync + pacemaker.
It seems a fairly complete solution, but thought is not ideal for firewall.

I intend to test models with active/active, but there isn't much
documentation on the subject.

What opinion do you have about it (cluster solutions)?
