From: Jeffrey Laramie <jalaramie@Loudoun-Fairfax.com>
Subject: Re: External IP addresses on internal network
Date: Tue, 26 Aug 2003 21:10:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F4C0519.8000109@Loudoun-Fairfax.com>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15C1B5@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A15C1B5@wardrive.citadelcomputer.com.au>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Vieira <georgev@citadelcomputer.com.au>, netfilter@lists.netfilter.org

George Vieira wrote:

>This could be an internal machine querying aol.com dns server.. which is harmless..
>
>can you show come tcpdumps of this? Was the source IP the aol.com address or was it just the destination..
>
George, here is the log entry I got:

Aug 26 15:39:46 NS2 kernel: Filter_INPUT: IN=eth1 OUT= 
MAC=00:c0:f0:69:26:49:52:54:00:de:46:c7:08:00 SRC=172.144.233.136 
DST=192.168.0.24 LEN=73 TOS=0x10 PREC=0x00 TTL=128 ID=1755 PROTO=UDP 
SPT=137 DPT=53 LEN=53

eth1 is the internal LAN interface and 192.168.0.24 is it's IP address. 
It appears from this that I'm getting DNS queries on my internal 
interface from an address that is not in my subnet.

> I would be worried if it was the source IP and it was going out, not in. If it was coming in then don't panic though I woudl prefer to run a caching DNS server locally and block DNS going out.
>  
>
The firewall box is a fully configured DNS server for my public and 
private domains, so getting a DNS request on the internal port is 
normal. I'm just puzzled (and a little concerned) that the client box is 
identified this way.

I have a theory that a laptop on the LAN may have been assigned a valid 
AOL IP during a dialup session and is still configured to use it somehow 
for DNS only (otherwise all the packets would fail this rule). Very odd. 
I'm going to do some more digging on this one.

>Thanks,
>____________________________________________
>George Vieira
>Systems Manager
>georgev@citadelcomputer.com.au
> 
>
>-----Original Message-----
>From: Jeffrey Laramie [mailto:JALaramie@Loudoun-Fairfax.com]
>Sent: Wednesday, August 27, 2003 1:57 AM
>To: netfilter@lists.netfilter.org
>Subject: External IP addresses on internal network
>
>
>Hi all,
>
>I recently updated my configuration by modifying one of my filter INPUT 
>rules to specify source IPs coming in from the LAN:
>
>iptables -t filter -A INPUT -p all -i $LAN_Interface -s $LAN_IP_Range -j 
>Lan-Host
>
>Packets not meeting this condition (among others) are logged and 
>dropped. The intent is to catch any internal packets coming from an 
>external IP address. No sooner did I load this rule when I started 
>logging packets with an AOL IP address coming from the LAN interface 
>going to port 53. I have a small LAN with only a handful of PCs which I 
>configured myself, so I'm a bit puzzled.
>
>Have I configured this wrong? Several users connect to AOL through the 
>firewall so that's a possible cause, but I don't know why an AOL program 
>would spoof IPs. Thoughts?
>
>
>  
>


