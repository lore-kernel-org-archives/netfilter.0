From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Understanding how nat works
Date: Tue, 21 Sep 2004 09:47:56 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41503F1C.6060406@pbl.ca>
References: <20040921140258.75515.qmail@web51307.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040921140258.75515.qmail@web51307.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Dominic Iadicicco wrote:
> Hello all,
> 
> I am new at iptables and am tring to learn for furture
> projects. For an expirement I tried this.
> 
> "iptables -t nat -A POSTROUTING -s 172.16.12.131 -o
> eth0 -j SNAT --to 172.16.12.167"
> 
> This is all on a 172.16.12.x subnet.
> 
> from the same machine I then tried to ping
> 172.16.12.200 and I got nowhere.  When I deleted the
> rule it worked fine.  

What machine has 172.16.12.167?  Usually you should SNAT only to address 
that is assigned to the machine/interface where you SNATing.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

