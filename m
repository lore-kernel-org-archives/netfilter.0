From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: icmp redirect
Date: Wed, 10 Jul 2002 18:46:32 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020710174901.LOAD23840.mta03-svc.ntlworld.com@there>
References: <0207101911210A.04513@Lms>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <0207101911210A.04513@Lms>
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

On Wednesday 10 July 2002 6:11 pm, Jan Humme wrote:

> I am developing an application that will eventually run on a PC with two
> ethernet cards; unfortunately the development PC that I use has only one
> ethernet card (eth0) and no available slots (except for one that I need for
> another purpose).
>
> Doesn't matter, during the development I can have both applications use
> eth0 instead, if I can only stop the icmp redirect messages that the kernel
> sends back to the source, whenever it finds out that it is forwarding a
> packet via the same eth0 interface on which it came in.
>
> Of course, I can choke the icmp redirect message using iptables, but is
> there a better (proper) way, to prevent the message from being generated?

Does it help if you put two addresses onto eth0 from different subnets (eg 
192.168.0.1 and 172.16.0.1) so that icmp redirect is no longer appropriate 
(because this is used only between machines on a single subnet) ?

Then your other machines which are talking to it can pretend that one address 
is eth0 and the other address is eth1.

 

Antony.

