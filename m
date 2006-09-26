From: Nathan <lists@netdigix.com>
Subject: Re: Accepting Forwaded Packets
Date: Tue, 26 Sep 2006 12:35:36 -0700
Message-ID: <1159299336.451981089ec40@mail.dreamtoy.net>
References: <bd573cf00609261015x676fc64au453fbe6fe9f458a8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <bd573cf00609261015x676fc64au453fbe6fe9f458a8@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Ranjith Kumar <ranjitbat@gmail.com>
Cc: netfilter@lists.netfilter.org

what are the NAT commands you are using? you want the DNAT and SNAT somthing 
like this:

iptables -t nat -A PREROUTING -d 1.1.1.1 -j DNAT --to 10.10.10.10


Quoting Ranjith Kumar <ranjitbat@gmail.com>:

> Hi All,
> 
> I have a Windows server 2003 installed, infront of my mail server. The
> windows server is connected to internet and this is acting as
> relayhost to my Linux mail server. I enabled NAT on the windows
> firewall and forwarding pop3 and imap ports to Linux machine. But I am
> not able to access pop3 or imap from the internet.
> 
> Do I need to add any commands to my iptables to accept the
> natted/forwarded packets?
> 
> Thanks & Regards
> Ranjith Kumar.
> 




Thanks

- Nathan
- http://www.linuxcare.ca


