From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Filtered Port 21 somewhat open - iptables weirdness?
Date: Sat, 24 Jan 2004 19:19:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401241919.14736.Antony@Soft-Solutions.co.uk>
References: <20040124014842.GA9219@localnet>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040124014842.GA9219@localnet>
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

On Saturday 24 January 2004 1:48 am, Sven Riedel wrote:

> Hi,
> one of the machines I administer to is running iptables with an input
> policy of drop, and allows only a few, selected services. Ftp is most
> definitely not among them, and there is no ftp server installed on the
> machine in question.

I think this last statement pretty much tells us that you are getting a 
response from somewhere other than you think.   You cannot get a response 
from a machine which is not running the service, therefore any response you 
do get must be coming from somewhere else...

> nmap -P0 -sS reports that among the expected, port 21 is open.

Where are you performing the nmap from?   What other machines are between the 
nmap machine and the one being tested?   I'm thinking of anything which might 
redirect TCP port 21 to somewhere else by DNAT, or anything which might be 
running a transparent FTP proxy?

> telnetting to port 21 shows indeed a successful connect:
> radagast@angmar:~>telnet <machine> 21
> Trying <ip>...
> Connected to <machine>

Remember that <machine> in that last line is produced by your local client, 
not by the remote server, so it is no guarantee that you are connecting to 
the system you think you are - it is merely saying that on trying to connect 
to <machine>, you get a connection to something.   It may not be a connection 
to <machine>.

> Escape character is '^]'.
> ^]
> telnet> quit
>
> But it just sits there, no welcoming banner, no response to obvious
> ascii-commands.

I bet that running ethereal on the machine you think you are ftping to (or on 
a sniffer connected to the same network cable) shows no packets.   I think 
they are being diverted elsewhere between the tester and the tested machines.

Hope these suggestions point you in a constructive direction.

Regards,

Antony.

-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing on usenet and in e-mail?

                                                     Please reply to the list;
                                                           please don't CC me.


