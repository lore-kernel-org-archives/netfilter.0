From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: iptables abilities
Date: Thu, 22 Jan 2004 09:47:29 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089.12.75.166.13.1074782849.squirrel@nmibwkrf1.nexusmgmt.com>
References: <400FC047.4010208@objeng.ch>
    <200401221233.18553.Antony@Soft-Solutions.co.uk>
    <400FD514.9060500@objeng.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <400FD514.9060500@objeng.ch>
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
To: Sven Burgener <sburgener@objeng.ch>
Cc: netfilter@lists.netfilter.org

Is there any point at which you could use DNAT/SNAT to change each private
address to a public address? Alternately, can you build a VPN tunnel
between the two and tunnel the private addresses through the tunnel?

> Antony Stone wrote:
>>>I'm looking for a way to connect two parties (computers) that both have
>>>a private IP address.
>>>
>>>          (Internet)       (Internet)
>>>      A <------------> X <------------> B
>>>
>>>A: 192.168.1.13
>>>B: 192.168.1.99
>>>X: public IP address
>
> Isnt't there a way that both, A and B initiate a connection to X where
> the two connections are then 'merged'?
>
> Or, could B connect to X whereafter A 'hijacks' the connection between X
> and B? ;-)
>
> Cheers
> Sven
>
>


-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


