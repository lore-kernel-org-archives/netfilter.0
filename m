From: Victor Toni <netfilter-list@kromo.org>
Subject: Re: Howto access modem behind router
Date: Tue, 24 Oct 2006 20:05:51 +0200
Message-ID: <453E55FF.7000705@kromo.org>
References: <453D34CD.904@kromo.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <453D34CD.904@kromo.org>
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

Victor Toni wrote:
> Hello,
>
> I have one of these modems which is a router by itself. The modem is
> configured to work in bridged mode.
> Connected to the modem is a router which connects via pppoe via the
> modem with my ISP.
>
>    |<---------- PPPOE link ------------->|    
>    |                                     |    |====== 
>   ISP ======= bridged ================= WRT ========= PCs
>                modem |                 |   |  |======
>                      |                 |   |
>                      |<- 169.254.1.x ->|   |<-- 192.168.1.x -->>
>
>
>
> The modem has a web interface and and telnet which I would like to
> connect to from within the LAN but this doesn't seem to work.
> I tried the instructions from:
> http://www.dd-wrt.com/wiki/index.php/Access_To_Modem_Configuration
> but this makes the modem only available from the router and not from the
> LAN.
> I have currently some trouble with my connection and would like to use a
> tool to monitor the modem's error status but this fails due to the
> configuration.
> The modem has the static IP 169.254.1.1 and the router has the static
> IPs 169.254.1.100 and 192.168.1.1.
> I can ping "169.254.1.100" from any LAN machine on 192.168.1.0/24 but
> that's it.
>
> Any help is very much appreciated.
>   

Is there any additional information I could provide? I have really no
clue about iptables so I would rather have my firewall open or NAT not
working anymore after my experiments.

Victor


