From: Sergio Penkale <spenkale@arnet.com.ar>
Subject: Can anyone tell wat's going on here?
Date: Wed, 11 May 2005 12:49:39 -0300 (ART)
Message-ID: <Pine.LNX.4.63.0505111249010.3025@palangana>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi, I have a problem that's driving me crazy:
I have a nat box running Debian Sarge under a 2.6.11.7 kernel. I compiled
this kernel myself, which could be the source of problems.
The nat box itself works great, but masquerading has a strange problem,
some things work and others don't. For example some web pages (like google)
work great, and some others (like hotmail for example), don't work at all,
while in the nat box all of them work. 
I've tried https pages on the clients and they work, so the problem seems to
be at the level of packets, and it only affects the traffic that gets masqueraded.
I have a lot of iptables rules, but it makes no difference using only trivial
masquerading rules. That is: flushing everything, setting all policies to ACCEPT
and adding "-A POSTROUTING -s 10.10.10.0/255.255.255.0 -o ppp0 -j MASQUERADE" in nat.
Usinf SNAT instead of MASQUERADE doesn't make any difference either

The problem also arises when doing ssh: i login to a remote machine and do an ls
of a directory with many files. If i make this from the nat box it works fine,
but if i repeat those same steps from a masqueraded client i only get one or
two listing lines and then it just hangs.
Here's the tethereal output of this: 201.252.166.212 is my ip and xxx.xxx.xxx.xxx
is a remote machine, i've already loged in and i start capturing when i send the
ls command. From the nat box it works ok:

palangana:~# tethereal -i ppp0 '(host xxx.xxx.xxx.xxx) or (port 22)'
Capturing on ppp0
   0.000000 201.252.166.212 -> xxx.xxx.xxx.xxx SSH Encrypted request packet len=48
   0.159113 xxx.xxx.xxx.xxx -> 201.252.166.212 SSH Encrypted response packet len=48
   0.159304 201.252.166.212 -> xxx.xxx.xxx.xxx TCP 4874 > ssh [ACK] Seq=48 Ack=48 Win=2540 Len=0 TSV=59055726 TSER=229209706
   0.210101 xxx.xxx.xxx.xxx -> 201.252.166.212 SSH Encrypted response packet len=144
   0.210259 201.252.166.212 -> xxx.xxx.xxx.xxx TCP 4874 > ssh [ACK] Seq=48 Ack=192 Win=2812 Len=0 TSV=59055777 TSER=229209709
   0.383142 xxx.xxx.xxx.xxx -> 201.252.166.212 SSH Encrypted response packet len=1440
   0.383456 201.252.166.212 -> xxx.xxx.xxx.xxx TCP 4874 > ssh [ACK] Seq=48 Ack=1632 Win=3532 Len=0 TSV=59055950 TSER=229209716
   0.463144 xxx.xxx.xxx.xxx -> 201.252.166.212 SSH Encrypted response packet len=1440
   0.463349 201.252.166.212 -> xxx.xxx.xxx.xxx TCP 4874 > ssh [ACK] Seq=48 Ack=3072 Win=4252 Len=0 TSV=59056030 TSER=229209716
   0.463154 xxx.xxx.xxx.xxx -> 201.252.166.212 SSH Encrypted response packet len=16
   0.463481 201.252.166.212 -> xxx.xxx.xxx.xxx TCP 4874 > ssh [ACK] Seq=48 Ack=3088 Win=4252 Len=0 TSV=59056030 TSER=229209717

but from a client this happens:

palangana:~# tethereal -i ppp0 '(host xxx.xxx.xxx.xxx ) or (port 22)'
Capturing on ppp0
   0.000000 201.252.166.212 -> xxx.xxx.xxx.xxx  SSH Encrypted request packet len=48
   0.074706 xxx.xxx.xxx.xxx  -> 201.252.166.212 SSH Encrypted response packet len=48
   0.104737 xxx.xxx.xxx.xxx  -> 201.252.166.212 SSH Encrypted response packet len=144
   0.105109 201.252.166.212 -> xxx.xxx.xxx.xxx  TCP 1356 > ssh [ACK] Seq=48 Ack=192 Win=64399 Len=0
   0.118746 xxx.xxx.xxx.xxx  -> 201.252.166.212 SSH Encrypted response packet len=144
   0.226971 201.252.166.212 -> xxx.xxx.xxx.xxx  TCP 1356 > ssh [ACK] Seq=48 Ack=336 Win=64255 Len=0
   0.367701 xxx.xxx.xxx.xxx  -> 201.252.166.212 SSH [TCP Previous segment lost] Encrypted response packet len=1292
   0.368144 201.252.166.212 -> xxx.xxx.xxx.xxx  TCP [TCP Dup ACK 6#1] 1356 > ssh [ACK] Seq=48 Ack=336 Win=64255 Len=0 SLE=1796 SRE=3088

I don't know whether my ack on package #6 gets lost, or if i'm missing some packets
sent by xxx.xxx.xxx.xxx.
I could repeat this behavior anytime i want.

My main problem is that i don't know wat the problem is, i don't know if it's 
iptables-related, kernel-related or what. I haven't tried other kernels mainly
because it's a lot of trouble to get the driver of my USB ADSL modem to work
between different kernel versions.
I was using debian woody with a 2.4.19 kernel and everything worked fine,
the problem arised when i upgraded to sarge. The main configuration didn't
change during the upgrade.
Any suggestion on what the problem could be or at least how to trace it
would be much appreciated.

regards,
Sergio.

