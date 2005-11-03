From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Re: iptables problem (nfcan: addressed to exclusive
	sender for this address)
Date: Thu, 3 Nov 2005 10:21:58 -0500
Message-ID: <20051103152158.GA14687@salty>
References: <20051103062533.C48C96AA57@smtp.sterenborg.info>
	<4369B1F2.50804@pcraft.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4369B1F2.50804@pcraft.com> (from
	+nfcan+jimlaur+656ad77fee.ashley#pcraft.com@spamgourmet.com on
	Thu, Nov 03, 2005 at 01:45:06 -0500)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.11.03 01:45, Ashley M. Kirchner - ashley@pcraft.com wrote:
> 
>> Maybe you can let the kiosk hosts connect to the server and perform GET
>> and PUT commands. The server then only has to put the needed updates in
>> a specific directory where the kiosk hosts can download them from. This
>> way the hosts themselves don't have to be reachable on the internet
>> which would be better from a security point of view.
>>
>    Thanks for the explanation Rob.
> 
>    I can't control what happens on the serverside.  That's a third party  
> company.  I figured regardless of me being able to forward port 21 to one of  
> these machines without a problem, I can't do it for all three.  So I think  
> I'm screwed either way.  Grrr...

OK, here is how I understand your situation:
Each kiosk must have a distinct identity to the outside service.
A kiosk must play the role of an ftp server.
A server has to listen on a well known port.
The outside system can only use the standard ftp port.
(This does seem a rather inflexible design, but ...)
The only other way to distinguish servers is the IP address.

So, maybe you can get more IP addresses.

Some ISP's allow you to have more than one public IP.
(Sometimes they want a few bucks extra rent :-)

You can arrange to have the firewall in question
respond to 3 IP addresses on the outside interface and
forward the now distinct traffic to the 3 kiosks.
If this is possible, it might be better than being screwed.

HTH

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

