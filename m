From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: bandwidth usage
Date: Mon, 8 Jul 2002 12:10:12 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200207081110.g68BAI806457@vulcan.rissington.net>
References: <02070816263800.01547@sanitarium>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <02070816263800.01547@sanitarium>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Monday 08 July 2002 11:56 am, Rohan Almeida wrote:

> Hi List,
> How do i get the bandwidth usage of a particular IP address, on a m/c which
> is performing NAT?
> Can i use netstat? or maybe iptables?
> Is there any tool available.
> I tried iptraf, but its too much informative for me.   I just need to show
> current bandwdith usage for 1 or more ips

Netfilter will help you track the number of packets & bytes sent to/from a 
specific IP address, but you'll have to check the numbers at regular 
intervals (eg a cron job once a minute ?) in order to convert this to 
bandwidth.

Just create some rules such as:

iptables -A FORWARD -s a.b.c.d
iptables -A FORWARD -d a.b.c.d

(Yes, that's correct, you don't have to have a target to jump to if you don't 
want one...)

where a.b.c.d is the IP address you're interested in, and then use

iptables -L FORWARD -n -v -x

to see the packet & byte counters.

 

Antony.

