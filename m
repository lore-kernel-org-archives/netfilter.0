From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: again problem with alias / virtual interface
Date: Mon, 19 Jul 2004 14:35:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FC2286.3070005@pbl.ca>
References: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108>
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

Batstru wrote:
> Hi all!
> I wrote days ago: I have a problem with virutal interface and iptables:
> my pc has 2 network interface, one with a private network address and the
> other one with 

[snip]

> -A INPUT -p tcp -m tcp -m state -i eth1:1 -d 82.186.92.91 --dport 25 --state
> NEW -j ACCEPT

And here is the error.

As me (and I believe Antony, possibly others) already told you, 
Netfilter does not know about virtual interfaces.  Virtual interfaces 
are abstractions that exist in higher levels of kernel than Netfilter 
is.  Netfilter is concerned only on which *physical* interface the 
packet is.  Replace "-i eth1:1" with "-i eth1" in above rule (and same 
for all other virtual interfaces you have) and you'll be fine:

-A INPUT -p tcp -m tcp -m state -i eth1 -d 82.186.92.91 --dport 25 
--state NEW -j ACCEPT

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

