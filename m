From: Jason Opperisano <opie@817west.com>
Subject: Re: Redirect Command
Date: Thu, 21 Apr 2005 09:41:44 -0400
Message-ID: <20050421134144.GA27813@bender.817west.com>
References: <327bfad305042106267479b9@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <327bfad305042106267479b9@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Apr 21, 2005 at 08:26:43AM -0500, Hernan Arredondo wrote:
> Hi all,
> 
> I'm new with iptables, I trying to create a rule that redirect all the
> packets that goes to the port 25 of my firewall to the port 25 in a
> Internet LAN machine, then I execute the command:
> 
> /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 25 -j DNAT
> --to 192.168.10.12:25
> 
> eth0 is the host exposed directly to Internet, and 192.168.2.12 is the
> host in the LAN.

do you also have a FORWARD rule to allow this traffic through?

  # allow stateful traffic
  iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

  # allow SMTP connections to mail server
  iptables -A FORWARD -i eth0 -p tcp --syn \
    -d 192.168.10.12 --dport 25 -j ACCEPT

> Now, this is not working, I try a telnet <eth0> 25 and nothing happen.

where are you executing the telnet from?  any answer other than "from
some host on the Internet" makes your testing methodology invalid.

-j

--
"Chris: Dad, can you help me with my math homework?
 Peter: Math. Math my dear boy is nothing more than the lesbian sister
 of biology."
        --Family Guy

