From: George Georgalis <georgw@galis.org>
Subject: Re: IP Aliasing
Date: Fri, 31 May 2002 13:18:49 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020531131849.C17865@trot.haven.dom>
References: <Pine.LNX.4.04.10205311254170.5797-100000@lysa>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.04.10205311254170.5797-100000@lysa>; from mmontero@mail.communityconnect.com on Fri, May 31, 2002 at 12:55:57PM -0400
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
Content-Transfer-Encoding: 7bit
To: Michael Montero <mmontero@mail.communityconnect.com>
Cc: netfilter@lists.samba.org

On Fri, May 31, 2002 at 12:55:57PM -0400, Michael Montero wrote:
>I'm trying to set up 2 IP aliases on my firewall box.  It's Redhat 7.2.  I
>believe I have the 2 alias (eth0:0 and eth0:1) set up properly.  Is there
>anything in particular I need to do with iptables to activate these 2
>interfaces?  I've attempted to execute rules with the interface specified
>as eth0:0 and iptables does not seem to like that.  Anyone have any docs I
>can read about proper IP aliasing under Redhat and what I need to do for
>iptables?
>

I would try '-i eth0' for all you aliases and use '-i/-o address[/mask]'
if you refer to a particular subnet. Reasoning: the interface is being
aliased and iptables sees them all as eth0.

Let me know if this works ;^) I'll be trying it shortly.

// George

-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


