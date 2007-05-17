From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: Questions about DHCP firewall rules
Date: Thu, 17 May 2007 10:09:21 +0200
Message-ID: <1814bfe70705170109w3676d645nb51c01413fd0e57@mail.gmail.com>
References: <461550.70641.qm@web83807.mail.sp1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=pMYledCkmW0AHVlob4J3KgnHwpAILu47QljXkzWUDGia4n3Q6ZXG0n9Fevm7HFV5NW8uUXyzQitfbGsMMMUcu6vYP/Pnx9uHtEwPMSZ8Qepdhfqnt1bFDux6hwzN1ftNZyV8DsoOcabRQaa9pxYvvlnn6rPlk6ZtrbkP05IpoWs=
In-Reply-To: <461550.70641.qm@web83807.mail.sp1.yahoo.com>
Content-Disposition: inline
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
To: Nicholas Kline <kakster7@sbcglobal.net>
Cc: netfilter@lists.netfilter.org

Hi all,
On 5/16/07, Nicholas Kline <kakster7@sbcglobal.net> wrote:
> Questions about DHCP firewall rules
>
> Greetings,
>
> I am in the process of learning Netfilter/IPtables.  I
> plan on using Netfilter/IPtables to protect my Linux
> desktop computers and servers.  We're talking
> host-based firewalls, not one firewall protecting all
> of the desktops and servers.
>
> I have a basic question I am hoping someone on this
> mailing list can answer.  I am a little confused about
> configuring Netfilter/IPtables on a Linux desktop
> computer.  Specifically, this situation:
>
> a linux desktop computer that is configured to use
> DHCP and configured to use the following rule:
>
> $IPTABLES -A INPUT -s $IP_LOCAL -j LOG --log-prefix
> "Spoofed source IP"
> $IPTABLES -A INPUT -s $IP_LOCAL -j DROP
>
> I would like to include the previous rule as part of a
> standard rule set.
>
> >From how I understand this situation, the firewall
> would have to be able to automatically detect when the
> computers IP address changes, right?  Manually
> inputting the computers IP address each time it
> changes would get really old.
>
> I'm using several books as references for learning
> Netfilter/IPtables and they discuss implementing
> "dynamic firewall scripts".  In this case, a dynamic
> firewall script that recognizes when the computers IP
> address changes.
>
> So, my questions are:
>
> 1.) If I am using a computer that is configured to
> obtain its IP address through DHCP, what firewall
> rules do I need to setup?

So, you need to allow DHCP ports that use clinet to send an request to
server and server to sent an offer to client. I do not what is
configuation of your network but in case you are implementing iptables
firewall on client then it should look like

iptables -A INPUT -p udp --dport 68 -j ACCEPT
This will accept all messages in INPUT chain that are destinated to
port 67 ( the port that is used by dhcp server to send replays to
clinets )
DHCP uses udp as transport protocol.
In OUTPUT chain you probably will not have any restriction, but in
case you have, server accepts dhcp requests on port 67.


>
> 2.) Additionally, how do I configure the firewall to
> automatically detect changes in the computers network
> configuration (IP address change, etc.)?
>

for this I think you can take that information from DHCP server or,
make some kind of logging on iptables firewall, ...

take a look at
http://iptables-tutorial.frozentux.net/iptables-tutorial.html

Regards

Elvir Kuric

> Thank you for your time,
>
> *Nick*
>
>

