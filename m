From: "Brian Ugie" <bugie@pzs.com>
Subject: Re: iptables and DNS
Date: Tue, 04 Jun 2002 11:35:39 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <scfca615.002@pzsj-office.pzs.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
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
To: ramin@cannon.eng.us.uu.net, nickd@funkyjesus.org, netfilter@lists.samba.org

Actually iptables-save will resolve to ip when it saves regardless of
weather you created the chain with IPs or hostnames. I guess you would
never know which way I did it but I assure you that I am entering the
IPs when I create the chains.

  I feel that you are all missing what the problem is. Let me see if I
can explain it better.

The example server is NS2.pzs.com and has an ip address of 10.1.1.13

The DNS record for NS2.pzs.com is 66.126.189.37

A firewall appliance sits in front of the server and mapps the public
address to the private address. The firewall will only allow port 53
/udp/tcp traffic in. 

Now, this works fine with no iptable rules but once I add, say

iptables -A INPUT -d 10.1.1.13 -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -d 10.1.1.13 -p udp --dport 53 -j ACCEPT
iptables -P INPUT  DROP

DNS will nolonger respond on NS2. But if I go into NS1 and change the
NS2 record so that is resolves to 10.1.1.13, the above rules will work.

--Brian

>>> Ramin Alidousti <ramin@cannon.eng.us.uu.net> 06/04/02 11:09AM >>>
On Tue, Jun 04, 2002 at 06:52:23PM +0100, Nick Drage wrote:

> On Tue, Jun 04, 2002 at 10:41:58AM -0700, Brian Ugie wrote:
> > Below  is the hosts portion of nsswitch.conf.  The actual hosts
file is
> > below that. I have also included the simple config that I am using
for
> > iptables. I have seen the -n option but it is not relevant for
appending,
> > inserting or replacing. It only applies to listing (output)
> 
> Er, unless I'm missing something, you're using hostnames in your
IPTables
> rules, and then complaining that IPTables is resolving those
hostnames?

Good catch, Nick. I thought brain wanted to "-L" the iptables command
to check out the rules. In order to set the rules, follow the below
guidline.

Ramin

> 
> Excuse me if this sounds obvious, but why not use IP addresses in the
rule
> specifications.  If you're worried about having to alter all the
relevant
> rules if an IP address changes then just assign it to a variable...
> 
> #!/bin/sh -x
> 
> WEBSERVER="10.10.10.13"
> 
> iptables -A INPUT -p tcp -d $WEBSERVER --dport 80 -j ACCEPT
> iptables -A INPUT -p tcp -d $WEBSERVER -j REJECT --reject-with
tcp-reset
> 
> etc. 
> 
> <snip>
> 
> -- 
> FunkyJesus System Administration Team
> 


