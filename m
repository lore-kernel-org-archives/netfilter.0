From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: redirect (nfcan: addressed to exclusive sender for this address)
Date: Thu, 8 Mar 2007 09:50:08 -0500
Message-ID: <20070308145008.GA11462@salty>
References: <20070306094208.csonro2nwc8kogso@webmail.harrisonburg.k12.va.us>
	<45EEE4DD.9090508@gmail.com>
	<20070307115036.qfmk9u7lwkkkoskw@webmail.harrisonburg.k12.va.us>
	<45EFB4C4.9040707@gmail.com>
	<20070308063421.y4spggseocogsc48@mail.harrisonburg.k12.va.us>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20070308063421.y4spggseocogsc48@mail.harrisonburg.k12.va.us>
	(from
	+nfcan+jimlaur+67730951a3.dhottinger#harrisonburg.k12.va.us@spamgourmet.com
	on Thu, Mar 08, 2007 at 06:34:21 -0500)
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

On 2007.03.08 06:34, dhottinger@harrisonburg.k12.va.us wrote:
> Quoting Georgi Alexandrov <georgi.alexandrov@gmail.com>:
>
.....
>>>>> I would like to have any traffic destined for apple.com excluded from
>>>>> this redirect.  I cant seem to get the syntax right.  Anyone got any
>>>>> ideas?
>>>> <snip*>
>>>> 
>>>> iptables -t nat -A PREROUTING -p tcp -i $iface --dport 80 -d $apples_net
>>>> -j RETURN
>>>>
....
> 
> $IPC -t nat -A PREROUTING -p tcp -i $IF --dport 80 -d 17.250.0.0
> -j RETURN
> 
> Is not routing apple.com traffice away from my proxy.  Apple.com traffic is  
> still getting routed to proxy server.  I have the rule placed above my dnat  
> rule for the proxy.  Any other ideas?

The example was non-specific, -d $apples_net.
Your implementation, -d 17.250.0.0, is for a specific ip address.
You probably meant to specify a range.
Iptables allows you to use netmask or cidr syntax.
You can cover all of Apple with 17.0.0.0/8 for instance.

-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

