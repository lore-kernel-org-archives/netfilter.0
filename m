From: "hare ram" <hareram@sol.net.in>
Subject: Re: [LARTC] Performanace fo the Iptables Server
Date: Tue, 2 Sep 2003 15:38:39 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002601c3713a$2f112340$c2bf09ca__34138.6772845455$1062575872@Housecall>
References: <019f01c36c5e$9f7868e0$c2bf09ca@Housecall> <200308271730.07228.stef.coene@docum.org> <011601c36cbd$185a5da0$c2bf09ca@Housecall> <200308271917.00121.stef.coene@docum.org>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Stef Coene <stef.coene@docum.org>, netfilter@lists.samba.org
Cc: lartc@mailman.ds9a.nl

Hi Stef

regarding the same topic
if i use

iptables -A INPUT -s 192.168.2.1

iam able to capture packets going fro 192.168.2.1 to any address

how about any address coming to 192.168.2.1
this will be added in to same  rule

or i need to add another Rule

iptables -A INPUT -d 192.168.2.1

hare
----- Original Message -----
From: "Stef Coene" <stef.coene@docum.org>
To: "hare ram" <hareram@sol.net.in>; <netfilter@lists.samba.org>
Cc: <lartc@mailman.ds9a.nl>
Sent: Wednesday, August 27, 2003 10:47 PM
Subject: Re: [LARTC] Performanace fo the Iptables Server


> On Wednesday 27 August 2003 19:03, hare ram wrote:
> > Hi Stef
> >
> > thanks for the reply
> >
> > yes i would like to do accounting the source IP
> > so i need to log them all the traffic,
> > so i will know each IP how much transfering DATA
> >
> > with my configuration, is there any performance issue
> > i may have more than thousands of passing through this firewall or qos
> > server
> >
> > so my PC will have any performance issue or,
> > this configuration need any modification
> You don't have to log each packet to do accounting.  If you create 1
iptables
> rule for each src address, you know how many packets and bytes that that
src
> address transmitted.
>
> iptables -A INPUT -s 192.168.1.0
> iptables -A INPUT -s 192.168.1.1
> iptables -A INPUT -s 192.168.1.2
>
> iptables -L -v -n
> Chain INPUT (policy DROP 47 packets, 5842 bytes)
>  pkts bytes target     prot opt in     out     source   destination
>     0     0            all  --  *      *       192.168.1.0
0.0.0.0/0
>     0     0            all  --  *      *       192.168.1.1
0.0.0.0/0
>     0     0            all  --  *      *       192.168.1.2
0.0.0.0/0
>
> Stef
>
> --
>
> stef.coene@docum.org
>  "Using Linux as bandwidth manager"
>      http://www.docum.org/
>      #lartc @ irc.oftc.net
>
>
>


