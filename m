From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Virtual Hosts
Date: Fri, 31 May 2002 08:11:16 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020531121116.GA5481@cannon.eng.us.uu.net>
References: <3CF7298B.6010506@globit.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3CF7298B.6010506@globit.com>
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
To: Uwe Eisner <Uwe.Eisner@globit.com>
Cc: netfilter@lists.samba.org

On Fri, May 31, 2002 at 09:43:07AM +0200, Uwe Eisner wrote:

> Hi @ all,
> 
> I am starting set up a iptables based firewall (iptables v1.2.5) on a 
> Suse Linux 8.0prof machine.
> I created a virtual host an eth0, which is eth0:1.
> 
> The situation is, that the firewall is a zebra OSPFD-Router (verson 
> 0.92a), too. And the machine needs a public IP-Address at the internal 

Why?

> interface as well. How ever, I would like to use internal ip-stack at my 
> network, wherefor I need a virtual host, needn't I?

You can use iproute2 to set multiple ip's on an interface.

> 
> I have same roule at iptables like:
> iptables -A FORWARD -d 192.168.0.0/16 -i eth0:1 -j ACCEPT
> 
> The script stoped with following error:
> Warning: wierd chracter in interface 'eth0:1' (No aliases, :, ! or *)

I believe that the newer iptables versions do not have this problem.

Ramin

> 
> In same list, it is mentioned, that it works, other guys say, it works not..
> 
> Hope sameone can help me..
> 
> Thx and best reguards
> Uwe Eisner
> 

