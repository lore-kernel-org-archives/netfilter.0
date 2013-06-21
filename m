From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Routing Question
Date: Fri, 21 Jun 2013 12:07:40 -0500
Message-ID: <20130621170740.GC4182@harrier.slackbuilds.org>
References: <46449.69.21.103.130.1371828893.squirrel@ameliaschools.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46449.69.21.103.130.1371828893.squirrel@ameliaschools.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Fri, Jun 21, 2013 at 11:34:53AM -0400, Bo Lynch wrote:
> I have an iptables firewall/router with 2 NICS and one alias setup. 
> What I am trying to accomplish is route traffic coming in off the 
> alias to an internal server ip address. All normal web traffic goes 
> through eth1 and out eth0.
> 
> eth0 = external interface 69.21.X.1
> eth0:1 external interface 69.21.X.2

Just say NO to ifconfig:

    http://inai.de/2008/02/19

> eth1 = internal interface 192.168.1.1
> 
> My iptables script looks like this....

Scripts are also a bad idea, switch to iptables-restore(8):

    http://inai.de/documents/Perfect_Ruleset.pdf

> echo "1" > /proc/sys/net/ipv4/ip_forward
> 
> iptables -A INPUT -i eth1 -j ACCEPT
> iptables -A INPUT -i eth0:1 -j ACCEPT
> iptables -A OUTPUT -o eth0:1 -j ACCEPT
snip
> Having a hard time figuring out what Im doing wrong with this.
> Any help would be greatly appreciated.

As covered in the first link, you have been deluded by your 
ifconfig(8) output: eth0:1 is a label, not an interface. That will 
never match anything (unless you created an interface by that name, 
which you could, and it would help wean you off of ifconfig. :) )

Match your packets using -i/-o eth0 and -d/-s 69.21.X.2 .
-- 
  http://rob0.nodns4.us/ -- system administration and consulting
  Offlist GMX mail is seen only if "/dev/rob0" is in the Subject:
