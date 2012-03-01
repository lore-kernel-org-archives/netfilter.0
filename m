From: John Lister <john.lister@kickstone.com>
Subject: Re: IPTABLES Setup for Internal Intranet
Date: Thu, 01 Mar 2012 20:19:06 +0000
Message-ID: <4F4FD9BA.7010906@kickstone.com>
References: <CAFURDX_e4eU8nKFSmweCKP_LaE9z_8S2cZrk93_r0UnKXGeYjA@mail.gmail.com> <CAFURDX93mPW2capiuwB5vL8MP3hNEW3xHT85O=xEBKY8_Ew3Rg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFURDX93mPW2capiuwB5vL8MP3hNEW3xHT85O=xEBKY8_Ew3Rg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: John Corps <envoys@gmail.com>
Cc: netfilter@vger.kernel.org

On 01/03/2012 20:07, John Corps wrote:
> Hello All,
>
> I am attempting what is seeming to be an impossible scenario for some
> unknown reason. What I want to do is setup a web server in a an
> isolated vlan and on this vlan, the server is handing out IP addresses
> via dhcp to the clients and setting there gateway to this server. What
> I want to do is now, how do i make it so no matter what address they
> try and go to using a browser, they are automatically redirected to
> the internal web server saying that they do not have access to this
> network. I have tried with a clean install of Debian and doing 1
> single iptables rule of:
>
> iptables -t nat -A PREROUTING -s 192.168.0.0/255.255.255.0 -p tcp -m
> tcp --dport 80 -j DNAT --to-destination 192.168.0.1
>
> Which should redirect all traffic going to port 80 to the internal web
> server at 192.168.0.1.
>
> This isn't working, but on the client I can go to http://192.168.0.1
> and get the page saying they have no access.
>
> Am i missing something here or should this work? if it should work,
> can anyone try and help as to why it doesn't?
>
I would imagine you'd need a similar SNAT rule to do the reverse. Any 
packet redirected to your internal server would to that server appear to 
come from your internal network so the reply packet will be sent direct 
and not via your router/iptables box. Therefore the client would see a 
packet coming from a different address to the one it sent the original 
to and ignore it. Doing a SNAT from the iptables box on those packets 
using the router address as the source should work..

John

-- 
www.pricegoblin.co.uk

