From: codewarrior@cuseeme.de
Subject: Re: Stateless NAT
Date: Wed, 8 Jun 2005 09:20:57 +0200
Message-ID: <9D532201-8173-474B-8281-1FA274AFC243@cuseeme.de>
References: <OF7FD36B55.0277057F-ONC125701A.00258ADF-C125701A.00262725@team4.de>
Mime-Version: 1.0 (Apple Message framework v730)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <OF7FD36B55.0277057F-ONC125701A.00258ADF-C125701A.00262725@team4.de>
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: NetFilter <netfilter@lists.netfilter.org>


On Jun 8, 2005, at 8:56 AM, Guenter.Sprakties@team4.de wrote:
>> You don't use netfilter. You use iproute2.
>>
>> http://linux-ip.net/html/nat-stateless.html
> First your right, iproute2 is the best tool managing simple 1:1 NAT.
> Second, is doesn't work because some guys decided to remove the  
> necessary
> code out of the kernel.
> So you HAVE to use netfolter, and I tell you:
> First again, it didn't work. Second, no one of the guys out there  
> helps
> you. I tried to get help, but nothing happend.
> I think, natting is against their religion or something like this.
> Take an old kernel and use iproute2, the most genial tool in all  
> the net
> stuff.


hello guenter,

thanks you for your answer , so i heard that it is
not possible to run iproute2 under osx right ?

i got a script from my ISP
http://www.xaranet.de/dl/xaranet-tunnel.sh

but you need iproute2  so there is no way  ?


regards

marc


********************************************************
opencuseeme /  peer2peer multiparty conferencing
********************************************************
Marc Manthey
D - 50672 Cologne
West Europe
office: 0049.221.355.80.32
mobile: 0049.177.341.54.81
www.let.de
www.applehelpers.com
aim://macfreak2004
macfreak@jabber.org





