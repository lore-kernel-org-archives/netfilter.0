From: Andrew Beverley <andy@andybev.com>
Subject: Re: Make a redirect if NAT out interface is down
Date: Sun, 04 Mar 2012 20:04:08 +0000
Message-ID: <1330891448.30413.347.camel@andrew-desktop>
References: <4F515C9B.3030209@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F515C9B.3030209@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1330891450;
	bh=r6s06zeNxTUprRBsIEe1GbGvG7WAAOegI0JmdQugzuA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:Mime-Version;
	b=YI4OShUnodT0ENQ4jtoRnJl+RwiiduFnQf2NuxO2hDblIeZxVR63Y4vwQqkdsVBFd
	 sTjtVNWPJhw/xmDYu3EhDXzamfjTxnESDEuhzjt/tObaZhLVJriK6GzKWO41GGIUuM
	 1q3q6TeCR+VA1jyGZl/hqYKq9ffXFQHF9EaWah7c=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "cmlitguy@gmail.com" <cmlitguy@gmail.com>
Cc: netfilter@vger.kernel.org

On Sat, 2012-03-03 at 01:49 +0200, cmlitguy@gmail.com wrote:
> Hello,
> I have a question about possibility of making a redirect if  NAT out 
> interface tun0 is down.
> This is iptables rule for Masquerading our network via VPN connection.
> 
> iptables  --table  nat  --append  POSTROUTING  --out-interface  tun0  -j  MASQUERADE  -m  comment  --comment  "Masquerading"
> 
> When VPN goes down, we can't access some resources and we need to verify 
> its status and establish it again.
> Is it possible to make a redirect of all traffic to another host - Web 
> Site(via IP address) of tun0 is down ?

If the interface actually does "down", then I would use your operating
system's networking scripts to run a "down" script. E.g. for Debian
use /etc/network/interfaces

If it just stops responding, then I'd consider LSM[1] to monitor it and
do something similar.

[1] http://lsm.foobar.fi/


