From: "Adam Kennedy" <akennedy@niesc.k12.in.us>
Subject: Re: Having NAT problems
Date: Thu, 1 Apr 2004 15:32:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040401203013.M36511@niesc.k12.in.us>
References: <20040401192505.3100.69461.Mailman@vishnu.netfilter.org> <200404012039.48071.Antony@Soft-Solutions.co.uk> <20040401200109.M82978@niesc.k12.in.us> <200404012119.45564.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404012119.45564.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, 1 Apr 2004 21:19:45 +0100, Antony Stone wrote
> We don't mind if you obscure the IP addresses (so long as we can 
> still tell which is which...)
> 
> However, from what you have posted, I think the problem is that you 
> have no FORWARD rule to allow the DNATed packets through your firewall?
> 
> Oh, dear me, no - that's not it - you have a default ACCEPT policy 
> on your FORWARD chain (I'm not surprised you don't want to post your 
> public IP address to the list...)
> 
> Okay, how's this then  - please post all the rules which you think 
> are needed for this pcAnywhere setup to work (with suitable partial 
> obscuring of IPs if you wish).   Then we'll tell you if we can see 
> something missing?
> 
> Regards,
> 
> Antony.

That's actually what I wound up doing in the last post. That's all the rules
on the box save for a few NAT entries which I just commented out. Commenting
them out and re-running the file didn't do anything. I'm at my wits end. 

--
Northern Indiana ESC
Adam Kennedy - akennedy@niesc.k12.in.us
Linux Specialist / Network Administrator
Phone: (574) 254-0111 x113
Toll Free: 800-326-5642
Fax: (574) 254-0148


