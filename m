From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: Many Many table rules
Date: Wed, 15 Sep 2004 10:57:42 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41486676.9000807@pbl.ca>
References: <d82fbdb70409141006173a23f2@mail.gmail.com>	<41474555.1030207@pbl.ca>
	<d82fbdb70409150521fa65d77@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <d82fbdb70409150521fa65d77@mail.gmail.com>
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

Michael Eck wrote:
> Your first suggestion would, in my case, work better by first matching
> by IP.  How much performance gain would I really achieve?  Is there a
> way to quantify the impact that a given number of rules would have? 
> In other words, is the difference between 200 and 1000 rules dramatic?

Depends on the speed of CPU, number and speed of network devices, and 
ammount and type of traffic.  Software router/firewall can cope quite 
well with multiple 100 MBps average office networks.  On the other hand 
multiple heavily loaded gigabit interfaces can place really high load on 
software routers/firewalls.  That is where Cisco comes into play with 
high-end hardware based routers.  One way to tell is to monitor how much 
time is your CPU spends in idle state.  Is it like 90 or 99%.  Or is it 
closer to 10, 5 or 0%.  In the later case, anything you can optimize 
will show up dramatically.

If you already implemented my second suggestion, than answer is probably 
not much.  Since most of your packets are going to be matched/accepted 
by the time they reach your rule number 2.  Apart that lag inserted by 
your firewall during connection establishing will be ~4-5 times shorter 
(these packets have to go through either 200 or 1000 rules, instead of 
just 2 rules that second and subsequent packets will go through).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

