From: "mdpeters" <michael.peters@lazarusalliance.com>
Subject: Re: transparent bridge troubles?
Date: Fri, 7 Jan 2005 19:40:48 -0500
Message-ID: <006901c4f51a$b259a230$3e0010ac@esonet18>
References: <7C9884991ADAE0479C14F10C858BCDF591E3AC@alderaan.smgtec.com><005101c4f504$7be50f20$3e0010ac@esonet18>
	<20050107221822.GA1569@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Well I did this and I guess I have a firewall problem which I guess is the 
good news and the right user group.


----- Original Message ----- 
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 07, 2005 5:18 PM
Subject: Re: transparent bridge troubles?


> On Fri, Jan 07, 2005 at 05:01:47PM -0500, mdpeters wrote:
>> Both host and target have no information about the bridge | firewall in 
>> the
>> middle.
>
> the arp caches of hosts on either side of the firewall should have
> entries for hosts on the other side though.  try and ping from a host
> on one side of the firewall to a host on the other side of the firewall.
> after the ping, type "arp -an" on the host you pinged from; if you don't
> have an entry for the host you pinged--you have a bridge problem.  if
> you do have an arp entry, but the ping didn't work--you have a firewall
> problem.
>
> -j
>
> --
> "English - Who needs that? I'm never going to England!"
>        --The Simpsons
>
> 


