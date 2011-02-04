From: Optimum Wireless Services <wilson@optimumwireless.com>
Subject: Re: How can I test my tc script?
Date: Fri, 04 Feb 2011 15:57:35 -0400
Message-ID: <1296849455.3644.25.camel@debian-laptop.OptimumWireless>
References: <1296699466.4606.14.camel@debian-laptop.OptimumWireless>
	 <20110203120131.38cd818d@catus>
	 <1296827153.3644.7.camel@debian-laptop.OptimumWireless>
	 <1296838192.3644.20.camel@debian-laptop.OptimumWireless>
Reply-To: wilson@optimumwireless.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1296838192.3644.20.camel@debian-laptop.OptimumWireless>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi, is me once again.

I tried this for a test box and the download speed worked correctly:

$tc qdisc del dev eth0 root
$tc class del dev eth0

$tc qdisc add dev eth0 root handle 1: htb r2q 1

$tc class add dev eth0 parent 1:0  classid 1:1 htb rate 3000kbit ceil
3000kbit

$tc class add dev eth0 parent 1:1 classid 1:100 htb rate 256kbit ceil
256kbit prio 3

$tc filter add dev eth0 parent 1: protocol ip u32 match ip dst
172.16.254.1/32 classid 1:100

$tc qdisc add dev eth0 parent 1:100 handle 100: sfq perturb 2


So, are these ruleset more convenient than the one I currently have?






On Fri, 2011-02-04 at 12:49 -0400, Optimum Wireless Services wrote:
> $tc qdisc del dev eth0 root
> $tc qdisc add dev eth0 root handle 1: htb r2q 1
> 
> # this is the parent class
> $tc class add dev eth0 parent 1:0  classid 1:1 htb rate 3000kbit ceil
> 3000kbit
> 
> 
> 
> ## I would like to assign users 256kbit for download speed, so the
> following rule is a leaf of the parent 1:0 (correct me if wrong,
> please)
> 
> $tc class   add dev eth0 parent 1:100    classid 1:1 htb rate 256kbit
> ceil 256kbit prio 3
> 
> ## Now I should create a filter for the ip address:
> 
> $tc filter add dev eth0 parent 1:100 protocol ip u32 match ip dst
> 172.16.100.1/32 classid 1:1
> 
> ## Now for the qdisc
> $tc qdisc add dev eth0 parent 1:100 handle 500: sfq perturb 2
> 
> Are the parent values correct on the filter,class, and qdisc?
> 
> Is this correct? Am I in the right path?
> 
> Thanks in advanced for taking your time to help me.

