From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: again problem with alias / virtual interface
Date: Wed, 21 Jul 2004 12:13:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40FEA42C.3050006@pbl.ca>
References: <007d01c46dae$0a45f330$eb53623e@x> <Pine.LNX.4.44.0407211707490.31223-100000@Megathlon.ESI> <20040721114840.G9160@net.tamu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040721114840.G9160@net.tamu.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Michael Sconzo wrote:
> On Wed, Jul 21, 2004 at 05:34:29PM +0200, Marco Colombo wrote:
> 
> 
>>But the whole idea of 'virtual interfaces' is obsolete. The linux kernel
>>(and thus iptables) knows only of physical interfaces and ip addresses.
>>You can set a label for each ip address, but that's only a trick to make
>>the old ifconfig work. Labels are, well, just labels, the kernel doesn't
>>need them at all. If you're using 'ip' to configure ip addresses, you
>>can forget about labels (but ifconfig won't work).
>>
> What is the proper way to do it, tried poking around on google, maybe
> I'm just looking for the wrong thing.  Or is it even a proper way to do
> it?  I have a box that is using kernel bridging so I have an IP on the 
> bridged interface, but would like to have it accessable via another IP 
> as well.

IMHO, the proper way of doing it is using configuration files.  And let 
the init.d scripts configure your interfaces (majority of which still 
use good old ifconfig).

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

