From: Arthur Kerpician <arthur@bluechip.ro>
Subject: Re: selective port forwarding
Date: Thu, 10 Jun 2004 00:59:02 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40C78826.2010402@bluechip.ro>
References: <40C7699E.7060806@bluechip.ro> <1086816900.2939.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1086816900.2939.7.camel@localhost>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org

John A. Sullivan III wrote:

>On Wed, 2004-06-09 at 15:48, Arthur Kerpician wrote:
>  
>
>>Hi,
>>I have this very simple network layout:
>>1. Firewall server (host1.domain.com) with eth1 (external static IP) and 
>>eth0 (internal IP)
>>2. The firewall server do masquerading for LAN
>>3. Other server (host2) on LAN with eth0 (internal IP)
>>So, the only external IP is on the host1.domain.com.
>>I want to forward some of the ssh traffic to host2, based on the hostname.
>>eg:
>>when trying to ssh to host1.domain.com the firewall server (host1) will 
>>reply and
>>when trying to ssh to host2.domain.com the firewall server will forward 
>>the traffic to host2 inside the LAN
>>
>>I  know that what I'm looking for has to do with DNAT, but I really 
>>don't know where to start. The DNS is configured to map host1.domain.com 
>>and host2.domain.com to the same external IP on host1.
>>
>>Thanks,
>>Arthur
>>    
>>
>If I understand you correctly, you want to access both devices from the
>Internet.  You wish to ssh host1.domain.com from the Internet and have
>the packets arrive at host and ssh host2.domain.com from the Internet
>and have host1 forward them to host2.  Both host1 and host2 resolve to
>the same public IP, let's call it x.x.x.x.
>
>If this is correct, you have a problem.  iptables will resolve the names
>when it loads but thereafter will use the IP address.  So, in effect,
>your rules will look something like:
>
>-d x.x.x.x -p 6 --dport 22 -j DNAT --to-destination $HOST2_INT_IP
>-d x.x.x.x -p 6 --dport 22 -j DNAT --to-destination $HOST1_INT_IP
>
>Notice how the matches are identical; there is no way to distinguish the
>traffic coming to the public address of host1 from the traffic coming to
>the public address of host2.  The rule that comes first will be the one
>that is always matched.
>
>You could try using a non-standard port for SSH for one of the devices
>and then map it back to SSH on the other, e.g., 
>-d x.x.x.x -p 6 --dport 22222 -j DNAT --to-destination $HOST2_INT_IP:22
>-d x.x.x.x -p 6 --dport 22 -j DNAT --to-destination $HOST1_INT_IP
>
>  
>
Using diferent ports should do it, thanks a lot.


