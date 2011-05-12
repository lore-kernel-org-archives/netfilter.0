From: CeR <cer.inet@linuxmail.org>
Subject: assuming valid ESTABLISHED connections without conntrack on firewall
 active/pasive HA cluster
Date: Thu, 12 May 2011 19:15:47 +0200
Message-ID: <BANLkTinsDigkLBwM+FFrWev-6WRvsVe4GQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=CNZ06Tzr1VgwiWPbYj0K/llbtwSmZm3h9L3tvEewiyw=;
        b=jgU2XQzUUNkEQ+aZeKlKVntjg0OEJ0vKR3Dws36aV7qF7JqezPQKOe2gdkwKLQ/z3k
         ++zyg68Hf65ETQkCXyquF0JL1ZM3vXNvivq4fRWsgyEp4IIVsIx96vjQvUImpivrvJ9D
         dlarAbwWmbqUx8iS5xetuD98TDqJxSia5XbQw=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi there.
I'm working on a active/pasive HA cluster with corosync/pacemaker.
=46or testing purposes, i did these test:

CASE A: One of that test do the next:

1) Initialisation of a connection with a big file transfer with SCP
across the cluster.
2) "halt" the primary node. All resources (pacemaker) moves to another
node. That's ok.
3) The file transfer still working. Transparent to the end user.

CASE B: I want to be sure that the failback/failover is thanks to
conntrackd flow's-state-replication, so

1) Stop the conntrackd resource. All go fine. Conntrack is not working =
any more.
2) Start the file transfer across the cluster.
3) Failover the node that has the IPVs. All resources moves to another
node (pacemaker).
4) The file transfer still working. Transparent to the end user.
=BF=BF=BF=BF=BF=BF?????? WTF


In the CASE B, without the conntrackd running, I supposed that the new
node being owner of IPVs will not have any knowlege about the state of
the flow (you know, NEW, ESTABLISHED,etc..). And this mean the
firewall has to block the transference.
But still transfering and the iptables rule being aplied as it where
an ESTABLISHED connection:

Chain FORWARD (policy DROP 42 packets, 3336 bytes)
 pkts bytes target     prot opt in     out     source
destination
 741K 1075M ACCEPT     tcp  --  eth0   eth2    10.0.0.128
192.168.100.100     tcp spts:1024:65535 dpt:22 state NEW,ESTABLISHED
37498 2400K ACCEPT     tcp  --  eth2   eth0    192.168.100.100
10.0.0.128          tcp spt:22 dpts:1024:65535 state ESTABLISHED


Any idea? Is this the standard behaviour of netfilter tools?

In the IRC channel, i got this:
[18:32] <fw> sysctl net.netfilter.nf_conntrack_tcp_loose
[18:33] <fw> its probably one.  it must be 0 to disable pickup of
established connections.

But in fact, i haven' t "net.netfilter.nf_conntrack_tcp_loose" nor
"net.ipv4.netfilter.ip_conntrack_tcp_loose"

Please, consider a clumsy configuration/guy here :)


Regards

--
/* Arturo Borrero Gonzalez || cer.inet@linuxmail.org */
/* Use debian gnu/linux! Best OS ever! */
