From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: DNAT hiding routers behind it
Date: Wed, 11 Aug 2004 15:29:12 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <411A8198.2030409@pbl.ca>
References: <4113BEF9.5090706@parknet.dk> <200408062356.16206.Antony@Soft-Solutions.co.uk> <411443B8.8090202@parknet.dk> <200408070837.38949.Antony@Soft-Solutions.co.uk> <4114EB94.8050004@parknet.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4114EB94.8050004@parknet.dk>
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
To: Simon Lodal <simonl@parknet.dk>
Cc: netfilter@lists.netfilter.org

Simon Lodal wrote:
> I would like to set up a stealth sniffer between firewall and next-hop 
> router, but I do not know how, wish I still had a hub.

You said your router is actually an ethernet switch (that have some 
routing capabilities)?  On most switches, you can assign one or more 
ports to be monitoring ports.  They will receive copy of all traffic 
going through the switch.  Check if your switch supports that. 
Configure one port to be monitoring port, connect PC to it.  Do not set 
up IP address or anything on that interface, just bring it up with 
ifconfig.  Run tcpdump or such on that interface.  And you have your 
stealth sniffer.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

