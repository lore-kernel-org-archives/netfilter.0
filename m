From: Andrew Beverley <andy@andybev.com>
Subject: Re: Bittorrent blocking
Date: Wed, 20 Feb 2013 17:45:19 +0000
Message-ID: <1361382319.1694.6.camel@andrew-desktop>
References: <51249E58.1080307@stidia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <51249E58.1080307@stidia.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1361382351;
	bh=l5iLlu42Vncdf7eBS2dGmxN8gQlAS6Y2W/ImVT96hPI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=edQXijvllxkIWXkhRMVHZFoxggw8IpyBCibdPQlrk28zF+ML9jKvM1LY5pnG7Nfw/
	 kUn6Pq+cXSW8hUuwIFGz9SgoTKJUdGb3PzOnp9cSn170E34qTW/3bvynz/vKeuswwv
	 gIqg3TMzE6G2eS5z4s7W9ltYZTfFTcBuNmgCozjs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dmitry.korzhevin@stidia.com
Cc: netfilter@vger.kernel.org

On Wed, 2013-02-20 at 11:58 +0200, Dmitry Korzhevin wrote:
> Guys, i understand, that this is too frequent question, and i'm already 
> made solid investigation in google, but.. mabe you already have good 
> iptables rules to block such type of traffic (Bittorrent), or maby you 
> can give advice.

What's your reason for blocking? Is it just to stop excessive use of
bandwidth? If so, I'd recommend shaping the traffic instead of blocking,
otherwise you just create an arms race whereby users will try and get
around your blocks (and it's unlikely any block will be perfect).

I've had quite good success with some rudimentary detection rules that
just look for lots of traffic to lots of high port numbers. I wrote it
up here:

http://www.andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_local_network_using_Linux

I've not updated the page for a while, but the concept should still work
even if you need to adjust the rules.

Andy


