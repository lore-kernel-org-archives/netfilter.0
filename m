From: Sergio Penkale <spenkale@arnet.com.ar>
Subject: Re: Can anyone tell wat's going on here?
Date: Wed, 11 May 2005 15:27:33 -0300 (ART)
Message-ID: <Pine.LNX.4.63.0505111518480.3200@palangana>
References: <Pine.LNX.4.63.0505111249010.3025@palangana>
	<42822CC9.5080209@SCampbell.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42822CC9.5080209@SCampbell.net>
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
To: Steven M Campbell <Netfilter@SCampbell.net>
Cc: netfilter@lists.netfilter.org

On Wed, 11 May 2005, Steven M Campbell wrote:

> Have you checked 'netstat -in' for interface errors on the ethernet 
> connection, I am suspicious that you just have a duplex mismatch between the 
> host and client.  Worth a look.

Thanks for the reply, but the ethernet link seems ok, i'm using squid 
until i can fix this and it works fine.
Besides, if i go back to woody (i made an image of my previous distro) it 
works ok.

This is the output of netstat, the client host is on eth0.

palangana:~# netstat -in
Kernel Interface table
Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR   TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0   1500 0      2649      0      0      0    1809      0      0      0 BMRU
eth1   1500 0      7563      0      0      0    7444      0      0      1 BMU
lo    16436 0       106      0      0      0     106      0      0      0 LRU
nas0   1500 0     94132      0      0      0   74268     10      0     10 BMRU
ppp0   1492 0     91901      0      0      0   72046      0      0      0 MOPRU

