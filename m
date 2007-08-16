From: "pankaj jain" <jainp1979@gmail.com>
Subject: Re: not [!] rule is not working
Date: Thu, 16 Aug 2007 11:26:18 +0530
Message-ID: <d41814cf0708152256w2e5e146cs7306e9e40e3b6872@mail.gmail.com>
References: <d41814cf0708132345t45ec0be0vee36c6c88cc5088a@mail.gmail.com>
	<46C1BE08.6070409@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=oqsAYN3DkleBL0noGMABhLriwNU25bbmRvu+qMe/944LK0b4IhpMqcghfpou5IRdqhPmRmsX7xN6JnZQ94SRwcjWWjEKQkFI95MjmqMHnOhcoXQu3yB8z5k+bMIqrO5bP4cDLWvyoHIOoCl16+MKFMZCSgLUUbzOS4lQMNLbKN4=
In-Reply-To: <46C1BE08.6070409@riverviewtech.net>
Content-Disposition: inline
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
To: gtaylor+reply@riverviewtech.net
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 8/14/07, Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 08/14/07 01:45, pankaj jain wrote:
> > I was trying to drop arp packets such that only specific interface
> > should answer the arp requests.
>
> Will you please elaborate a bit more on why you are trying to accomplish
> this and what your situation is?  I feel like there is more to this
> puzzle that will help us help you.  For example, do you have multiple
> (VLAN) physical interfaces on the same subnet or do you have an overly
> large netmask that encompasses both IPs in your post?
>
>
>
> Grant. . . .
>
>

I have a machine with 3 interfaces
eth0: 10.19.0.102 mask (255.255.255.0)
eth1: 10.19.1.102 mask (255.255.255.0)
eth2: 10.29.51.102 mask (255.255.255.0)

all three are connected in a same switch (no vlans configured).
I want arp requests to be responded by the associated interface only,
and not by other interfaces.
I have added following rules.
arptables -A INPUT -i eth0 --opcode Request -d 10.19.0.102 -j ACCEPT
arptables -A INPUT -i eth1 --opcode Request -d 10.19.1.102 -j ACCEPT
arptables -A INPUT -i eth2 --opcode Request -d 10.19.51.102 -j ACCEPT
arptables -A INPUT -i !eth0 --opcode Request -d 10.19.0.102 -j DROP
arptables -A INPUT -i !eth1 --opcode Request -d 10.19.1.102 -j DROP
arptables -A INPUT -i !eth2 --opcode Request -d 10.19.51.102 -j DROP

DROP rules with [!] are not working.
but if I remove the interface part it works fine
arptables -A INPUT -i eth0 --opcode Request -d 10.19.0.102 -j ACCEPT
arptables -A INPUT -i eth1 --opcode Request -d 10.19.1.102 -j ACCEPT
arptables -A INPUT -i eth2 --opcode Request -d 10.19.51.102 -j ACCEPT
arptables -A INPUT  --opcode Request -d 10.19.0.102 -j DROP
arptables -A INPUT  --opcode Request -d 10.19.1.102 -j DROP
arptables -A INPUT  --opcode Request -d 10.19.51.102 -j DROP


-- 
Thanks
Pankaj Jain

