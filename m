From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Printing through firewall
Date: Fri, 31 May 2002 08:23:17 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200205310723.g4V7NHA23529@Networker.rockstone.co.uk>
References: <F1140wZDyDG742l3ew10000adae@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <F1140wZDyDG742l3ew10000adae@hotmail.com>
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
To: netfilter@lists.samba.org

On Friday 31 May 2002 6:23 am, Dick Ah wrote:

> Hi,
> I have been examining the possibility of allowing some external hosts
> (red-hat 6.2 with lpd)to print to some of our internal printers
> (HP-JetDirect) through my firewall in company which firewall machine is
> red-hat 7.2 using iptables . Anyone knows which ports need to be open??

I don't know, but here's how to find out:

Put a rule near the top of your FORWARD chain:

iptables -I FORWARD -s 11.22.33.44 -d 22.33.44.55 -j LOG --log-prefix=printing

where 11.22.33.44 is the IP address of the external host trying to print, and 
22.33.44.55 is the IP address of the printer.

Then try to print, and look at the log file to see what got sent between the 
machines.

If you want to, you can always put a similar rule with the IP addresses 
reversed, to see what comes back from the printer to the host, but I doubt 
that you need that.

Once you've seen what sort of protocol (TCP or UDP hopefully) and what port 
numbers are being used, you should easily be able to create a rule to allow 
the communication.


Antony.

