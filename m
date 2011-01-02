From: "J Webster" <webster_jack@hotmail.com>
Subject: Re: limit badwidth not working
Date: Sun, 2 Jan 2011 19:56:09 +0100
Message-ID: <BAY145-ds5C3BBAA43F81403C352D7F3060@phx.gbl>
References: <BAY145-ds40063ED1096C32DC63795F3710@phx.gbl> <BAY145-ds9975844F1691A3B9C49EAF3010@phx.gbl> <1293898085.1601.29.camel@andybev> <BAY145-ds16C678B220343FEE352F61F3060@phx.gbl> <1293986600.1936.46.camel@steve-pc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1293986600.1936.46.camel@steve-pc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

So 1:10, 1:20, 1:30 are the subclasses and I need 1 subcalss for every ip 
address?
I can set a max number connections on the openvpn server so say there are 20 
connections then I need to repeat the following 20 times?


$U32 match ip dst 10.0.8.1 flowid 1:10
all the way to
$U32 match ip dist 10.0.8.20 flowid 1:200 (not the 200 here for 20th 
subclass)?

Would subclass 1:10, 1:11, 1:12, 1:13 do the same?

It seems like the above will work when you know what the IP addresses are 
going to be on a VPN network. So, I don't need to know or care what the 
client's WAN IP address is to control the speed if they are connected via a 
VPN? 

