From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: IPSec - IPTables issues
Date: Thu, 06 May 2004 10:59:28 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <409A60E0.3080304@pbl.ca>
References: <20040502155538.GD515@schottelius.org> <200405051622.26944.Antony@Soft-Solutions.co.uk> <1083773336.9138.43.camel@localhost> <200405051832.27700.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405051832.27700.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Antony Stone wrote:
> On Wednesday 05 May 2004 5:08 pm, John A. Sullivan III wrote:
>>Please pardon my ignorance; I haven't yet played with 2.6 and the native
>>IPSec.  So how does one distinguish packets which have arrived from an
>>IPSec tunnel and are now re-traversing netfilter from those which have
>>arrived unencrypted and are traversing netfilter for the first time?
> 
> That is a very good question, and one to which I am not aware of a good 
> answer.   In my (extremely limited) experience of looking at IPsec in the 2.6 
> kernels this is a major disadvantage of the design, and means it is not 
> possible to secure a VPN (by which I mean selecting which traffic is allowed 
> down it and which is not, as it was possible to do with FreeS/WAN by writing 
> netfilter rules specifying ipsecN as the output interface).

In general case, both of you are right.

However, in practice, you will always require all traffic from selected 
IP addresses to be encrypted.  After all, the original question was how 
to achieve that kind enforcement.  The solution is to enforce it by 
IPSec policy, so you do not need to worry about it when writing your 
firewall rules.  If you see unencrypted packet traversing Netfilter 
chains, than it is traversing it for the second time.  If packet arrived 
in clear text from the wire, it would be dropped by IPSec module (and it 
is irrelevant if packet is first handad to Netfilter or IPSec, in either 
case it will be dropped long before it reaches userspace or any other 
part of kernel).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

