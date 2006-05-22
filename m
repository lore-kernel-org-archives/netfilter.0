From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Transparent proxy using squid, redirect all ssl/https ... ?
Date: Mon, 22 May 2006 20:26:34 +0200
Message-ID: <4472025A.1050709@rtij.nl>
References: <b4a631130605211917t7a747ceeo6d9f22b067d67466@mail.gmail.com>	<8963106281166041607@unknownmsgid>
	<b4a631130605220452i18a16d12tbb97a35433ebda9b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b4a631130605220452i18a16d12tbb97a35433ebda9b@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Elijah Alcantara <elijah.alcantara@gmail.com>
Cc: netfilter@lists.netfilter.org

Elijah Alcantara wrote:

>> See http://lists.debian.org/debian-user/2004/05/msg01434.html
>>
>> HTH,
>> M4
>
>
> Checked out the link. Actualy I'm not really planning to cache secure
> connections like ssl, I only wanted to be able to redirect that
> request to go directly to the internet (bypass squid).
>
> I currently have an iptable rule for that but it's currently not
> working right...


Ah, I see. How about

-A POSTROUTING -p tcp --dport 443 -j SNAT --to 192.168.100.2

Don't forget to turn on forwarding as well and create appropriate 
forwarding rules.

Personally I would set this firewall between your clients and the 
Internet, in that case you don't need SNAT tricks, just basic FORWARDING 
rules.

M4

