From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: "Lending an internet connection"
Date: Sat, 28 Sep 2002 20:14:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020928191437.NJRG6699.mta01-svc.ntlworld.com@there>
References: <20020928183518.5187.qmail@web21510.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20020928183518.5187.qmail@web21510.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Saturday 28 September 2002 7:35 pm, Sebastian Edman wrote:

> Hi,
>
> I have a brother that has an internet connection with a static public IP
> (217.x.x.139). He is running windows and I want to place a linux-server at
> his house, and only take ports 22, 25 and 80 from him. The best way I can
> see to accomplish that is to place the linux-server between his computer
> (running windows) and his ISP, in such a way so that no change is
> neccessary on his computer.
>
> ISP ------- (eth0) Linux-server (eth1) ------- (eth2) Windows machine
>
> (eth2) is configured with the static public IP from the ISP (217.x.x.139)
> and has gateway 217.x.x.1 and DNS servers 212.x.x.2 and 212.x.x.3.
>
> I run LFS (www.linuxfromscratch.org) on the linux-server and I consider my
> skills in iptables enough to write the rules. The problem is that I do not
> know how to tackle this problem. What IP addresses should I choose for the
> linux-server, and what IP addresses should I forward?

I don't think you can do it.

You're trying to set up two machines, connected on a network, with only a 
single IP address.   There's no way they'd be able to communicate.

You can't put the public IP address 217.x.x.139 on eth0 because then eth1 
wouldn't talk to the Windows machine.

You can't put anything other than 217.x.x.139 on eth0 because then the ISP 
wouldn't talk to it.

You'll just have to put 217.x.x.139 onto eth0, put a private network between 
eth1 and the Windows machine, and do the standard NAT thing.....


Antony.

-- 

Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

