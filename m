From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: LAN accessing DMZ
Date: Sun, 18 Jul 2004 18:59:47 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407181859.47417.Antony@Soft-Solutions.co.uk>
References: <f51b72bc040718062373640612@mail.gmail.com> <200407181812.31070.Antony@Soft-Solutions.co.uk> <20040718173937.GA31408@tranquility.scriptkitchen.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040718173937.GA31408@tranquility.scriptkitchen.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sunday 18 July 2004 6:39 pm, Payal Rathod wrote:

> I do not have access to that machine till tomorrow. But I have copied the
> firewall script at http://payal.staticky.com/fw2.txt

I do not understand how you can connect through this ruleset to TCP port 10000 
from anywhere.

I look forward to the ruleset listing with packet counters.

Please make sure you also post the following information:

1. The IP address of the machine you are connecting *from* to TCP port 10000.

2. The IP address of the machine you are connecting *to* on TCP port 10000.

3. The network info for each subnet connected to the firewall.

(By the way, there is a problem, probably unimportant, but worth correcting 
anyway, with the "-s 10.10.10.0/255.0.0.0" in your ruleset.   The address 
should not contain more 1-bits than the netmask, therefore this should either 
be "-s 10.10.10.0/255.255.255.0" or else "-s 10.0.0.0/255.0.0.0", depending 
on which netmask is correct for your subnet.)

Regards,

Antony.

-- 
These clients are often infected by viruses or other malware and need to be 
fixed.  If not, the user at that client needs to be fixed...

 - Henrik Nordstrom, on Squid users' mailing list

                                                     Please reply to the list;
                                                           please don't CC me.


