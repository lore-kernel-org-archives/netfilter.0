From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: droping too many ports
Date: Thu, 23 Sep 2004 16:14:53 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41533CCD.1060706@pbl.ca>
References: <a0f69e504092313454a9090b3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e504092313454a9090b3@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Askar wrote:
> hi all
> 
> what if I do (and im doing this from last two hours ;))
> 
> iptables -A FORWARD -p tcp --dport 31000:65500 -j DROP
> iptables -A FORWARD -p udp --dport 31000:65500 -j DROP

[snip]

> iptables -L -nvx  gives too many counts whenever I checked, especailly
> numbers are very high for UDP "udp --dport 31000:65500 -j DROP"

Depending on your other rules this might not be good idea.  Here's an 
example why.  If client connects to say your web server, it may look 
something like this:

  client sport 54321 to server dport 80     for incoming packets
  server sport 80    to client dport 54321  for outgoing packets

As you can guess by now, your rules are blocking outgoing packets of an 
perfectly legal connection.

BTW, you should really consider setting default policy to DROP, and 
allow only what you need.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

