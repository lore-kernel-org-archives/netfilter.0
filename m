From: James Morris <jmorris@intercode.com.au>
Subject: Re: FYI: QUEUE & ipqmpd bugs
Date: Sat, 6 Jul 2002 02:12:01 +1000 (EST)
Sender: netfilter-admin@lists.samba.org
Message-ID: <ag4gim$3mn$2@main.gmane.org>
References: <003301c2242d$7fca2e40$0689cb8a@etbx180>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <003301c2242d$7fca2e40$0689cb8a@etbx180>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Michel Hemstedt <jean-michel.hemstedt@alcatel.be>
Cc: netfilter-devel@lists.samba.org, netfilter@lists.samba.org

On Fri, 5 Jul 2002, Jean-Michel Hemstedt wrote:

> FYI,
> 
> I upgraded to iptables-1.2.6a (user & kernel-2.4.18 patches)
> and got the following (maybe known) problems:
> 
> - QUEUE target is NOK with kernel compiled with CONFIG_IP_NF_QUEUE=m
>   => the packets are queued, but ipq_create_handle() returns 
>      "can't create netlink socket"
>      "ERROR: Unable to create netlink socket: Connection refused"
>     (problem with exported symbols?)
>   =>quick fix: compile kernel with CONFIG_IP_NF_QUEUE=y
> 

You need to explicitly load the ip_queue module.


- James
-- 
James Morris
<jmorris@intercode.com.au>



