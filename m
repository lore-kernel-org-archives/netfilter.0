From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: New Iptables User
Date: Wed, 31 Mar 2004 18:17:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403311817.52915.Antony@Soft-Solutions.co.uk>
References: <31251.24.206.159.242.1080752696.squirrel@mail.xoomtards.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <31251.24.206.159.242.1080752696.squirrel@mail.xoomtards.com>
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

On Wednesday 31 March 2004 6:04 pm, netfilter@xoomtards.com wrote:

> I am running redhat linux AS3 and I have uninstalled the rpm that came
> with the os... it wasn't reading the rules right. So i've installed a
> iptables 1.2.9 rpm. I really want to reinstall from source without being
> able to recompile the kernel.

Not a good idea.

If you are updating the userspace tool (iptables) you should update the kernel 
support (netfilter) to match.

> I also need to know from you all what command you want me to use in order
> post the output of iptables -L on this list for help. Basically what are
> the posting guidelines.

My personal preference (and this is not a rule for the list - feel free to do 
something other than what I say) is for the output of:
iptables -L -nvx; iptables -L -t nat -nvx

The important bit is the -v option, which tells us which interfaces your rules 
apply to, which is not apparent from the output of "iptables -L", and is very 
important.

Almost as good is the format used by iptables-save, although (again, 
personally) I find this harder to read.

Another guideline if you appear to be having problems is to try and reduce 
your ruleset to the simplest possible which displays the problem (ie: don't 
include all your anti-port-scanning rules if the problem is something to do 
with forwarding ssh).

My final request would be to make sure that we understand how you are testing 
something when it comes to telling us it doesn't work.   Recognise that when 
you say "I can't connect to my machine by ssh", we don't know if you're 
trying to connect from a machine on the local subnet, or a client halfway 
across the Internet.

Thank you very much for asking how to post to the list.

Regards,

Antony.

-- 
This is not a rehearsal.
This is Real Life.

                                                     Please reply to the list;
                                                           please don't CC me.


