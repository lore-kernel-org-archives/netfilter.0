From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Can anyone tell wat's going on here?
Date: Wed, 11 May 2005 13:31:03 -0500
Message-ID: <42824F67.6010701@riverviewtech.net>
References: <Pine.LNX.4.63.0505111249010.3025@palangana>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.63.0505111249010.3025@palangana>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> palangana:~# tethereal -i ppp0 '(host xxx.xxx.xxx.xxx) or (port 22)' Capturing on ppp0
>   0.000000 201.252.166.212 -> xxx.xxx.xxx.xxx SSH Encrypted request packet len=48
>   0.159113 xxx.xxx.xxx.xxx -> 201.252.166.212 SSH Encrypted response packet len=48
>   0.159304 201.252.166.212 -> xxx.xxx.xxx.xxx TCP 4874 > ssh [ACK] Seq=48 Ack=48 Win=2540 Len=0 TSV=59055726 TSER=229209706
>   0.210101 xxx.xxx.xxx.xxx -> 201.252.166.212 SSH Encrypted response packet len=144
>   0.210259 201.252.166.212 -> xxx.xxx.xxx.xxx TCP 4874 > ssh [ACK] Seq=48 Ack=192 Win=2812 Len=0 TSV=59055777 TSER=229209709
>   0.383142 xxx.xxx.xxx.xxx -> 201.252.166.212 SSH Encrypted response packet len=1440
>   0.383456 201.252.166.212 -> xxx.xxx.xxx.xxx TCP 4874 > ssh [ACK] Seq=48 Ack=1632 Win=3532 Len=0 TSV=59055950 TSER=229209716
>   0.463144 xxx.xxx.xxx.xxx -> 201.252.166.212 SSH Encrypted response packet len=1440
>   0.463349 201.252.166.212 -> xxx.xxx.xxx.xxx TCP 4874 > ssh [ACK] Seq=48 Ack=3072 Win=4252 Len=0 TSV=59056030 TSER=229209716
>   0.463154 xxx.xxx.xxx.xxx -> 201.252.166.212 SSH Encrypted response packet len=16
>   0.463481 201.252.166.212 -> xxx.xxx.xxx.xxx TCP 4874 > ssh [ACK] Seq=48 Ack=3088 Win=4252 Len=0 TSV=59056030 TSER=229209717
> 
> but from a client this happens:
> 
> palangana:~# tethereal -i ppp0 '(host xxx.xxx.xxx.xxx ) or (port 22)' Capturing on ppp0
>   0.000000 201.252.166.212 -> xxx.xxx.xxx.xxx  SSH Encrypted request packet len=48
>   0.074706 xxx.xxx.xxx.xxx  -> 201.252.166.212 SSH Encrypted response packet len=48
>   0.104737 xxx.xxx.xxx.xxx  -> 201.252.166.212 SSH Encrypted response packet len=144
>   0.105109 201.252.166.212 -> xxx.xxx.xxx.xxx  TCP 1356 > ssh [ACK] Seq=48 Ack=192 Win=64399 Len=0
>   0.118746 xxx.xxx.xxx.xxx  -> 201.252.166.212 SSH Encrypted response packet len=144
>   0.226971 201.252.166.212 -> xxx.xxx.xxx.xxx  TCP 1356 > ssh [ACK] Seq=48 Ack=336 Win=64255 Len=0
>   0.367701 xxx.xxx.xxx.xxx  -> 201.252.166.212 SSH [TCP Previous segment lost] Encrypted response packet len=1292
>   0.368144 201.252.166.212 -> xxx.xxx.xxx.xxx  TCP [TCP Dup ACK 6#1] 1356 > ssh [ACK] Seq=48 Ack=336 Win=64255 Len=0 SLE=1796 SRE=3088

One thing jumps out to me, namely your TCP window size is different when you are working from your client (NATed) system.  I'm not familiar with dealing with MTU issues, but someone else on this list (Jason do you have any comments?) might be able to help you more than I can.

The other thing that comes to mind is that you might be having problem with your USB modem driver.  I personally try to avoid USB (for many different reasons) and thus can not help you with that either.  Sorry.  :(



Grant. . . .

