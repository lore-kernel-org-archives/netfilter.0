From: israel Gold <rhglaw1@barak.net.il>
Subject: RE: Logging the whole packet
Date: Wed, 24 Nov 2004 19:30:04 +0200
Message-ID: <000001c4d24b$3c548a10$939a5a3e@il.sangate.com>
References: <1101308322.3687.11.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <1101308322.3687.11.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Jason you correct,
I am looking for tool that is capable of real-time protocol analysis
and content matching. SNORT seems to be more appropriate.
Thank you for the tip.
Israel.


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jason
Opperisano
Sent: Wednesday, November 24, 2004 4:59 PM
To: netfilter@lists.netfilter.org
Subject: RE: Logging the whole packet


On Wed, 2004-11-24 at 06:03, israel Gold wrote:
> Jason Opperisano wrote:
> 
> >>AFAIK, the normal LOG target cannot actually do this.  instead, use
> the ULOG target which will copy the entire packet to the
> >>userspace ulogd daemon where you can use the ulogd_PCAP.so plugin to
> create a tcpdump file of the packets you are
> >>interested in.
> 
> I also would like to log the packet data. In fact, I would like to 
> monitor NFS Write calls. However, using ULOG and copying all packets 
> to user space is time consuming.
> I have no interest in Read calls which is most of the traffic.
> Does iptables provide a tool to filtering packets by looking at the
data
> ?
> 
> Thanks,
> Israel   

iptables is a firewall; not a high performance packet capturing tool.

you guys ever heard of tcpdump?  snort?

-j

--
"They think they're so high and mighty, just because they never got
caught driving without pants."
	--The Simpsons



