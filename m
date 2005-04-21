From: "Vernon A. Fort" <vfort@provident-solutions.com>
Subject: Re: Redirect Command
Date: Thu, 21 Apr 2005 08:58:21 -0500
Message-ID: <4267B17D.5000700@provident-solutions.com>
References: <327bfad305042106267479b9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <327bfad305042106267479b9@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hernan Arredondo wrote:

>Hi all,
>
>I'm new with iptables, I trying to create a rule that redirect all the
>packets that goes to the port 25 of my firewall to the port 25 in a
>Internet LAN machine, then I execute the command:
>
>/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j DNAT
>--to 192.168.10.12:25
>
>eth0 is the host exposed directly to Internet, and 192.168.2.12 is the
>host in the LAN.
>  
>
You should also have a FORWARD rule:
    /sbin/iptables -A FORWARD -p tcp -d 192.168.10.12 --dport 25 -j ACCEPT

Vernon

