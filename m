From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: setup iptables using webmin
Date: Sat, 27 Nov 2004 08:21:21 -0500
Message-ID: <1101561681.2050.3.camel@localhost>
References: <f02e5604041127025447b8db3b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <f02e5604041127025447b8db3b@mail.gmail.com>
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
To: Varun Pabrai <varunsaa@gmail.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Sat, 2004-11-27 at 05:54, Varun Pabrai wrote:
> Hello,
>        I am new to iptables etc.
> 
> I need some help to setup iptables 
> for my server.
> 
> My server is on Mandrake 10.1 off.
> eth0 is gateway with static IP connected to 512Kbps DSL.
> eth1 is LAN.
> 
> To begin with I want to allow ftp, http , smtp and pop3 traffic.
> 
> Users should be able to browse and recieve mails on clients.
> 
> All other traffic to be blocked
> 
> Can anybody guide me howto setup iptables using packet filtering
> in webmin.
> 
> Thanks
> 
> Varun

Hello, Varun.  I've never set it up using webmin.  I have successfully
used fwbuilder (http://www.fwbuilder.org) and I know other good GUIs
have been recommended on this list.  There is a much more sophisticated
GUI in the works for much large installations (three to thousands of
gateways) but it is not yet complete (http://iscs.sourceforge.net).

If you have the time, it would still be good to learn the command line
underpinnings. There are some good tutorials in the documentation
section of http://www.netfilter.org.  I started with Oskar Andreasson's.

Good luck - John
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


