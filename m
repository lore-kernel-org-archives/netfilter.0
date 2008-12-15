From: Aleksander Kamenik <aleksander@krediidiinfo.ee>
Subject: ip_forward failing at random times for random amount of time
Date: Tue, 16 Dec 2008 01:26:13 +0200
Message-ID: <4946E795.2030602@krediidiinfo.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I've got this real weird problem.

Running Fedora 9, seen this issue with 2.6.27.5-37 as well as
2.6.27.7-53 kernel.

It's a gateway box, two NICs. Internal LAN with several subnets and
external net.

At some random point in time packets that should be forwarded are not
sent through. Exactly as if ip_forward is set to 0 in /proc. But it's
not of course. No errors reported anywhere.

Both interfaces work fine on their own. For example I can ssh into the
box from the internet as well as from the internal LAN. I can ssh into
the box from the internal LAN with the -D option and successfully use
the box as a SOCKS proxy to browse the net.

I haven't found any clues, as why this might happen. The problem goes
away by itself sometimes after a minute, sometimes after half an hour. I
am unable to find any regularity.

A restart of the server solves the problem.

I tried reloading iptables, bringing the external NIC down and up.
Restarted my qos script (tc qdiscs). echo'd 0 into ip_forward and then 1
again.

Nothing helps except waiting and a cold boot.


It started happening, after I had tcpdump running on the box for quite a
while. Before this, I hadn't touched the box for a month. I figured
tcpdump might have caused it somehow so stopped using it, but it's still
happening even after restarts.

The disk is not full:

df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/sda3             453G   11G  419G   3% /
/dev/sda1            1012M   21M  940M   3% /boot
tmpfs                 2.0G     0  2.0G   0% /dev/shm

The box is idle, nothing's happening.

I then did a yum update and updated the kernel too. Rebooted. Problem
persists.

During a "blackout" I did:

iptables -I FORWARD -s my.internal.ip.address -j LOG --log-prefix "ASD"

And tried to use the net. No logs were written. After a restart I tried
the same iptables line and it found my packets. So during the blackout
the iptables filter FORWARD chain is not reached.


Any ideas on what possibly is going on? I don't know how to debug this
further.

Regards,

-- 

Aleksander Kamenik
System Administrator
Krediidiinfo AS
an Experian Company
Phone: +372 665 9649
Email: aleksander@krediidiinfo.ee

http://www.krediidiinfo.ee/
http://www.experiangroup.com/

