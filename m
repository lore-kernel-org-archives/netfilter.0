From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: General Ports
Date: Fri, 27 Feb 2004 20:05:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402272005.37354.Antony@Soft-Solutions.co.uk>
References: <20040227022305.99743.qmail@web21106.mail.yahoo.com> <003501c3fd6b$236d27b0$5b65810a@tsr1>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003501c3fd6b$236d27b0$5b65810a@tsr1>
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

On Friday 27 February 2004 7:50 pm, Chris Godwin wrote:

> Hello My name is Chris,
>
> I'm new to linux and iptables and I've just started running qmail and
> vpopmail.

There is a lot of good documentation about netfilter which I recommend you 
read - try Oskar Andreasson's tutorial at 
http://iptables-tutorial.frozentux.net

> :OUTPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :INPUT ACCEPT [0:0]
>
> # allow only on the ports that internet services listen to
> -A INPUT -p tcp -m tcp -m multiport -j ACCEPT --dports
> 21,22,25,80,110,143,3306 # all my internet server ports
> -A INPUT -p tcp -m tcp --dport 30000:31000 -j ACCEPT # ports for passive
> ftp transfer
> -A INPUT -p tcp -j DROP kill everything else
> COMMIT
> # Completed on Tue Feb 24 20:53:02 2004

When you have questions for the list in future, please post either the 
iptables commands which you enter in order to create your rules, or else the 
output of "iptables -L -nvx; iptables -L -t nat -nvx" - either of these 
provides a rather easier format for us to understand your ruleset when it 
gets a bit bigger.

No problem this time round, though - this is a request, not a criticism.

> HERE'S MY QUESTION:
> What are some ports I need to have open for usuall networking functions...
> like looking up hostnames and what not... as of right now with iptables and
> the current iptables file qmail doens't accept or send mail and the server
> cannot lookup hostnames or cannot connect to http or ftp servers via wget
> or lynx... the server is running redhat 7.3

Well, looking up hostnames is done using DNS (Domain Name Service) which 
operates on TCP and UDP ports 53.

However, if you are talking about the machine with the netfilter rules on it 
being able to make outbound connections, you have a default ACCEPT policy on 
your OUTPUT chain, so all packets are allowed.   You only need to add a 
single rule to your INPUT chain for the replies, and I think almost 
everything you want will start working:

iptables -I INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

Once you have this rule (and assuming you have compiled in, or loaded the 
module for ftp support), you can get rid of your second rule in the INPUT 
chain, because both passive and active ftp will simply work :)

By the way, please set your default policy on INPUT and FORWARD to DROP (and 
then add rules which allow the packets you know you want).   This is a tip 
for good security practice - allow what you want, and block anything else.

Regards,

Antony.

-- 
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the list;
                                                           please don't CC me.


