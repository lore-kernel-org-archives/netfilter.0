From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Problem with string
Date: 27 Feb 2003 16:36:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046356601.11465.20.camel@raylinux.internal>
References: <20030225215326.GA30804@first.knowledge.no>
	 <20030227123531.GA26259@first.knowledge.no>
	 <087d01c2de67$5461f9a0$13fcc5cb@Housecall>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <087d01c2de67$5461f9a0$13fcc5cb@Housecall>
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

On Thu, 2003-02-27 at 15:51, hare ram wrote:
> Hi all
> i have redhat 8.0 and upgraded to latest kernel
> with the following information
> Linux inca 2.4.18-24.8.0custom #4 Thu Feb 27 14:14:50 IST 2003 i686 i686
> i386 GNU/Linux
> 
> and patched with string and iptable 1.2.7a
> 
> when i try to excute the command
> 
> [root@inca extra]# iptables -I INPUT -m string --string 'cmd.exe' -j QUEUE
> iptables v1.2.7a: Couldn't load match
> `string':/usr/local/lib/iptables/libipt_string.so: cannot open shared object
> file: No such file or directory
> 
> Try `iptables -h' or 'iptables --help' for more information.
Did you recompile the iptable 127a sourcecode?

> ---
> 
> 
> when i check with modprob its accepting the module
> 
> what could be the problem
> 
> thanks
> hare
-- 


