From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: allowing packets from dynamic-dns IP
Date: Sat, 26 Apr 2008 14:25:04 -0500
Message-ID: <48138190.8030305@riverviewtech.net>
References: <f36b08ee0804260934r3dc8be71hbd453dfc11e377f9@mail.gmail.com> <alpine.LNX.1.10.0804262016000.20150@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0804262016000.20150@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 4/26/2008 1:16 PM, Jan Engelhardt wrote:
> The best solution is a script that runs after the interface was 
> brought up. Usually this is -- depending on distro -- in 
> /etc/sysconfig/network/if-up.d/.

I took the OP's question to be how does the static IP destination system 
adjust rules to allow a dynamic IP source system in based on the dynamic 
IP, not how does the dynamic IP system update its rules.  If the latter 
is the case, what you suggest will work great.

I think I would be tempted to use port knocking to initiate updating the 
IPTables rules.  I.e. have the dynamic system connect on a range of 
ports that will then trigger the firewall to do a DNS query and then 
update the firewall rules if need be.  I would never update the firewall 
rules based on the source IP of the knock.  I would be much more 
comfortable initiating a DNS query and trusting the query results than I 
would the arbitrary source of the port knock.

I also would be tempted to check the result of the DNS query against the 
currently allowed IP address and only change the IPTables rule if the IP 
changes.



Grant. . . .
