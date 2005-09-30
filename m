From: sebastian.ionita@focomunicatii.ro
Subject: Re: Iptables and vlan interfaces
Date: Fri, 30 Sep 2005 15:54:27 +0300
Message-ID: <20050930125427.28160.qmail@focomunicatii.ro>
References: <20050930112129.19898.qmail@focomunicatii.ro>
	<Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

Henrik Nordstrom writes: 

> On Fri, 30 Sep 2005 sebastian.ionita@focomunicatii.ro wrote: 
> 
>> Why doesn't iptables works with vlans interfaces? iptables -t mangle -A 
>> FORWARD -i eth0 -o eth1.11 -j MARK --set-mark 4
>> Gives me the error:
>> host/network eth1.11 not found.
> 
> Sounds like there may be a bug in your iptables command. 
> 
> Are you sure the command line given above is what you tried to use? The 
> error seems to suggest a -s/-d option was used instead of -o.

You are right .. it was my mistake .. :)). In the shell i typed the wrong 
command, but when I wrote the e-mail I write the correct commnad. Sorry for 
that. 

Seby, 


