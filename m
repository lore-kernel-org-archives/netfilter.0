From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: TCP SYN FIN
Date: Fri, 2 Jul 2004 13:41:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407021341.39426.Antony@Soft-Solutions.co.uk>
References: <40E554BE.1010402@4Dllc.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E554BE.1010402@4Dllc.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Friday 02 July 2004 1:27 pm, Steve Comfort wrote:

> Hi All,
>
> I'm running Nessus to check my firewall rules, and its telling me :
>
> "remote host does not drop TCP SYN packets with the FIN flag set .... "
>
> I've tried adding the following rule :
>
> $ipt -A INPUT -i $iface -d $network -p tcp --tcp-flags SYN,FIN SYN, FIN
> -j DROP

What does the variable $network corresopond to in the above rule?

Does the address you are sending the SYN-FIN packets to fall within this 
range?

If you do a "iptables -L INPUT -nvx" do the packet & byte counters show any 
packets matching the above rule?

Regards,

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


