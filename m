From: Sorin Panca <sorin.panca@gmail.com>
Subject: Re: How would this help my LAN / network
Date: Fri, 07 Oct 2005 18:16:14 +0300
Message-ID: <4346913E.6070501@gmail.com>
References: <4346866D.8080900@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4346866D.8080900@eccotours.dyndns.org>
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



Brent Clark wrote:
> HI all
> 
> I just came across one of the threads on the LARTC.
> In the thread it had this.
> 
> So my question is, for the following rules, would these increase my
> browsing / traffic, and if so, how.
>
Small packets and control pachets should have priority because they
carry intrractive traffic.
> iptables -t mangle -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST,ACK
> ACK -m length --length 0:128 -j TOS --set-tos Minimize-Delay
Large packets are for upload or download. They can wait until people
open their html pages. Some p2p applications are ill-behaved and they
send large control packets for carrying payloads.
> iptables -t mangle -A PREROUTING -p tcp -m tcp --tcp-flags SYN,RST,ACK
> ACK -m length --length 128: -j TOS --set-tos Maximize-Throughput
Port 20 = ftp-data is the data channel in ftp transactions. We have file
transfer in that channel.
> iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 20 -j TOS
> --set-tos Maximize-Throughput
Port 21 - ftp is the ftp control channel. when you stop a transfer or
acknoledge something you need the program to respond at your action very
quick.
> iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 21 -j TOS
> --set-tos Minimize-Delay
Port 22 - ssh: when you remotely manage a computer, and if you press a
key on your keyboard, the letter must appear almost when you press the key.
> iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 22 -j TOS
> --set-tos Minimize-Delay
Port 53 - domain: when someone is browsing the Internet and waits for a
page to load, the Internet must translate quick the site address in the
IP address, so the user waits less for the page to start to load.
> iptables -t mangle -A PREROUTING -p udp -m udp --sport 53 -j TOS
> --set-tos Maximize-Throughput
Port 80 - http: this is from where the pages come and the requests for
them go. The system must respond quickly (we have fast computers these
days, don't we?)
> iptables -t mangle -A PREROUTING -p tcp -m tcp --sport 80 -j TOS
> --set-tos Maximize-Throughput
( I don't know this port and i am too lazy to open /etc/services)
> iptables -t mangle -A PREROUTING -p udp -m udp --sport 123 -j TOS
> --set-tos Minimize-Delay
Where are https, irc, messengers... ?
> 
> If someone would take the time to briefly explain this to me, I would be
> most grateful.
> 
> Kind Regards
> Brent Clark
> 
> 

