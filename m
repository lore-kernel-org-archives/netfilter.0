From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: connection and bandwidth monitoring program
Date: Sat, 2 Aug 2003 15:02:47 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FDEMKKNJDLAJDPNDPCDDKEDGNFAA.georgev@citadelcomputer.com.au>
References: <5.2.0.9.0.20030801215222.02d60e30@198.52.32.246>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.0.20030801215222.02d60e30@198.52.32.246>
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

I use MRTG though it's not realtime but at least I can map rules to graphs.
I record everything to MySQL incase of reboots etc which lose the byte
counts on rules so it gets rid of that problem..

realtime would have to be ntop or packet sniffing use ethereal or something.

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Tomasz Korycki
Sent: Saturday, August 02, 2003 11:53 AM
To: netfilter@lists.netfilter.org
Subject: Re: connection and bandwidth monitoring program


At 05:45 2003-08-01, you wrote:
>Hello,
>I looking for a connection and bandwidth monitoring program. I found one at
>http://www.student.lu.se/~nbi98oli/connmon.html but there are no new
>developements. It isn't possible for each nat computer to see the total
>in/out curent traffic.
>I would like to find a client-server program, with a win32 or java or
applet
>client.
>does someone know an alternative?
>sincerly yours
>Olivier

Maybe try ntop (ntop.org)? It does a lot of other things, but that too.





